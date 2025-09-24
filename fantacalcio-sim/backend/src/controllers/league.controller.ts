import { Body, Controller, Get, Param, Post, Req } from '@nestjs/common';
import { DbService } from '../services/db.service.js';
import jwt from 'jsonwebtoken';
function auth(req:any): number|null {
  const a = req.headers['authorization'];
  if (!a) return null;
  const token = (a as string).replace('Bearer ', '');
  try { const d:any = jwt.verify(token, process.env.JWT_SECRET || 'secret'); return d.sub; } catch { return null; }
}
@Controller('leagues')
export class LeagueController {
  constructor(private readonly db: DbService) {}
  @Post()
  async create(@Req() req:any, @Body() body:any) {
    const uid = auth(req);
    if (!uid) return { status:'error', error:'unauthorized' };
    const { name } = body;
    const r = await this.db.client.query(
      'INSERT INTO leghe(nome, commissario_id, regole_snapshot) VALUES($1,$2,$3) RETURNING id',
      [name, uid, {}]
    );
    return { status:'ok', data:{ league_id: r.rows[0].id } };
  }
  @Post(':id/teams')
  async createTeam(@Req() req:any, @Param('id') id:string, @Body() body:any) {
    const uid = auth(req);
    if (!uid) return { status:'error', error:'unauthorized' };
    const { name, logo_url } = body;
    const r = await this.db.client.query(
      'INSERT INTO squadre_fantasy(lega_id, utente_id, nome, logo_url) VALUES($1,$2,$3,$4) RETURNING id',
      [id, uid, name, logo_url || null]
    );
    const teamId = r.rows[0].id;
    const players = await this.db.client.query("SELECT id FROM giocatori_reali ORDER BY random() LIMIT 15");
    for (const p of players.rows) {
      await this.db.client.query("INSERT INTO rose(squadra_fantasy_id, giocatore_reale_id) VALUES($1,$2) ON CONFLICT DO NOTHING", [teamId, p.id]);
    }
    return { status:'ok', data:{ team_id: teamId } };
  }
  @Get(':id/classifica')
  async classifica(@Param('id') id:string) {
    const r = await this.db.client.query(`
      SELECT sf.nome, 
             COALESCE(SUM(CASE WHEN pl.risultato='H' AND pl.squadra_casa_id=sf.id THEN 3
                               WHEN pl.risultato='A' AND pl.squadra_trasferta_id=sf.id THEN 3
                               WHEN pl.risultato='D' THEN 1 ELSE 0 END), 0) as punti,
             COALESCE(SUM(CASE WHEN pl.squadra_casa_id=sf.id THEN pl.gol_casa
                      WHEN pl.squadra_trasferta_id=sf.id THEN pl.gol_trasferta ELSE 0 END), 0) as gf,
             COALESCE(SUM(CASE WHEN pl.squadra_casa_id=sf.id THEN pl.gol_trasferta
                      WHEN pl.squadra_trasferta_id=sf.id THEN pl.gol_casa ELSE 0 END), 0) as gs
      FROM squadre_fantasy sf
      LEFT JOIN partite_leghe pl ON pl.lega_id=$1 AND (pl.squadra_casa_id=sf.id OR pl.squadra_trasferta_id=sf.id)
      WHERE sf.lega_id=$1
      GROUP BY sf.id, sf.nome
      ORDER BY 2 DESC, (3-4) DESC, 3 DESC
    `, [id]);
    return { status:'ok', data: r.rows };
  }
}
