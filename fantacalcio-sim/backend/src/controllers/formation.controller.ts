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
export class FormationController {
  constructor(private readonly db: DbService) {}

  @Get(':leagueId/formazioni/:squadraCasaId/:squadraTrasfertaId')
  async getFormazioni(@Req() req:any, @Param('leagueId') leagueId:string, @Param('squadraCasaId') squadraCasaId:string, @Param('squadraTrasfertaId') squadraTrasfertaId:string) {
    try {
      // Prende formazioni per la giornata corrente (defaulto a 1)
      const giornataId = 1;
      
      const formazioniResult = await this.db.client.query(`
        SELECT 
          ff.id,
          ff.squadra_fantasy_id,
          ff.modulo,
          ff.titolari,
          ff.panchina,
          sf.nome as squadra_nome,
          sf.utente_id,
          u.email as proprietario_email
        FROM formazioni_fantasy ff
        JOIN squadre_fantasy sf ON sf.id = ff.squadra_fantasy_id
        JOIN utenti u ON u.id = sf.utente_id
        WHERE ff.giornata_id = $1 
        AND ff.squadra_fantasy_id IN ($2, $3)
        ORDER BY ff.squadra_fantasy_id
      `, [giornataId, squadraCasaId, squadraTrasfertaId]);

      // Se non ci sono formazioni, creo formazioni demo
      if (formazioniResult.rows.length === 0) {
        return {
          status: 'ok',
          data: {
            casa: {
              squadra_id: squadraCasaId,
              nome: 'Juventus FC',
              proprietario: 'Mario Rossi',
              modulo: '4-3-3',
              titolari: [
                { id: 1, nome: 'Szczesny', ruolo: 'P', x: 10, y: 50 },
                { id: 2, nome: 'Danilo', ruolo: 'D', x: 25, y: 20 },
                { id: 3, nome: 'Bremer', ruolo: 'D', x: 25, y: 40 },
                { id: 4, nome: 'Bonucci', ruolo: 'D', x: 25, y: 60 },
                { id: 5, nome: 'Alex Sandro', ruolo: 'D', x: 25, y: 80 },
                { id: 6, nome: 'Locatelli', ruolo: 'C', x: 45, y: 30 },
                { id: 7, nome: 'Rabiot', ruolo: 'C', x: 45, y: 70 },
                { id: 8, nome: 'McKennie', ruolo: 'C', x: 60, y: 50 },
                { id: 9, nome: 'Chiesa', ruolo: 'A', x: 75, y: 25 },
                { id: 10, nome: 'Vlahovic', ruolo: 'A', x: 85, y: 50 },
                { id: 11, nome: 'Di Maria', ruolo: 'A', x: 75, y: 75 }
              ],
              panchina: []
            },
            trasferta: {
              squadra_id: squadraTrasfertaId,
              nome: 'Inter FC',
              proprietario: 'Luigi Verdi',
              modulo: '3-5-2',
              titolari: [
                { id: 12, nome: 'Handanovic', ruolo: 'P', x: 90, y: 50 },
                { id: 13, nome: 'Skriniar', ruolo: 'D', x: 75, y: 25 },
                { id: 14, nome: 'De Vrij', ruolo: 'D', x: 75, y: 50 },
                { id: 15, nome: 'Bastoni', ruolo: 'D', x: 75, y: 75 },
                { id: 16, nome: 'Dumfries', ruolo: 'C', x: 55, y: 20 },
                { id: 17, nome: 'Barella', ruolo: 'C', x: 55, y: 45 },
                { id: 18, nome: 'Brozovic', ruolo: 'C', x: 55, y: 55 },
                { id: 19, nome: 'Perisic', ruolo: 'C', x: 55, y: 80 },
                { id: 20, nome: 'Lautaro', ruolo: 'A', x: 35, y: 40 },
                { id: 21, nome: 'Dzeko', ruolo: 'A', x: 35, y: 60 },
                { id: 22, nome: 'Correa', ruolo: 'A', x: 25, y: 50 }
              ],
              panchina: []
            }
          }
        };
      }

      // Processa formazioni dal DB
      const formazioni = { casa: null, trasferta: null };
      
      formazioniResult.rows.forEach(row => {
        const isHome = row.squadra_fantasy_id == squadraCasaId;
        const formazione = {
          squadra_id: row.squadra_fantasy_id,
          nome: row.squadra_nome,
          proprietario: row.proprietario_email.split('@')[0],
          modulo: row.modulo,
          titolari: Array.isArray(row.titolari) ? row.titolari : [],
          panchina: Array.isArray(row.panchina) ? row.panchina : []
        };
        
        if (isHome) {
          formazioni.casa = formazione;
        } else {
          formazioni.trasferta = formazione;
        }
      });

      return { status: 'ok', data: formazioni };
    } catch (error) {
      console.error('Errore caricamento formazioni:', error);
      return { status: 'error', error: 'Errore database' };
    }
  }

  @Post(':leagueId/formazione')
  async upsert(@Req() req:any, @Param('leagueId') leagueId:string, @Body() body:any) {
    const uid = auth(req);
    if (!uid) return { status:'error', error:'unauthorized' };
    const { squadra_fantasy_id, giornata_id, modulo, titolari, panchina, sostituzioni_auto } = body;
    
    try {
      const r = await this.db.client.query(
        `INSERT INTO formazioni_fantasy(squadra_fantasy_id, giornata_id, modulo, titolari, panchina, sostituzioni_auto, stato)
         VALUES($1,$2,$3,$4::jsonb,$5::jsonb,$6,'bozza') 
         ON CONFLICT (squadra_fantasy_id, giornata_id) 
         DO UPDATE SET modulo=$3, titolari=$4::jsonb, panchina=$5::jsonb, sostituzioni_auto=$6 
         RETURNING id`,
        [squadra_fantasy_id, giornata_id, modulo || '4-3-3', JSON.stringify(titolari||[]), JSON.stringify(panchina||[]), sostituzioni_auto ?? true]
      );
      return { status:'ok', data:{ formazione_id: r.rows[0].id, stato:'bozza' } };
    } catch (error) {
      console.error('Errore salvataggio formazione:', error);
      return { status: 'error', error: 'Errore database' };
    }
  }

  @Post(':leagueId/formazione/:formazioneId/lock')
  async lock(@Req() req:any, @Param('leagueId') leagueId:string, @Param('formazioneId') formazioneId:string) {
    const uid = auth(req);
    if (!uid) return { status:'error', error:'unauthorized' };
    
    try {
      await this.db.client.query("UPDATE formazioni_fantasy SET stato='bloccata', bloccata_il=NOW() WHERE id=$1", [formazioneId]);
      return { status:'ok' };
    } catch (error) {
      console.error('Errore blocco formazione:', error);
      return { status: 'error', error: 'Errore database' };
    }
  }
}
