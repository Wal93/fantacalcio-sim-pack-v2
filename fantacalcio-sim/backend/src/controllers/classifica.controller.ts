import { Body, Controller, Post } from '@nestjs/common';
import { SimService } from '../services/sim.service.js';
@Controller('admin')
export class ClassificaController {
  constructor(private readonly sim: SimService) {}
  @Post('simulate')
  async simulate(@Body() body:any) {
    const { giornata_id } = body;
    const ev = process.env.ENGINE_VERSION || '1.0.0';
    const res = await this.sim.runGiornata(giornata_id || 1, ev);
    return { status:'ok', data: res };
  }
}
