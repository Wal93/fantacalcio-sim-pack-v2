from fastapi import FastAPI
from pydantic import BaseModel
import os, random
import numpy as np
import psycopg2
from psycopg2.extras import Json

app = FastAPI()

# -------------------------
# Modello payload
# -------------------------
class SimPayload(BaseModel):
    giornata_id: int
    seme: str
    versione_motore: str
    parametri_snapshot: dict = {}

# -------------------------
# Connessione DB
# -------------------------
def db_conn():
    url = os.getenv("DATABASE_URL")
    return psycopg2.connect(url)

# -------------------------
# Costanti bonus/malus
# -------------------------
BONUS = {
    "gol": 3,
    "assist": 1,
    "ammonizione": -0.5,
    "espulsione": -1,
    "autogol": -2,
    "rigore_segnato": 3,
    "rigore_sbagliato": -3,
    "rigore_parato": 3,
    "porta_imbattuta": 1,
}

PESO_GOL_RUOLO = {"A": 1.0, "C": 0.6, "D": 0.25, "P": 0.02}
PESO_ASSIST_RUOLO = {"A": 0.8, "C": 0.9, "D": 0.2, "P": 0.05}

# -------------------------
# Funzioni di supporto
# -------------------------
def forza(att, dif, alpha=0.9, beta=0.9):
    return np.exp(alpha * (att - 0.5) - beta * (dif - 0.5))

def poisson(lam, rng):
    return np.random.default_rng(rng).poisson(lam)

def scelta_ponderata(giocatori, key, pesi_ruolo, exclude=None):
    totale = 0
    pesati = []
    for g in giocatori:
        if exclude and g[0] == exclude:
            continue
        ruolo = g[2]
        base = float(g[3] if key == "xg" else g[4] or 0)
        peso = base * pesi_ruolo.get(ruolo, 0.3)
        if g[5]:  # calci piazzati
            peso *= 1.2
        if peso > 0:
            pesati.append((g, peso))
            totale += peso
    if not pesati:
        return None
    r = random.random() * totale
    acc = 0
    for (g, peso) in pesati:
        acc += peso
        if r <= acc:
            return g
    return pesati[-1][0]

def scegli_formazione_reale(cur, partita_id, squadra_id):
    cur.execute("SELECT id, ruolo FROM giocatori_reali WHERE squadra_id=%s ORDER BY random()", (squadra_id,))
    giocatori = cur.fetchall()

    portieri = [g[0] for g in giocatori if g[1] == "P"]
    difensori = [g[0] for g in giocatori if g[1] == "D"]
    centrocampisti = [g[0] for g in giocatori if g[1] == "C"]
    attaccanti = [g[0] for g in giocatori if g[1] == "A"]

    titolari = []
    if portieri: titolari.append(portieri[0])
    titolari += difensori[:4]
    titolari += centrocampisti[:3]
    titolari += attaccanti[:3]

    panchina = [g[0] for g in giocatori if g[0] not in titolari]
    panchina = random.sample(panchina, k=min(5, len(panchina)))

    cur.execute("""
        INSERT INTO formazioni_reali(partita_id, squadra_id, modulo, titolari, panchina)
        VALUES (%s,%s,%s,%s,%s)
    """, (partita_id, squadra_id, "4-3-3", Json(titolari), Json(panchina)))

    return titolari, panchina

# -------------------------
# Endpoint salute
# -------------------------
@app.get("/salute")
def salute():
    return {"stato": "ok"}

# -------------------------
# Endpoint simulazione giornata
# -------------------------
@app.post("/simula_giornata")
def simula(payload: SimPayload):
    rng = abs(hash(payload.seme)) % (2**32 - 1)
    random.seed(rng)
    np.random.seed(rng % (2**32 - 1))

    conn = db_conn()
    conn.autocommit = False
    cur = conn.cursor()

    cur.execute("""
        UPDATE giornate 
        SET versione_motore=%s, parametri_snapshot=%s, stato='in_corso'
        WHERE id=%s
    """, (payload.versione_motore, Json(payload.parametri_snapshot), payload.giornata_id))

    cur.execute("""
        SELECT c.id, c.squadra_casa_id, c.squadra_trasferta_id,
               sc.valore_attacco, sc.valore_difesa, sc.valore_ritmo,
               st.valore_attacco, st.valore_difesa, st.valore_ritmo
        FROM calendario c
        JOIN squadre_reali sc ON sc.id = c.squadra_casa_id
        JOIN squadre_reali st ON st.id = c.squadra_trasferta_id
        WHERE c.giornata_id=%s
    """, (payload.giornata_id,))
    partite = cur.fetchall()

    HFA = 1.03  # Vantaggio casa ridotto al 3%
    base_gol = 2.1  # Media gol più realistica
    ids_partite = []

    for (cal_id, casa_id, trasf_id, att_c, dif_c, rit_c, att_t, dif_t, rit_t) in partite:
        ritmo = 0.5 * (float(rit_c) + float(rit_t))
        fattore_ritmo = 0.85 + 0.3 * ritmo
        lam_casa = base_gol * fattore_ritmo * HFA * forza(float(att_c), float(dif_t))
        lam_trasf = base_gol * fattore_ritmo * forza(float(att_t), float(dif_c))
        gC = int(poisson(lam_casa, rng))
        gT = int(poisson(lam_trasf, rng))

        cur.execute("""
            INSERT INTO partite_simulate(giornata_id, calendario_id, squadra_casa_id, squadra_trasferta_id, gol_casa, gol_trasferta, statistiche_agg)
            VALUES (%s,%s,%s,%s,%s,%s,%s) RETURNING id
        """, (payload.giornata_id, cal_id, casa_id, trasf_id, gC, gT, Json({"lam_casa": float(lam_casa), "lam_trasf": float(lam_trasf), "fattore_ritmo": float(fattore_ritmo)})))
        partita_id = cur.fetchone()[0]
        ids_partite.append(partita_id)

        titolari_casa, _ = scegli_formazione_reale(cur, partita_id, casa_id)
        titolari_trasf, _ = scegli_formazione_reale(cur, partita_id, trasf_id)

        cur.execute("SELECT id, nome, ruolo, quota_xg, quota_xa, calci_piazzati FROM giocatori_reali WHERE squadra_id=%s", (casa_id,))
        gioc_casa = cur.fetchall()
        cur.execute("SELECT id, nome, ruolo, quota_xg, quota_xa, calci_piazzati FROM giocatori_reali WHERE squadra_id=%s", (trasf_id,))
        gioc_trasf = cur.fetchall()

        statline = {g[0]: {"minuti": 90, "reti": 0, "assist": 0, "ammonizioni": 0, "espulsioni": 0, "autogol": 0, "punti": 0} for g in gioc_casa + gioc_trasf}

        eventi = []

        # gol + assist
        reti = ["casa"] * gC + ["trasferta"] * gT
        random.shuffle(reti)
        minuti_gol = sorted(random.sample(range(5, 86), k=len(reti)))
        for i, lato in enumerate(reti):
            minuto = minuti_gol[i]
            pool = gioc_casa if lato == "casa" else gioc_trasf
            marcatore = scelta_ponderata(pool, "xg", PESO_GOL_RUOLO)
            if marcatore:
                pid = marcatore[0]
                statline[pid]["reti"] += 1
                statline[pid]["punti"] += BONUS["gol"]
                eventi.append(("gol", lato, minuto, pid, BONUS["gol"]))
                if random.random() < 0.55:
                    assistman = scelta_ponderata(pool, "xa", PESO_ASSIST_RUOLO, exclude=pid)
                    if assistman:
                        aid = assistman[0]
                        statline[aid]["assist"] += 1
                        statline[aid]["punti"] += BONUS["assist"]
                        eventi.append(("assist", lato, minuto, aid, BONUS["assist"]))

        # ammonizioni
        for _ in range(random.randint(0, 4)):
            lato = random.choice(["casa", "trasferta"])
            pool = gioc_casa if lato == "casa" else gioc_trasf
            pid = random.choice(pool)[0]
            statline[pid]["ammonizioni"] += 1
            statline[pid]["punti"] += BONUS["ammonizione"]
            eventi.append(("ammonizione", lato, random.randint(10, 85), pid, BONUS["ammonizione"]))

        # espulsioni
        if random.random() < 0.1:
            lato = random.choice(["casa", "trasferta"])
            pool = gioc_casa if lato == "casa" else gioc_trasf
            pid = random.choice(pool)[0]
            statline[pid]["espulsioni"] += 1
            statline[pid]["punti"] += BONUS["espulsione"]
            eventi.append(("espulsione", lato, random.randint(20, 85), pid, BONUS["espulsione"]))

        # autogol
        if random.random() < 0.05:
            lato = random.choice(["casa", "trasferta"])
            pool = gioc_casa if lato == "casa" else gioc_trasf
            pid = random.choice(pool)[0]
            statline[pid]["autogol"] += 1
            statline[pid]["punti"] += BONUS["autogol"]
            eventi.append(("autogol", lato, random.randint(5, 80), pid, BONUS["autogol"]))
            if lato == "casa": gT += 1
            else: gC += 1

        # porta imbattuta
        if gT == 0:
            for g in gioc_casa:
                if g[2] in ("P", "D"):
                    statline[g[0]]["punti"] += BONUS["porta_imbattuta"]
        if gC == 0:
            for g in gioc_trasf:
                if g[2] in ("P", "D"):
                    statline[g[0]]["punti"] += BONUS["porta_imbattuta"]

        # salva eventi
        for (tipo, lato, minuto, pid, delta) in eventi:
            srt = int(minuto * 3.3)
            cur.execute("""
                INSERT INTO eventi(partita_id, minuto, secondo_reale, tipo, lato, giocatore_id, variazione_fantapunti, x, y)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
            """, (partita_id, minuto, srt, tipo, lato, pid, Json({"giocatore": delta}), random.randint(20, 80), random.randint(10, 90)))

        # salva statline
        for pid, st in statline.items():
            cur.execute("""
                INSERT INTO statistiche_gioc(partita_id, giocatore_id, minuti, reti, assist, ammonizioni, espulsioni, autogol, fantapunti)
                VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)
            """, (partita_id, pid, st["minuti"], st["reti"], st["assist"], st["ammonizioni"], st["espulsioni"], st["autogol"], st["punti"]))

        # aggiorna risultato finale
        cur.execute("UPDATE partite_simulate SET gol_casa=%s, gol_trasferta=%s WHERE id=%s", (gC, gT, partita_id))

    cur.execute("UPDATE giornate SET stato='completata' WHERE id=%s", (payload.giornata_id,))
    conn.commit()
    cur.close()
    conn.close()
    return {"stato": "ok", "partite": len(ids_partite)}
