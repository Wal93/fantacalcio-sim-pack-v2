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
import { Body, Controller, Param, Post, Req } from '@nestjs/common';
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
let FormationController = class FormationController {
    constructor(db) {
        this.db = db;
    }
    async upsert(req, leagueId, body) {
        const uid = auth(req);
        if (!uid)
            return { status: 'error', error: 'unauthorized' };
        const { fantasy_team_id, giornata_id, module, starters, bench, auto_sub } = body;
        const r = await this.db.client.query(`INSERT INTO formations(fantasy_team_id, giornata_id, module, starters, bench, auto_sub, status)
       VALUES($1,$2,$3,$4::jsonb,$5::jsonb,$6,'draft') RETURNING id`, [fantasy_team_id, giornata_id, module || '4-3-3', JSON.stringify(starters || []), JSON.stringify(bench || []), auto_sub ?? true]);
        return { status: 'ok', data: { formazione_id: r.rows[0].id, stato: 'draft' } };
    }
    async lock(req, leagueId, formazioneId) {
        const uid = auth(req);
        if (!uid)
            return { status: 'error', error: 'unauthorized' };
        await this.db.client.query("UPDATE formations SET status='locked', locked_at=NOW() WHERE id=$1", [formazioneId]);
        return { status: 'ok' };
    }
};
__decorate([
    Post(':leagueId/formazione'),
    __param(0, Req()),
    __param(1, Param('leagueId')),
    __param(2, Body()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, String, Object]),
    __metadata("design:returntype", Promise)
], FormationController.prototype, "upsert", null);
__decorate([
    Post(':leagueId/formazione/:formazioneId/lock'),
    __param(0, Req()),
    __param(1, Param('leagueId')),
    __param(2, Param('formazioneId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, String, String]),
    __metadata("design:returntype", Promise)
], FormationController.prototype, "lock", null);
FormationController = __decorate([
    Controller('leagues'),
    __metadata("design:paramtypes", [DbService])
], FormationController);
export { FormationController };
