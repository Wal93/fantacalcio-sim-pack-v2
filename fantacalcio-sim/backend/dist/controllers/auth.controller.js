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
import { Body, Controller, Post } from '@nestjs/common';
import { DbService } from '../services/db.service.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
let AuthController = class AuthController {
    constructor(db) {
        this.db = db;
    }
    async register(body) {
        const { email, password } = body;
        if (!email || !password)
            return { status: 'error', error: 'email/password richiesti' };
        const hash = await bcrypt.hash(password, 10);
        await this.db.client.query('INSERT INTO utenti(email, password_hash) VALUES($1,$2) ON CONFLICT (email) DO NOTHING', [email, hash]);
        return { status: 'ok' };
    }
    async login(body) {
        const { email, password } = body;
        const r = await this.db.client.query('SELECT id, password_hash, ruolo FROM utenti WHERE email=$1', [email]);
        if (!r.rows.length)
            return { status: 'error', error: 'utente non trovato' };
        const ok = await bcrypt.compare(password, r.rows[0].password_hash);
        if (!ok)
            return { status: 'error', error: 'password errata' };
        const secret = process.env.JWT_SECRET || 'secret';
        const token = jwt.sign({ sub: r.rows[0].id, role: r.rows[0].ruolo }, secret, { expiresIn: '15m' });
        return { status: 'ok', data: { access_token: token } };
    }
};
__decorate([
    Post('register'),
    __param(0, Body()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "register", null);
__decorate([
    Post('login'),
    __param(0, Body()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], AuthController.prototype, "login", null);
AuthController = __decorate([
    Controller('auth'),
    __metadata("design:paramtypes", [DbService])
], AuthController);
export { AuthController };
