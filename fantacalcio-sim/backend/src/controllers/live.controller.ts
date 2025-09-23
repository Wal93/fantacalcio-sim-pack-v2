import { Controller, Get, Post, Body, Param, BadRequestException } from '@nestjs/common';
import { DbService } from '../services/db.service.js';

@Controller('live')
export class LiveController {
  private matchStates = new Map();
  private matchTimers = new Map();

  constructor(private dbService: DbService) {}

  @Post('start-match')
  async startMatch(@Body() body: any) {
    const { lega_id, squadra_casa_id, squadra_trasferta_id } = body;

    try {
      // Recupera squadre dalla lega
      const squadraCasa = await this.dbService.query(
        'SELECT sf.id, sf.nome, u.nome as proprietario FROM squadre_fantasy sf JOIN utenti u ON sf.utente_id = u.id WHERE sf.id = $1',
        [squadra_casa_id]
      );

      const squadraTrasferta = await this.dbService.query(
        'SELECT sf.id, sf.nome, u.nome as proprietario FROM squadre_fantasy sf JOIN utenti u ON sf.utente_id = u.id WHERE sf.id = $1',
        [squadra_trasferta_id]
      );

      if (!squadraCasa.rows[0] || !squadraTrasferta.rows[0]) {
        throw new BadRequestException('Squadre non trovate');
      }

      // Crea nuovo match
      const matchResult = await this.dbService.query(
        'INSERT INTO partite_leghe (lega_id, squadra_casa_id, squadra_trasferta_id, data_match, stato) VALUES ($1, $2, $3, NOW(), $4) RETURNING id',
        [lega_id, squadra_casa_id, squadra_trasferta_id, 'in_corso']
      );

      const matchId = matchResult.rows[0].id.toString();

      // Inizializza stato match
      const matchState = {
        match_id: matchId,
        lega_id,
        squadre: {
          casa: squadraCasa.rows[0],
          trasferta: squadraTrasferta.rows[0]
        },
        risultato: { casa: 0, trasferta: 0 },
        minuto_corrente: 0,
        partita_finita: false,
        tempo_rimanente_ms: 300000,
        statistiche: {
          eventi_totali: 0,
          prossimo_evento_in: 15000
        }
      };

      this.matchStates.set(matchId, matchState);
      this.startTimer(matchId);

      return { success: true, match_id: matchId };

    } catch (error) {
      throw new BadRequestException('Errore avvio match: ' + error.message);
    }
  }

  @Get('match-status/:matchId')
  getMatchStatus(@Param('matchId') matchId: string) {
    const state = this.matchStates.get(matchId);
    if (!state) {
      throw new BadRequestException('Match non trovato');
    }
    return state;
  }

  @Get('events/:matchId')
  async getEvents(@Param('matchId') matchId: string) {
    try {
      const result = await this.dbService.query(
        'SELECT * FROM eventi WHERE match_id = $1 ORDER BY minuto ASC',
        [matchId]
      );
      return result.rows;
    } catch (error) {
      return [];
    }
  }

  private startTimer(matchId: string) {
    const timer = setInterval(() => {
      const state = this.matchStates.get(matchId);
      if (!state || state.partita_finita) {
        clearInterval(timer);
        return;
      }

      state.minuto_corrente += 1;
      state.tempo_rimanente_ms -= 3333;

      // Genera eventi casuali
      if (Math.random() < 0.25) {
        this.generateEvent(matchId);
      }

      // Fine partita a 90 minuti
      if (state.minuto_corrente >= 90) {
        state.partita_finita = true;
        state.tempo_rimanente_ms = 0;
        this.finishMatch(matchId);
        clearInterval(timer);
      }

    }, 3333); // 3.33 secondi = 1 minuto di gioco

    this.matchTimers.set(matchId, timer);
  }

  private async generateEvent(matchId: string) {
    const state = this.matchStates.get(matchId);
    if (!state) return;

    const events = [
      { tipo: 'goal', emoji: '⚽', desc: 'Gol!', punti: 3 },
      { tipo: 'assist', emoji: '👟', desc: 'Assist', punti: 1 },
      { tipo: 'cartellino', emoji: '🟨', desc: 'Ammonizione', punti: -0.5 }
    ];

    const event = events[Math.floor(Math.random() * events.length)];
    const lato = Math.random() < 0.5 ? 'casa' : 'trasferta';
    const giocatori = ['Osimhen', 'Lautaro', 'Vlahovic', 'Immobile', 'Barella'];
    const squadre = ['Napoli', 'Inter', 'Juventus', 'Lazio', 'Roma'];

    if (event.tipo === 'goal') {
      if (lato === 'casa') state.risultato.casa += 1;
      else state.risultato.trasferta += 1;
    }

    try {
      await this.dbService.query(
        'INSERT INTO eventi (match_id, minuto, giocatore_nome, squadra_reale, lato, tipo_evento, descrizione, emoji, punti_fantasy) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)',
        [
          matchId,
          state.minuto_corrente,
          giocatori[Math.floor(Math.random() * giocatori.length)],
          squadre[Math.floor(Math.random() * squadre.length)],
          lato,
          event.tipo,
          event.desc,
          event.emoji,
          event.punti
        ]
      );

      state.statistiche.eventi_totali += 1;
    } catch (error) {
      console.error('Errore evento:', error);
    }
  }

  private async finishMatch(matchId: string) {
    const state = this.matchStates.get(matchId);
    if (!state) return;

    try {
      await this.dbService.query(
        'UPDATE partite_leghe SET stato = $1, risultato_casa = $2, risultato_trasferta = $3, data_fine = NOW() WHERE id = $4',
        ['completata', state.risultato.casa, state.risultato.trasferta, matchId]
      );
    } catch (error) {
      console.error('Errore finalizzazione:', error);
    }
  }
}
