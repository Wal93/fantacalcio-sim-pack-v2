import { Body, Controller, Post } from '@nestjs/common';
import { SimService } from '../services/sim.service.js';
import { DbService } from '../services/db.service.js';

@Controller('admin')
export class ClassificaController {
  constructor(
    private readonly sim: SimService,
    private readonly db: DbService
  ) {}

  @Post('simulate')
  async simulate(@Body() body:any) {
    const { giornata_id } = body;
    const ev = process.env.ENGINE_VERSION || '1.0.0';
    const res = await this.sim.runGiornata(giornata_id || 1, ev);
    return { status:'ok', data: res };
  }

  @Post('update-team-values')
  async updateTeamValues(@Body() body: any) {
    const { team_name, valore_attacco, valore_difesa, valore_ritmo } = body;
    
    if (!team_name) {
      return { status: 'error', error: 'Nome squadra mancante' };
    }

    try {
      await this.db.query(`
        UPDATE squadre_reali 
        SET valore_attacco = $2, valore_difesa = $3, valore_ritmo = $4
        WHERE UPPER(nome) = UPPER($1)
      `, [team_name, valore_attacco || 0.55, valore_difesa || 0.55, valore_ritmo || 0.55]);
      
      return { status: 'ok', message: `Valori aggiornati per ${team_name}` };
    } catch (error) {
      console.error('Errore aggiornamento valori squadra:', error);
      return { status: 'error', error: 'Errore durante aggiornamento' };
    }
  }
}
