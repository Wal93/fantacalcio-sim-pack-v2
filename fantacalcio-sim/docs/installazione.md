# Guida di installazione (Pack Go-Live)

## Prerequisiti
- Docker + Docker Compose
- Git

## Passi rapidi
```bash
git clone <repo> fantacalcio-sim
cd fantacalcio-sim
cp .env.example .env
docker compose -f infra/docker-compose.prod.yml up -d --build
docker exec -it backend npm run db:migrate
docker exec -it backend npm run db:seed
```
Apri http://localhost:3000
