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
import { SimService } from '../services/sim.service.js';
let ClassificaController = class ClassificaController {
    constructor(sim) {
        this.sim = sim;
    }
    async simulate(body) {
        const { giornata_id } = body;
        const ev = process.env.ENGINE_VERSION || '1.0.0';
        const res = await this.sim.runGiornata(giornata_id || 1, ev);
        return { status: 'ok', data: res };
    }
};
__decorate([
    Post('simulate'),
    __param(0, Body()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], ClassificaController.prototype, "simulate", null);
ClassificaController = __decorate([
    Controller('admin'),
    __metadata("design:paramtypes", [SimService])
], ClassificaController);
export { ClassificaController };
