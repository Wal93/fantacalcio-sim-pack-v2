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
import { Controller, Get, Query } from '@nestjs/common';
import { DbService } from '../services/db.service.js';
let LiveController = class LiveController {
    constructor(db) {
        this.db = db;
    }
    async getMatch(giornataId) {
        const gid = parseInt(giornataId || '1');
        let matchRow = null;
        let usingFixtures = false;
        const m = await this.db.client.query(`
      SELECT ps.id as match_id, ps.squadra_casa_id, ps.squadra_trasferta_id, sr1.nome as home_name, sr2.nome as away_name
      FROM partite_simulate ps
      JOIN squadre_reali sr1 ON sr1.id = ps.squadra_casa_id
      JOIN squadre_reali sr2 ON sr2.id = ps.squadra_trasferta_id
      WHERE ps.giornata_id = $1
      ORDER BY ps.id ASC LIMIT 1
    `, [gid]);
        if (m.rows.length)
            matchRow = m.rows[0];
        else {
            usingFixtures = true;
            const f = await this.db.client.query(`
        SELECT c.id as fixture_id, c.squadra_casa_id, c.squadra_trasferta_id, sr1.nome as home_name, sr2.nome as away_name
        FROM calendario c
        JOIN squadre_reali sr1 ON sr1.id = c.squadra_casa_id
        JOIN squadre_reali sr2 ON sr2.id = c.squadra_trasferta_id
        WHERE c.giornata_id = $1
        ORDER BY c.id ASC LIMIT 1
      `, [gid]);
            if (!f.rows.length)
                return { status: 'error', error: 'nessun match trovato per la giornata' };
            matchRow = f.rows[0];
        }
        const homePlayers = await this.db.client.query("SELECT id, nome, ruolo FROM giocatori_reali WHERE squadra_id=$1 ORDER BY id ASC LIMIT 11", [matchRow.squadra_casa_id]);
        const awayPlayers = await this.db.client.query("SELECT id, nome, ruolo FROM giocatori_reali WHERE squadra_id=$1 ORDER BY id ASC LIMIT 11", [matchRow.squadra_trasferta_id]);
        const slots433Home = [
            { x: 5, y: 50 },
            { x: 20, y: 20 }, { x: 22, y: 40 }, { x: 22, y: 60 }, { x: 20, y: 80 },
            { x: 40, y: 25 }, { x: 42, y: 50 }, { x: 40, y: 75 },
            { x: 65, y: 25 }, { x: 70, y: 50 }, { x: 65, y: 75 },
        ];
        const slots433Away = [
            { x: 95, y: 50 },
            { x: 80, y: 20 }, { x: 78, y: 40 }, { x: 78, y: 60 }, { x: 80, y: 80 },
            { x: 60, y: 25 }, { x: 58, y: 50 }, { x: 60, y: 75 },
            { x: 35, y: 25 }, { x: 30, y: 50 }, { x: 35, y: 75 },
        ];
        const mapPlayers = (rows, slots) => rows.map((p, i) => ({
            id: p.id, name: p.nome, role: p.ruolo, x: slots[i]?.x ?? 50, y: slots[i]?.y ?? 50
        }));
        return {
            status: 'ok',
            data: {
                match_id: matchRow.match_id || matchRow.fixture_id,
                giornata_id: gid,
                using_fixtures: usingFixtures,
                home: { team_id: matchRow.squadra_casa_id, name: matchRow.home_name, players: mapPlayers(homePlayers.rows, slots433Home) },
                away: { team_id: matchRow.squadra_trasferta_id, name: matchRow.away_name, players: mapPlayers(awayPlayers.rows, slots433Away) }
            }
        };
    }
};
__decorate([
    Get('match'),
    __param(0, Query('giornata_id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String]),
    __metadata("design:returntype", Promise)
], LiveController.prototype, "getMatch", null);
LiveController = __decorate([
    Controller('live'),
    __metadata("design:paramtypes", [DbService])
], LiveController);
export { LiveController };
