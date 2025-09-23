import 'reflect-metadata';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module.js';
import dotenv from 'dotenv';
import cors from 'cors';
import rateLimit from 'express-rate-limit';
dotenv.config();
async function bootstrap() {
  const app = await NestFactory.create(AppModule, { cors: true });
  app.use(cors());
  app.use(rateLimit({ windowMs: 60_000, max: 100 }));
  const port = 4000;
  await app.listen(port);
  console.log(`Backend API listening on http://0.0.0.0:${port}`);
}
bootstrap();
