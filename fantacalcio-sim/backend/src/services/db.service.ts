import { Injectable } from '@nestjs/common';
import { Client } from 'pg';

@Injectable()
export class DbService {
  client: Client;

  constructor() {
    const cs = process.env.DATABASE_URL || `postgres://${process.env.PGUSER}:${process.env.PGPASSWORD}@${process.env.PGHOST}:${process.env.PGPORT}/${process.env.PGDATABASE}`;
    this.client = new Client({ connectionString: cs });
    this.client.connect();
  }

  async query(text: string, params?: any[]) {
    return this.client.query(text, params);
  }

  async close() {
    return this.client.end();
  }
}
