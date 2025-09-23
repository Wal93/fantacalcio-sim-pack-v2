-- Correzione nomi squadre
-- Aggiorna i nomi abbreviati con i nomi completi

UPDATE squadre_reali SET nome = 'PISA' WHERE nome = 'PIS';
UPDATE squadre_reali SET nome = 'CREMONESE' WHERE nome = 'CRE';

-- Aggiorna anche i valori per PISA (se non già fatto)
UPDATE squadre_reali SET valore_attacco = 0.43, valore_difesa = 0.47, valore_ritmo = 0.44 WHERE nome = 'PISA';

-- Verifica che i nomi siano stati aggiornati
SELECT nome, valore_attacco, valore_difesa, valore_ritmo
FROM squadre_reali 
WHERE nome IN ('PISA', 'CREMONESE')
ORDER BY nome;

-- Mostra tutte le squadre per conferma
SELECT nome FROM squadre_reali ORDER BY nome;