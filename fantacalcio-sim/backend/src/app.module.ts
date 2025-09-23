import { Module } from '@nestjs/common';
import { HealthController } from './controllers/health.controller.js';
import { AuthController } from './controllers/auth.controller.js';
import { LeagueController } from './controllers/league.controller.js';
import { FormationController } from './controllers/formation.controller.js';
import { ClassificaController } from './controllers/classifica.controller.js';
import { LiveController } from './controllers/live.controller.js';
import { LiveGateway } from './gateways/live.gateway.js';
import { DbService } from './services/db.service.js';
import { SimService } from './services/sim.service.js';
@Module({
  imports: [],
  controllers: [HealthController, AuthController, LeagueController, FormationController, ClassificaController, LiveController],
  providers: [DbService, SimService, LiveGateway],
})
export class AppModule {}
