-- Aggiornamento valori realistici delle squadre Serie A 2025/26
-- Valori basati su: forza offensiva, solidità difensiva, ritmo di gioco
-- Range: 0.30 (più debole) - 0.70 (più forte)

-- Top Tier (Inter, Juventus, Milan, Napoli)
UPDATE squadre_reali SET valore_attacco = 0.68, valore_difesa = 0.65, valore_ritmo = 0.62 WHERE nome = 'INTER';
UPDATE squadre_reali SET valore_attacco = 0.65, valore_difesa = 0.68, valore_ritmo = 0.58 WHERE nome = 'JUVENTUS';
UPDATE squadre_reali SET valore_attacco = 0.66, valore_difesa = 0.61, valore_ritmo = 0.64 WHERE nome = 'MILAN';
UPDATE squadre_reali SET valore_attacco = 0.64, valore_difesa = 0.63, valore_ritmo = 0.61 WHERE nome = 'NAPOLI';

-- High Tier (Atalanta, Roma, Lazio, Fiorentina)
UPDATE squadre_reali SET valore_attacco = 0.70, valore_difesa = 0.55, valore_ritmo = 0.68 WHERE nome = 'ATALANTA';
UPDATE squadre_reali SET valore_attacco = 0.58, valore_difesa = 0.60, valore_ritmo = 0.56 WHERE nome = 'ROMA';
UPDATE squadre_reali SET valore_attacco = 0.61, valore_difesa = 0.57, valore_ritmo = 0.59 WHERE nome = 'LAZIO';
UPDATE squadre_reali SET valore_attacco = 0.62, valore_difesa = 0.54, valore_ritmo = 0.63 WHERE nome = 'FIORENTINA';

-- Mid-High Tier (Bologna, Torino, Sassuolo)
UPDATE squadre_reali SET valore_attacco = 0.56, valore_difesa = 0.58, valore_ritmo = 0.55 WHERE nome = 'BOLOGNA';
UPDATE squadre_reali SET valore_attacco = 0.52, valore_difesa = 0.59, valore_ritmo = 0.51 WHERE nome = 'TORINO';
UPDATE squadre_reali SET valore_attacco = 0.57, valore_difesa = 0.48, valore_ritmo = 0.58 WHERE nome = 'SASSUOLO';

-- Mid Tier (Genoa, Udinese, Empoli, Parma)
UPDATE squadre_reali SET valore_attacco = 0.48, valore_difesa = 0.52, valore_ritmo = 0.49 WHERE nome = 'GENOA';
UPDATE squadre_reali SET valore_attacco = 0.50, valore_difesa = 0.53, valore_ritmo = 0.47 WHERE nome = 'UDINESE';
UPDATE squadre_reali SET valore_attacco = 0.46, valore_difesa = 0.51, valore_ritmo = 0.48 WHERE nome = 'EMPOLI';
UPDATE squadre_reali SET valore_attacco = 0.49, valore_difesa = 0.47, valore_ritmo = 0.50 WHERE nome = 'PARMA';

-- Lower Tier (Cagliari, Hellas Verona, Lecce, Como, Monza, Venezia)
UPDATE squadre_reali SET valore_attacco = 0.44, valore_difesa = 0.49, valore_ritmo = 0.45 WHERE nome = 'CAGLIARI';
UPDATE squadre_reali SET valore_attacco = 0.42, valore_difesa = 0.50, valore_ritmo = 0.43 WHERE nome = 'HELLAS VERONA';
UPDATE squadre_reali SET valore_attacco = 0.41, valore_difesa = 0.46, valore_ritmo = 0.44 WHERE nome = 'LECCE';
UPDATE squadre_reali SET valore_attacco = 0.45, valore_difesa = 0.44, valore_ritmo = 0.46 WHERE nome = 'COMO';
UPDATE squadre_reali SET valore_attacco = 0.47, valore_difesa = 0.45, valore_ritmo = 0.48 WHERE nome = 'MONZA';
UPDATE squadre_reali SET valore_attacco = 0.39, valore_difesa = 0.42, valore_ritmo = 0.41 WHERE nome = 'VENEZIA';

-- Gestione nomi alternativi o abbreviati
UPDATE squadre_reali SET valore_attacco = 0.38, valore_difesa = 0.41, valore_ritmo = 0.40 WHERE nome = 'CREMONESE';
UPDATE squadre_reali SET valore_attacco = 0.43, valore_difesa = 0.47, valore_ritmo = 0.44 WHERE nome = 'PISA';

-- Verifica finale - mostra i risultati
SELECT nome, valore_attacco, valore_difesa, valore_ritmo,
       ROUND((valore_attacco + valore_difesa + valore_ritmo) / 3.0, 3) as media_forza
FROM squadre_reali 
ORDER BY (valore_attacco + valore_difesa + valore_ritmo) DESC;