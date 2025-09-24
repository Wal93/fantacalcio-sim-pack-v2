import { Body, Controller, Post } from '@nestjs/common';
import { DbService } from '../services/db.service.js';
import jwt from 'jsonwebtoken';
@Controller('auth')
export class AuthController {
  constructor(private readonly db: DbService) {}
  @Post('register')
  async register(@Body() body: any) {
    const { email, password } = body;
    if (!email || !password) return { status:'error', error:'email/password richiesti' };
    const bcrypt = await import('bcryptjs');
    const hash = await bcrypt.default.hash(password, 10);
    await this.db.client.query('INSERT INTO utenti(email, password_hash) VALUES($1,$2) ON CONFLICT (email) DO NOTHING', [email, hash]);
    return { status:'ok' };
  }
  @Post('login')
  async login(@Body() body:any) {
    const { email, password } = body;
    const r = await this.db.client.query('SELECT id, password_hash, ruolo FROM utenti WHERE email=$1', [email]);
    if (!r.rows.length) return { status:'error', error:'utente non trovato' };
    const bcrypt = await import('bcryptjs');
    const ok = await bcrypt.default.compare(password, r.rows[0].password_hash);
    if (!ok) return { status:'error', error:'password errata' };
    const secret = process.env.JWT_SECRET || 'secret';
    const token = jwt.sign({ sub: r.rows[0].id, role: r.rows[0].ruolo }, secret, { expiresIn: '15m' });
    return { status:'ok', data: { access_token: token } };
  }
}
