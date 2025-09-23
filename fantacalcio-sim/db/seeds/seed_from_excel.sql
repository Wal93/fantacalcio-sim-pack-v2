-- Seed REALI da Excel (squadre + giocatori)
BEGIN;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('ATALANTA', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('BOLOGNA', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('CAGLIARI', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('COMO', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('CRE', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('FIORENTINA', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('GENOA', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('HELLAS VERONA', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('INTER', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('JUVENTUS', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('LAZIO', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('LECCE', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('MILAN', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('NAPOLI', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('PARMA', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('PIS', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('ROMA', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('SASSUOLO', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('TORINO', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO squadre_reali (nome, valore_attacco, valore_difesa, valore_ritmo) VALUES ('UDINESE', 0.55, 0.55, 0.55) ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DI GREGORIO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MERET', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SVILAR', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MAIGNAN', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SOMMER', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CARNESECCHI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE GEA', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PROVEDEL', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SKORUPSKI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BUTEZ', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LEALI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CAPRILE', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ISRAEL', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'AUDERO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FALCONE', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SUZUKI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MURIC', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SAVA', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MONTIPÒ', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SEMPER', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MILINKOVIC-SAVIC V.', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MANDAS', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARTINEZ JO.', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RAVAGLIA F.', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SCUFFET', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TURATI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CAVLINA', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CIOCCI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CONTINI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CORVI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DI GENNARO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FRUCHTL', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FURLANETTO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GOLLINI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LEZZERINI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARTINELLI T.', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NAVA', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NICOLAS', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NUNZIANTE', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OKOYE', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PADELLI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PALEARI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PERILLI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PERIN', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PESSINA MAS.', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PINSOGLIO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'POPA', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RADUNOVIC', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RINALDI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ROSSI F.', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SAMOOJA', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SATALINO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SIEGRIST', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SILVESTRI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SOMMARIVA', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SPORTIELLO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TERRACCIANO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TONIOLO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TORRIANI', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VASQUEZ D.', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VIGORITO', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZELEZNY', 'P', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DUMFRIES', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DIMARCO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GOSENS', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BASTONI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BREMER', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'WESLEY', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BUONGIORNO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DODÒ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BELLANOVA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CAMBIASO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DI LORENZO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GUTIERREZ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SOLET', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ANGELINO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MANCINI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARTIN', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RRAHMANI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TAVARES N.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VALERI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZORTEA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KALULU', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MIRANDA J.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PAVLOVIC', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RAMON', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VASQUEZ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'AKANJI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CARLOS AUGUSTO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VOJVODA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ACERBI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BEUKEMA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE WINTER', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DELPRATO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DOIG', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ESTUPINAN', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GABBIA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GILA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HIEN', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LUPERTO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ROMAGNOLI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZAPPACOSTA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BIRAGHI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'IDZES', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'JOAO MARIO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LAZARO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TOMORI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VITIK', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZANOLI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'COMUZZO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GASPAR K.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ISMAJLI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'N''DICKA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PALESTRA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VALLE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ANGORI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BASCHIROTTO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BISSECK', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE VRIJ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GATTI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARIPAN', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MINA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OLIVERA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BARBIERI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BERTOLA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CANESTRELLI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CUADRADO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FRESE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GALLO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GHILARDI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HEGGEM', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HERMOSO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HOLM', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KEMPF', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KOSSOUNOU', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KRISTENSEN T.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARUSIC', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARÌ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NORTON-CUFFY', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OSTIGARD', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'POSCH', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RANIERI L.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SCALVINI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TIAGO GABRIEL', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'AHANOR', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CANDÈ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CARACCIOLO A.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'COCO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DARMIAN', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DJIMSITI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FLORIANI MUSSOLINI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'JUAN JESUS', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KAMARA H.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KELLY L.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LUCUMÌ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LYKOGIANNIS', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARCANDALLI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MBAMBI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MUHAREMOVIC', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PALMA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PEZZELLA GIU.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PROVSTGAARD', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RENSCH', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SPINAZZOLA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'UNAI NUNEZ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VAN DER BREMPT', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZAPPA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CELIK', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EHIZIBUE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KOLASINAC', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ATHEKAME', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BALOGH', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BARTESAGHI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BELGHALI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BELLA-KOTCHAP', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BIANCHETTI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BONFANTI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BRADARIC', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BRITSCHGI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CABAL', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CALABRESI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CASALE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CECCHERINI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CHAM', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CIRCATI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'COPPOLA F.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE SILVESTRI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DEMBELÈ A.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DENOON', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DI PARDO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DIEGO CARLOS', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DOSSENA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EBOSSE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ESTEVES T.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FAYE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FOLINO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FORTINI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GIGOT', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GOGLICHIDZE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GOLDANIGA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HYSAJ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'IDRISSI R.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ILIC M.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'JEAN', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KABASELE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KOUASSI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LAMPTEY', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LAZZARI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LOVIK', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARIANUCCI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MASINA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MATEUS LUSUARDI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MAZZOCCHI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MORENO ALB.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NDABA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NDIAYE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NELSSON', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NKOUNKOU', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OBERT', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ODENTHAL', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ODOGU', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OTOA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OYEGOKE', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PARISI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PATRIC', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PAVARD', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PAZ Y.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PEDERSEN', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PELLEGRINI LU.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PEREZ M.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PIERAGNOLO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PONGRACIC', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RODRIGUEZ JU.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ROMAGNA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ROUHI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RUGANI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RUI MODESTO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RUS', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SABELLI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SCHUURS', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SERNICOLA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SIEBERT', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SLOTSAGER', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SMOLCIC I.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TERRACCIANO F.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TROILO', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TSIMIKAS', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VALENTI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VALENTINI N.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VEIGA D.', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VITI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'WALUKIEWICZ', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZEMURA', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZIOLKOWSKI', 'D', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ORSOLINI', 'C', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MCTOMINAY', 'C', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PAZ N.', 'C', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PULISIC', 'C', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE BRUYNE', 'C', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZACCAGNI', 'C', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GUDMUNDSSON A.', 'C', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CALHANOGLU', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CONCEICAO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ODGAARD', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ATTA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BARELLA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RABIOT', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'THURAM K.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TRAMONI M.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LOFTUS-CHEEK', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CARBONI V.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ISAKSEN', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MODRIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'POLITANO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SAELEMAEKERS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VANDEPUTTE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VAZQUEZ', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VLASIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZAMBO ANGUISSA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZHEGROVA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BATURINA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EDERSON D.S.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ELLERTSSON', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ELMAS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FAZZINI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KONÈ M.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KOOPMEINERS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NERES', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ORISTANIO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PASALIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ROWE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'STANCIU', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SUCIC P.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BAILEY', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CASADEI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FOLORUNSHO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GRONBAEK', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SAMARDZIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TOURÈ I.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BERNABÈ', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'COLLOCOLO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CRISTANTE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DA CUNHA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DELE-BASHIRU', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EL AYNAOUI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EL SHAARAWY', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FRATTESI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GAETANO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GUENDOUZI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MALDINI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MANDRAGORA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NICOLUSSI CAVIGLIA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SOHM', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'STENGS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LORRAN', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ANJORIN', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ASLLANI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BERNARDESCHI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BOLOCA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE ROON', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EKKELENKAMP', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FABBIAN', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FADERA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LOCATELLI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LOVRIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LUIS HENRIQUE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MALINOVSKYI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ONDREJKA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PIEROTTI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SORENSEN O.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'THORSTVEDT', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZALEWSKI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'AEBISCHER', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BALDANZI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BRESCIANINI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CAQUERET', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CHUKWUEZE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DIOUF', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FAGIOLI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FERGUSON', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FOFANA Y.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FRENDRUP', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FREULER', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HARROUI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HELGASON', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ILIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'JASHARI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LOBOTKA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MCKENNIE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MESSIAS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MKHITARYAN', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PELLEGRINI LO.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PICCININI G.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PIOTROWSKI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PISILLI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RICCI S.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ROVELLA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SOTTIL', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TETE MORENTE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZIELINSKI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ADOPO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ADZIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'AKINSANMIRO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'AL-MUSRATI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ALLI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ARENA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BASIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BELAHYANE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BERISHA M.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BERNEDE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BONDO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CATALDI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'COULIBALY L.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DEIOLA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ESTEVEZ', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FELICI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GILMOUR', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GINEITIS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GRASSI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HERNANI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HOJHOLT', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'IANNONI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ILKHAN', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KABA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KARLSTROM', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KASTANOS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KEITA M.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KONÈ I.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KOSTIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LERIS', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LIPANI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LITETA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MALEH', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARCHWINSKI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARIN M.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MASINI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MATIC', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MAZZITELLI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MILLER L.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MIRETTI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MORO N.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MUSAH', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NDOUR', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NIASSE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ONANA J.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ORDONEZ C.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PAYERO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PERRONE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PIERRET', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'POBEGA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PRATI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RAFIA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RAMADANI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RICHARDSON', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ROG', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SABIRI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SALA A.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SANTIAGO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SARMIENTO J.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SERDAR', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SERGI ROBERTO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SULEMANA I.', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SUSLOV', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'TAMEZE', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'THORSBY', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VALOTI', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VECINO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VENTURINO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VOLPATO', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VRANCKX', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VURAL', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZARRAGA', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZERBIN', 'C', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MARTINEZ L.', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KEAN', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'THURAM', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DAVID', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CASTELLANOS', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LEAO', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BERARDI', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'HOJLUND', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'YILDIZ', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FERGUSON E.', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GIMENEZ', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SOULÈ', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DYBALA', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KRSTOVIC', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OPENDA', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SCAMACCA', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NKUNKU', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='MILAN'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CASTRO S.', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PELLEGRINO M.', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VLAHOVIC', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LOOKMAN', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LUCCA', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PINAMONTI', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DOVBYK', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='ROMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MORATA', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ZAPATA D.', 'A', id, 0.20, 0.20, 0.0, TRUE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE KETELAERE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DIA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PICCOLI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CAMARDA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DIAO', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ESPOSITO SE.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LANG', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LAURIENTÈ', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NGONGE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ADAMS C.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BONNY', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DAVIS K.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DZEKO', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'IMMOBILE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KUHN', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LUKAKU', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='NAPOLI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'STULIC', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BRAVO', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'COLOMBO', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DOUVIKAS', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KILICSOY', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PEDRO', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NZOLA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ORBAN G.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ABOUKHLAL', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BUKSA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CUTRONE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'GIOVANE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MOUMBAGNA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'RODRIGUEZ JE.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SARR A.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SULEMANA K.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='ATALANTA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SIMEONE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ADDAI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='COMO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SANABRIA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BAYO V.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DE LUCA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MOSQUERA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='HELLAS VERONA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CAMBIAGHI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CANCELLIERI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DOMINGUEZ B.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ESPOSITO F.P.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='INTER'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'LUVUMBO', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MEISTER', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'VITINHA O.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BELTRAN L.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='FIORENTINA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DJURIC', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'FRIGAN', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NOSLIN', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LAZIO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'ALMQVIST', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BANDA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BENEDYCZAK', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PARMA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BONAZZOLI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BORRELLI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'BUFFON L.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'CHEDDIRA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'DALLINGA', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EKHATOR', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'EKUBAN', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='GENOA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'JOHNSEN', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'KARLSSON', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='BOLOGNA'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MILIK', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='JUVENTUS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MOREO', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='PIS'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'MORO L.', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'N''DRI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='LECCE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'NJIE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='TORINO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'OKEREKE', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CRE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PAVOLETTI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='CAGLIARI'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'PIERINI', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SANCHEZ', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='UDINESE'
ON CONFLICT DO NOTHING;
INSERT INTO giocatori_reali (nome, ruolo, squadra_id, quota_xg, quota_xa, indice_forma, calci_piazzati)
SELECT 'SKJELLERUP', 'A', id, 0.20, 0.20, 0.0, FALSE FROM squadre_reali WHERE nome='SASSUOLO'
ON CONFLICT DO NOTHING;
COMMIT;
