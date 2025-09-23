-- =========================================================
--  Fantacalcio – Schema completo (versione ITA)
--  Compatibile PostgreSQL 13+
--  Esegue DROP sicuri, ricrea tipi, tabelle, indici e viste.
-- =========================================================

BEGIN;

-- -------------------------
-- 1) DROP viste se esistono
-- -------------------------
DROP VIEW IF EXISTS v_eventi_cronaca;
DROP VIEW IF EXISTS v_risultati_partite;

-- -------------------------
-- 2) DROP tabelle in ordine
-- -------------------------
DROP TABLE IF EXISTS albo_doro           CASCADE;
DROP TABLE IF EXISTS partite_leghe       CASCADE;
DROP TABLE IF EXISTS formazioni_fantasy  CASCADE;
DROP TABLE IF EXISTS statistiche_gioc    CASCADE;
DROP TABLE IF EXISTS eventi              CASCADE;
DROP TABLE IF EXISTS partite_simulate    CASCADE;
DROP TABLE IF EXISTS calendario          CASCADE;
DROP TABLE IF EXISTS formazioni_reali    CASCADE;
DROP TABLE IF EXISTS rose                CASCADE;
DROP TABLE IF EXISTS squadre_fantasy     CASCADE;
DROP TABLE IF EXISTS leghe               CASCADE;
DROP TABLE IF EXISTS giocatori_reali     CASCADE;
DROP TABLE IF EXISTS squadre_reali       CASCADE;
DROP TABLE IF EXISTS giornate            CASCADE;
DROP TABLE IF EXISTS stagioni            CASCADE;
DROP TABLE IF EXISTS utenti              CASCADE;

-- -------------------------
-- 3) DROP tipi ENUM
-- -------------------------
DROP TYPE IF EXISTS tipo_evento;
DROP TYPE IF EXISTS ruolo_calcio;

-- -------------------------
-- 4) Crea tipi ENUM
-- -------------------------
CREATE TYPE ruolo_calcio AS ENUM ('P','D','C','A');  
-- P = Portiere, D = Difensore, C = Centrocampista, A = Attaccante

CREATE TYPE tipo_evento AS ENUM (
  'gol',
  'assist',
  'ammonizione',
  'espulsione',
  'autogol',
  'rigore_segnato',
  'rigore_sbagliato',
  'rigore_parato',
  'fine_primo_tempo',
  'fine_partita'
);

-- -------------------------
-- 5) Tabelle anagrafiche
-- -------------------------
CREATE TABLE utenti (
  id SERIAL PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  ruolo TEXT NOT NULL DEFAULT 'utente',
  creato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE leghe (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  commissario_id INTEGER REFERENCES utenti(id),
  regole_snapshot JSONB NOT NULL DEFAULT '{}'::jsonb,
  creato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE squadre_fantasy (
  id SERIAL PRIMARY KEY,
  lega_id INTEGER REFERENCES leghe(id) ON DELETE CASCADE,
  utente_id INTEGER REFERENCES utenti(id) ON DELETE CASCADE,
  nome TEXT NOT NULL,
  logo_url TEXT,
  budget_residuo INTEGER NOT NULL DEFAULT 500,
  creato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE squadre_reali (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL UNIQUE,
  valore_attacco NUMERIC NOT NULL DEFAULT 0.55,
  valore_difesa NUMERIC NOT NULL DEFAULT 0.55,
  valore_ritmo NUMERIC NOT NULL DEFAULT 0.55
);

CREATE TABLE giocatori_reali (
  id SERIAL PRIMARY KEY,
  nome  TEXT NOT NULL,
  ruolo ruolo_calcio NOT NULL,
  squadra_id INTEGER REFERENCES squadre_reali(id) ON DELETE SET NULL,
  quota_xg   NUMERIC NOT NULL DEFAULT 0.20,
  quota_xa   NUMERIC NOT NULL DEFAULT 0.20,
  indice_forma NUMERIC NOT NULL DEFAULT 0.0,
  calci_piazzati BOOLEAN NOT NULL DEFAULT FALSE,
  valutazione  INTEGER NOT NULL DEFAULT 0,
  UNIQUE (squadra_id, nome)
);

-- -------------------------
-- 6) Rose delle squadre fantasy
-- -------------------------
CREATE TABLE rose (
  squadra_fantasy_id INTEGER REFERENCES squadre_fantasy(id) ON DELETE CASCADE,
  giocatore_reale_id INTEGER REFERENCES giocatori_reali(id) ON DELETE CASCADE,
  costo INTEGER NOT NULL DEFAULT 10,
  stato TEXT NOT NULL DEFAULT 'attivo',
  PRIMARY KEY (squadra_fantasy_id, giocatore_reale_id)
);

-- -------------------------
-- 7) Stagioni e calendario
-- -------------------------
CREATE TABLE stagioni (
  id SERIAL PRIMARY KEY,
  nome TEXT NOT NULL,
  anno INTEGER NOT NULL,
  stato TEXT NOT NULL DEFAULT 'attiva'
);

CREATE TABLE giornate (
  id SERIAL PRIMARY KEY,
  stagione_id INTEGER REFERENCES stagioni(id),
  numero_giornata INTEGER NOT NULL,
  data_inizio TIMESTAMP NOT NULL DEFAULT NOW(),
  seme TEXT NOT NULL,
  versione_motore TEXT NOT NULL,
  parametri_snapshot JSONB NOT NULL DEFAULT '{}'::jsonb,
  stato TEXT NOT NULL DEFAULT 'programmata',
  creato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE calendario (
  id SERIAL PRIMARY KEY,
  giornata_id INTEGER REFERENCES giornate(id) ON DELETE CASCADE,
  squadra_casa_id INTEGER REFERENCES squadre_reali(id),
  squadra_trasferta_id INTEGER REFERENCES squadre_reali(id),
  creato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

-- -------------------------
-- 8) Partite simulate e formazioni reali
-- -------------------------
CREATE TABLE partite_simulate (
  id SERIAL PRIMARY KEY,
  giornata_id INTEGER REFERENCES giornate(id) ON DELETE CASCADE,
  calendario_id  INTEGER REFERENCES calendario(id) ON DELETE CASCADE,
  squadra_casa_id INTEGER REFERENCES squadre_reali(id),
  squadra_trasferta_id INTEGER REFERENCES squadre_reali(id),
  gol_casa INTEGER NOT NULL DEFAULT 0,
  gol_trasferta INTEGER NOT NULL DEFAULT 0,
  statistiche_agg JSONB NOT NULL DEFAULT '{}'::jsonb,
  generato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE formazioni_reali (
  id SERIAL PRIMARY KEY,
  partita_id INTEGER REFERENCES partite_simulate(id) ON DELETE CASCADE,
  squadra_id  INTEGER REFERENCES squadre_reali(id),
  modulo   TEXT NOT NULL DEFAULT '4-3-3',
  titolari JSONB NOT NULL,  
  panchina JSONB NOT NULL,  
  creato_il TIMESTAMP NOT NULL DEFAULT NOW(),
  UNIQUE (partita_id, squadra_id)
);

-- -------------------------
-- 9) Eventi e statistiche
-- -------------------------
CREATE TABLE eventi (
  id SERIAL PRIMARY KEY,
  partita_id INTEGER REFERENCES partite_simulate(id) ON DELETE CASCADE,
  minuto INTEGER NOT NULL CHECK (minuto BETWEEN 0 AND 120),
  secondo_reale INTEGER NOT NULL CHECK (secondo_reale >= 0),
  tipo tipo_evento NOT NULL,
  lato TEXT NOT NULL CHECK (lato IN ('casa','trasferta')),
  giocatore_id INTEGER REFERENCES giocatori_reali(id),
  assist_id INTEGER REFERENCES giocatori_reali(id),
  variazione_fantapunti JSONB NOT NULL DEFAULT '{}'::jsonb,
  x NUMERIC NOT NULL DEFAULT 50,
  y NUMERIC NOT NULL DEFAULT 50
);

CREATE TABLE statistiche_gioc (
  id SERIAL PRIMARY KEY,
  partita_id  INTEGER REFERENCES partite_simulate(id) ON DELETE CASCADE,
  giocatore_id INTEGER REFERENCES giocatori_reali(id) ON DELETE CASCADE,
  minuti       INTEGER NOT NULL DEFAULT 0,
  reti         INTEGER NOT NULL DEFAULT 0,
  assist       INTEGER NOT NULL DEFAULT 0,
  ammonizioni  INTEGER NOT NULL DEFAULT 0,
  espulsioni   INTEGER NOT NULL DEFAULT 0,
  autogol      INTEGER NOT NULL DEFAULT 0,
  porta_imbattuta BOOLEAN NOT NULL DEFAULT FALSE,
  fantapunti NUMERIC NOT NULL DEFAULT 0
);

-- -------------------------
-- 10) Formazioni fantasy e partite leghe
-- -------------------------
CREATE TABLE formazioni_fantasy (
  id SERIAL PRIMARY KEY,
  squadra_fantasy_id INTEGER REFERENCES squadre_fantasy(id) ON DELETE CASCADE,
  giornata_id INTEGER NOT NULL,
  modulo TEXT NOT NULL DEFAULT '4-3-3',
  titolari JSONB NOT NULL DEFAULT '[]'::jsonb,
  panchina JSONB NOT NULL DEFAULT '[]'::jsonb,
  sostituzioni_auto BOOLEAN NOT NULL DEFAULT TRUE,
  stato TEXT NOT NULL DEFAULT 'bozza',
  bloccata_il TIMESTAMP,
  creato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE partite_leghe (
  id SERIAL PRIMARY KEY,
  lega_id INTEGER REFERENCES leghe(id) ON DELETE CASCADE,
  giornata_id INTEGER NOT NULL,
  squadra_casa_id INTEGER REFERENCES squadre_fantasy(id) ON DELETE CASCADE,
  squadra_trasferta_id INTEGER REFERENCES squadre_fantasy(id) ON DELETE CASCADE,
  gol_casa INTEGER NOT NULL DEFAULT 0,
  gol_trasferta INTEGER NOT NULL DEFAULT 0,
  punti_fantasy_casa NUMERIC NOT NULL DEFAULT 0,
  punti_fantasy_trasferta NUMERIC NOT NULL DEFAULT 0,
  risultato TEXT,
  creato_il TIMESTAMP NOT NULL DEFAULT NOW()
);

-- -------------------------
-- 11) Albo d’oro
-- -------------------------
CREATE TABLE albo_doro (
  id SERIAL PRIMARY KEY,
  lega_id INTEGER REFERENCES leghe(id) ON DELETE CASCADE,
  stagione_id INTEGER REFERENCES stagioni(id) ON DELETE CASCADE,
  vincitore_id INTEGER REFERENCES squadre_fantasy(id)
);

-- -------------------------
-- 12) Indici utili
-- -------------------------
CREATE INDEX idx_eventi_partita_secondo ON eventi(partita_id, secondo_reale);
CREATE INDEX idx_statistiche_partita_giocatore ON statistiche_gioc(partita_id, giocatore_id);
CREATE INDEX idx_formazioni_fantasy_squadra_giornata ON formazioni_fantasy(squadra_fantasy_id, giornata_id);
CREATE INDEX idx_giocatori_reali_squadra_ruolo ON giocatori_reali(squadra_id, ruolo);
CREATE INDEX idx_formazioni_reali_partita_squadra ON formazioni_reali(partita_id, squadra_id);
CREATE INDEX idx_calendario_giornata ON calendario(giornata_id);
CREATE INDEX idx_partite_simulate_giornata ON partite_simulate(giornata_id);

-- -------------------------
-- 13) Viste di supporto
-- -------------------------
CREATE VIEW v_risultati_partite AS
SELECT
  p.id AS partita_id,
  g.numero_giornata,
  sc.nome AS squadra_casa,
  st.nome AS squadra_trasferta,
  p.gol_casa,
  p.gol_trasferta,
  p.generato_il
FROM partite_simulate p
JOIN calendario c   ON c.id = p.calendario_id
JOIN giornate g     ON g.id = p.giornata_id
JOIN squadre_reali sc ON sc.id = p.squadra_casa_id
JOIN squadre_reali st ON st.id = p.squadra_trasferta_id;

CREATE VIEW v_eventi_cronaca AS
SELECT
  e.id,
  e.partita_id,
  e.minuto,
  e.secondo_reale,
  CASE e.lato WHEN 'casa' THEN sc.nome ELSE st.nome END AS squadra,
  COALESCE(g1.nome, '—') AS giocatore,
  COALESCE(g2.nome, NULL) AS assistman,
  CASE e.tipo
    WHEN 'gol'              THEN 'Gol'
    WHEN 'assist'           THEN 'Assist'
    WHEN 'ammonizione'      THEN 'Cartellino giallo'
    WHEN 'espulsione'       THEN 'Cartellino rosso'
    WHEN 'autogol'          THEN 'Autogol'
    WHEN 'rigore_segnato'   THEN 'Rigore segnato'
    WHEN 'rigore_sbagliato' THEN 'Rigore sbagliato'
    WHEN 'rigore_parato'    THEN 'Rigore parato'
    WHEN 'fine_primo_tempo' THEN 'Fine primo tempo'
    WHEN 'fine_partita'     THEN 'Fine partita'
    ELSE INITCAP(REPLACE(e.tipo::text,'_',' '))
  END AS evento_it,
  e.tipo::text AS tipo_raw,
  e.variazione_fantapunti,
  e.x, e.y
FROM eventi e
JOIN partite_simulate p ON p.id = e.partita_id
JOIN squadre_reali sc ON sc.id = p.squadra_casa_id
JOIN squadre_reali st ON st.id = p.squadra_trasferta_id
LEFT JOIN giocatori_reali g1 ON g1.id = e.giocatore_id
LEFT JOIN giocatori_reali g2 ON g2.id = e.assist_id
ORDER BY e.partita_id, e.secondo_reale, e.id;

COMMIT;


-- =========================================================
-- 12) Helper opzionali (da eseguire a parte quando serve)
--    Pulizia rapida dei soli dati di simulazione:
-- =========================================================
-- TRUNCATE TABLE eventi RESTART IDENTITY CASCADE;
-- TRUNCATE TABLE statistiche_gioc RESTART IDENTITY CASCADE;
-- TRUNCATE TABLE partite_simulate RESTART IDENTITY CASCADE;
-- TRUNCATE TABLE calendario RESTART IDENTITY CASCADE;
-- TRUNCATE TABLE formazioni_reali RESTART IDENTITY CASCADE;
-- TRUNCATE TABLE giornate RESTART IDENTITY CASCADE;
