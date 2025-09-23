var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
import { WebSocketGateway, WebSocketServer } from '@nestjs/websockets';
import { Server } from 'socket.io';
import { DbService } from '../services/db.service.js';
let LiveGateway = class LiveGateway {
    constructor(db) {
        this.db = db;
        this.startTimes = new Map();
    }
    async handleConnection(client) {
        const giornataId = parseInt(client.handshake.query.giornata_id || '1');
        if (!this.startTimes.has(giornataId))
            this.startTimes.set(giornataId, Date.now());
        const start = this.startTimes.get(giornataId);
        const interval = setInterval(async () => {
            const elapsed = Math.floor((Date.now() - start) / 1000);
            const r = await this.db.client.query("SELECT id, match_id, minute, second_real_time, type, team, player_id, assist_id, fantapoints_delta, x, y FROM events WHERE second_real_time <= $1 ORDER BY second_real_time ASC LIMIT 10", [elapsed]);
            for (const e of r.rows)
                this.server.to(client.id).emit('event', e);
            if (elapsed >= 300) {
                this.server.to(client.id).emit('event', { type: 'full_time', giornata_id: giornataId });
                clearInterval(interval);
            }
        }, 1000);
        client.on('disconnect', () => clearInterval(interval));
    }
};
__decorate([
    WebSocketServer(),
    __metadata("design:type", Server)
], LiveGateway.prototype, "server", void 0);
LiveGateway = __decorate([
    WebSocketGateway({ cors: { origin: '*' } }),
    __metadata("design:paramtypes", [DbService])
], LiveGateway);
export { LiveGateway };
