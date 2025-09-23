var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
import { Body, Controller, Get, Param, Post, Req } from '@nestjs/common';
import { DbService } from '../services/db.service.js';
import jwt from 'jsonwebtoken';
function auth(req) {
    const a = req.headers['authorization'];
    if (!a)
        return null;
    const token = a.replace('Bearer ', '');
    try {
        const d = jwt.verify(token, process.env.JWT_SECRET || 'secret');
        return d.sub;
    }
    catch {
        return null;
    }
}
let LeagueController = class LeagueController {
    constructor(db) {
        this.db = db;
    }
    async create(req, body) {
        const uid = auth(req);
        if (!uid)
            return { status: 'error', error: 'unauthorized' };
        const { name } = body;
        const r = await this.db.client.query('INSERT INTO leghe(nome, commissario_id, regole_snapshot) VALUES($1,$2,$3) RETURNING id', [name, uid, {}]);
        return { status: 'ok', data: { league_id: r.rows[0].id } };
    }
    async createTeam(req, id, body) {
        const uid = auth(req);
        if (!uid)
            return { status: 'error', error: 'unauthorized' };
        const { name, logo_url } = body;
        const r = await this.db.client.query('INSERT INTO squadre_fantasy(lega_id, utente_id, nome, logo_url) VALUES($1,$2,$3,$4) RETURNING id', [id, uid, name, logo_url || null]);
        const teamId = r.rows[0].id;
        const players = await this.db.client.query("SELECT id FROM giocatori_reali ORDER BY random() LIMIT 15");
        for (const p of players.rows) {
            await this.db.client.query("INSERT INTO rose(squadra_fantasy_id, giocatore_reale_id) VALUES($1,$2) ON CONFLICT DO NOTHING", [teamId, p.id]);
        }
        return { status: 'ok', data: { team_id: teamId } };
    }
    async classifica(id) {
        const r = await this.db.client.query(`
      SELECT sf.nome, SUM(CASE WHEN pl.risultato='H' AND pl.squadra_casa_id=sf.id THEN 3
                               WHEN pl.risultato='A' AND pl.squadra_trasferta_id=sf.id THEN 3
                               WHEN pl.risultato='D' THEN 1 ELSE 0 END) as punti,
             SUM(CASE WHEN pl.squadra_casa_id=sf.id THEN pl.gol_casa
                      WHEN pl.squadra_trasferta_id=sf.id THEN pl.gol_trasferta ELSE 0 END) as gf,
             SUM(CASE WHEN pl.squadra_casa_id=sf.id THEN pl.gol_trasferta
                      WHEN pl.squadra_trasferta_id=sf.id THEN pl.gol_casa ELSE 0 END) as gs
      FROM squadre_fantasy sf
      LEFT JOIN partite_leghe pl ON pl.lega_id=$1 AND (pl.squadra_casa_id=sf.id OR pl.squadra_trasferta_id=sf.id)
      WHERE sf.lega_id=$1
      GROUP BY sf.nome
      ORDER BY punti DESC, (gf-gs) DESC, gf DESC
    `, [id]);
        return { status: 'ok', data: r.rows };
    }
};
__decorate([
    Post(),
    __param(0, Req()),
    __param(1, Body()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", Promise)
], LeagueController.prototype, "create", null);
__decorate([
    Post(':id/teams'),
    __param(0, Req()),
    __param(1, Param('id')),
    __param(2, Body()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, String, Object]),
    __metadata("design:returntype", Promise)
], LeagueController.prototype, "createTeam", null);
__decorate([
    Get(':id/classifica'),
    __param(0, Param('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], LeagueController.prototype, "classifica", null);
LeagueController = __decorate([
    Controller('leagues'),
    __metadata("design:paramtypes", [DbService])
], LeagueController);
export { LeagueController };
