# 🚀 Fantacalcio Sim - Guida Quick Start

## 📋 Prerequisiti
- Docker Desktop per Windows (DEVE essere avviato)
- Task (installato automaticamente)
- PowerShell (incluso in Windows)

## ⚡ Avvio Rapido

### Metodo 1: Con script run.ps1 (CONSIGLIATO)
```powershell
# Avvia tutto l'ambiente
.\run.ps1 up

# Solo per sviluppo (senza frontend)
.\run.ps1 up-dev

# Risolve problemi di connettività
.\run.ps1 restart-clean

# Mostra stato
.\run.ps1 status
```

### Metodo 2: Con Task diretto
```bash
# Prima volta: aggiungi Task al PATH
$env:PATH += ";$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Task.Task_Microsoft.Winget.Source_8wekyb3d8bbwe"

# Poi usa normalmente
task up
task status
```

### 🛠️ Risoluzione Problemi

Se hai errori di connettività come quelli che vedi nei log, prova:

```bash
# Restart pulito (risolve il 90% dei problemi)
task restart-clean

# Se ancora non funziona, usa lo script di fix
.\docker-fix.ps1
```

### 📊 Monitoraggio

```bash
# Stato dei servizi
task status

# Log in tempo reale
task logs

# Health check completo
task health
```

## 🔧 Risoluzione Problemi Comuni

### ❌ Errori "Impossibile trovare il file specificato"

Questi errori sono tipici di Docker Desktop su Windows. **Soluzione**:

1. **Prima opzione** (più veloce):
   ```bash
   task restart-clean
   ```

2. **Seconda opzione** (se la prima non basta):
   ```bash
   .\docker-fix.ps1
   # Scegli opzione 5 "Fix completo"
   ```

### ❌ Container che non si avviano

```bash
# Controlla lo stato
task status

# Rebuilda un servizio specifico
task rebuild SERVICE=backend
task rebuild SERVICE=frontend
```

### ❌ Problemi di database

```bash
# Reset completo del database
task db-reset

# O solo migrazione e seed
task db-setup
```

## 📚 Tutti i Comandi Disponibili

```bash
# Mostra tutti i comandi con descrizione
task help
```

### 📦 Gestione Environment
- `task up` - Avvia tutto l'ambiente
- `task up-dev` - Solo backend/database (per development)
- `task down` - Ferma tutti i servizi
- `task restart` - Restart normale
- `task restart-clean` - Restart pulito (consigliato per problemi)

### 📊 Monitoraggio
- `task status` - Stato servizi
- `task logs` - Log di tutti i servizi
- `task logs-service SERVICE=nome` - Log specifico
- `task health` - Health check completo

### 🗄️ Database
- `task db-setup` - Setup iniziale (migrate + seed)
- `task db-migrate` - Solo migrazioni
- `task db-seed` - Solo seed
- `task db-reset` - Reset completo (⚠️ cancella dati)

### 🔧 Sviluppo
- `task dev-frontend` - Frontend in dev mode
- `task dev-backend` - Backend in dev mode
- `task rebuild SERVICE=nome` - Rebuild servizio specifico

### 🧹 Manutenzione
- `task cleanup` - Cleanup completo Docker
- `task down-clean` - Ferma e rimuove tutto (⚠️ cancella dati)

## 🌐 URL Applicazione

Dopo `task up`, l'applicazione sarà disponibile su:

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:4000
- **Sim-Engine**: http://localhost:8000
- **PostgreSQL**: localhost:5432
- **Redis**: localhost:6379

## 🚨 Fix Problemi Docker Desktop

Lo script `docker-fix.ps1` risolve i problemi più comuni:

```powershell
.\docker-fix.ps1
```

Opzioni disponibili:
1. **Controlla stato** - Verifica se Docker funziona
2. **Riavvia Docker Desktop** - Restart completo di Docker Desktop
3. **Reset rete** - Pulisce reti e container
4. **Pulizia cache** - Libera spazio e cache
5. **Fix completo** - Tutto insieme (consigliato)

## 💡 Consigli per Performance

1. **Assicurati che Docker Desktop abbia abbastanza risorse**:
   - Settings → Resources → Memory: almeno 4GB
   - CPU: almeno 2 core

2. **Se i problemi persistono**:
   ```bash
   # Restart completo del sistema Docker
   .\docker-fix.ps1  # Opzione 5
   task up
   ```

3. **Per development quotidiano**:
   ```bash
   # Usa up-dev per avere solo i servizi necessari
   task up-dev
   ```

## 🆘 Se Nulla Funziona

1. Riavvia Docker Desktop completamente
2. Esegui `.\docker-fix.ps1` (opzione 5)
3. Riavvia il computer
4. `task up`

## 📝 Note Tecniche

- Il Taskfile usa il docker-compose in `fantacalcio-sim/infra/docker-compose.prod.yml`
- Le variabili d'ambiente vengono caricate da `fantacalcio-sim/.env`
- I volumi persistenti mantengono i dati del database tra i restart