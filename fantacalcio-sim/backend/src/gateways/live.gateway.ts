import { WebSocketGateway, WebSocketServer, OnGatewayConnection } from '@nestjs/websockets';
import { Server } from 'socket.io';
import { DbService } from '../services/db.service.js';
@WebSocketGateway({ cors: { origin: '*' } })
export class LiveGateway implements OnGatewayConnection {
  @WebSocketServer() server: Server;
  startTimes: Map<number, number> = new Map();
  constructor(private readonly db: DbService){}
  async handleConnection(client: any) {
    const giornataId = parseInt((client.handshake.query.giornata_id as string) || '1');
    if (!this.startTimes.has(giornataId)) this.startTimes.set(giornataId, Date.now());
    const start = this.startTimes.get(giornataId)!;
    const interval = setInterval(async ()=>{
      const elapsed = Math.floor((Date.now() - start)/1000);
      const r = await this.db.client.query(
        "SELECT id, partita_id, minuto, secondo_reale, tipo, lato, giocatore_id, variazione_fantapunti, x, y FROM eventi WHERE secondo_reale <= $1 ORDER BY secondo_reale ASC LIMIT 10",
        [elapsed]
      );
      for (const e of r.rows) this.server.to(client.id).emit('event', e);
      if (elapsed >= 300) { this.server.to(client.id).emit('event', { type:'full_time', giornata_id: giornataId }); clearInterval(interval); }
    }, 1000);
    client.on('disconnect', ()=> clearInterval(interval));
  }
}
