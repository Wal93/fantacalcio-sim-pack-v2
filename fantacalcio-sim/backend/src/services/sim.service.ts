import { Injectable } from '@nestjs/common';
import axios from 'axios';
@Injectable()
export class SimService {
  async runGiornata(giornata_id: number, engine_version: string) {
    const url = process.env.SIM_ENGINE_URL || 'http://sim-engine:8000';
    const payload = {
      giornata_id,
      seme: `seed#${giornata_id}`,
      versione_motore: engine_version,
      parametri_snapshot: { clean_sheet_def: true, fattore_casa: 1.06, prob_rigore: 0.18 }
    };
    const res = await axios.post(`${url}/simula_giornata`, payload);
    return res.data;
  }
}
