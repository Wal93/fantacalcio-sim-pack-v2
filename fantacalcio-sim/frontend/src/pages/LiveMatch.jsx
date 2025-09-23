import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from './Login.jsx';
import toast from 'react-hot-toast';

function LiveMatch() {
  const { matchId } = useParams();
  const navigate = useNavigate();
  const { isAuthenticated, getAuthHeaders } = useAuth();
  const finalMatchId = matchId || new URLSearchParams(window.location.search).get('id') || 'demo';
  
  const [status, setStatus] = useState(null);
  const [eventi, setEventi] = useState([]);
  const [formazioni, setFormazioni] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  const API_BASE = import.meta.env.VITE_API_BASE_URL || 'http://localhost:4000';

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }
    
    if (finalMatchId && finalMatchId !== 'demo') {
      loadMatchData();
      
      // Polling ogni 3 secondi per dati live
      const interval = setInterval(loadMatchData, 3000);
      return () => clearInterval(interval);
    } else {
      // Modalità demo - MA CARICA COMUNQUE DAL DB!
      loadFormazioni();
      setLoading(false);
      setStatus({
        match_id: 'demo',
        lega_id: 1,
        squadre: {
          casa: { id: 1, nome: 'Juventus FC', proprietario: 'Mario Rossi' },
          trasferta: { id: 2, nome: 'Inter FC', proprietario: 'Luigi Verdi' }
        },
        risultato: { casa: 1, trasferta: 2 },
        minuto_corrente: 67,
        partita_finita: false,
        tempo_rimanente_ms: 180000,
        statistiche: { eventi_totali: 4, prossimo_evento_in: 12000 }
      });
      setEventi([
        {
          id: 1, minuto: 15, giocatore_nome: 'Osimhen', squadra_reale: 'Napoli',
          lato: 'casa', tipo_evento: 'goal', descrizione: 'Gol fantastico!',
          emoji: '⚽', punti_fantasy: 3, created_at: new Date()
        },
        {
          id: 2, minuto: 28, giocatore_nome: 'Lautaro', squadra_reale: 'Inter',
          lato: 'trasferta', tipo_evento: 'goal', descrizione: 'Gol di testa!',
          emoji: '⚽', punti_fantasy: 3, created_at: new Date()
        },
        {
          id: 3, minuto: 45, giocatore_nome: 'Barella', squadra_reale: 'Inter',
          lato: 'trasferta', tipo_evento: 'assist', descrizione: 'Assist perfetto',
          emoji: '👟', punti_fantasy: 1, created_at: new Date()
        },
        {
          id: 4, minuto: 62, giocatore_nome: 'Vlahovic', squadra_reale: 'Juventus',
          lato: 'trasferta', tipo_evento: 'goal', descrizione: 'Gol su rigore',
          emoji: '⚽', punti_fantasy: 3, created_at: new Date()
        }
      ]);
    }
  }, [finalMatchId, isAuthenticated, navigate]);

  const loadFormazioni = async () => {
    try {
      // CARICA FORMAZIONI DAL DATABASE SEMPRE!
      const response = await fetch(`${API_BASE}/leagues/1/formazioni/1/2`, {
        headers: { ...getAuthHeaders() }
      });
      
      if (response.ok) {
        const data = await response.json();
        if (data.status === 'ok') {
          setFormazioni(data.data);
        }
      }
    } catch (error) {
      console.error('Errore caricamento formazioni:', error);
    }
  };

  const loadMatchData = async () => {
    try {
      setLoading(true);
      
      // Carica status match
      const statusResponse = await fetch(`${API_BASE}/live/match-status/${finalMatchId}`, {
        headers: { ...getAuthHeaders() }
      });
      
      if (statusResponse.ok) {
        const statusData = await statusResponse.json();
        if (statusData.status === 'ok') {
          setStatus(statusData.data);
        }
      }
      
      // Carica eventi
      const eventsResponse = await fetch(`${API_BASE}/live/events/${finalMatchId}`, {
        headers: { ...getAuthHeaders() }
      });
      
      if (eventsResponse.ok) {
        const eventsData = await eventsResponse.json();
        if (eventsData.status === 'ok' && eventsData.data) {
          setEventi(eventsData.data);
        }
      }

      // CARICA FORMAZIONI DAL DATABASE - FINALMENTE!
      const formazioniResponse = await fetch(`${API_BASE}/leagues/1/formazioni/1/2`, {
        headers: { ...getAuthHeaders() }
      });
      
      if (formazioniResponse.ok) {
        const formazioniData = await formazioniResponse.json();
        if (formazioniData.status === 'ok') {
          setFormazioni(formazioniData.data);
        }
      }
      
      setError('');
    } catch (error) {
      console.error('Errore caricamento match:', error);
      setError('Errore caricamento dati match');
    } finally {
      setLoading(false);
    }
  };

  const iniziaPartitaEnterprise = async () => {
    try {
      setLoading(true);
      const response = await fetch(`${API_BASE}/live/start-match`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...getAuthHeaders()
        },
        body: JSON.stringify({
          lega_id: 1,
          squadra_casa_id: 1,
          squadra_trasferta_id: 2
        })
      });

      const data = await response.json();
      
      if (data.status === 'ok') {
        toast.success('🚀 Match avviato con successo!');
        navigate(`/live-match/${data.data.match_id}`);
      } else {
        toast.error(`❌ ${data.error}`);
      }
    } catch (error) {
      console.error('Errore avvio match:', error);
      toast.error('❌ Errore avvio match');
    } finally {
      setLoading(false);
    }
  };

  // FORMAZIONI DAL DATABASE - FINALMENTE!
  const partita = formazioni ? {
    home: {
      name: formazioni.casa?.nome || status?.squadre?.casa?.nome || 'Squadra Casa',
      players: formazioni.casa?.titolari || []
    },
    away: {
      name: formazioni.trasferta?.nome || status?.squadre?.trasferta?.nome || 'Squadra Trasferta', 
      players: formazioni.trasferta?.titolari || []
    }
  } : {
    home: { name: 'Caricamento...', players: [] },
    away: { name: 'Caricamento...', players: [] }
  };

  // Loading state
  if (loading && !status) {
    return (
      <div style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        minHeight: '60vh',
        flexDirection: 'column'
      }}>
        <div style={{fontSize: '48px', marginBottom: '16px'}}>⏳</div>
        <h3 style={{color: '#16A34A'}}>Caricamento Match Enterprise...</h3>
        <p style={{color: '#94A3B8'}}>Connessione al sistema live in corso</p>
      </div>
    );
  }

  // Error state
  if (error) {
    return (
      <div style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        minHeight: '60vh',
        flexDirection: 'column'
      }}>
        <div style={{fontSize: '48px', marginBottom: '16px'}}>❌</div>
        <h3 style={{color: '#DC2626'}}>Errore Sistema Enterprise</h3>
        <p style={{color: '#94A3B8'}}>{error}</p>
        <button
          onClick={() => window.location.reload()}
          style={{
            background: '#16A34A',
            color: '#fff',
            border: 'none',
            padding: '12px 24px',
            borderRadius: '8px',
            cursor: 'pointer',
            marginTop: '16px'
          }}
        >
          🔄 Ricarica
        </button>
      </div>
    );
  }

  return (
    <div style={{background: "#0F172A", color: "#fff", minHeight: "100vh", padding: "24px"}}>
      
      {/* Header Enterprise con Timer Live */}
      <div style={{display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: "24px", background: "#1E293B", padding: "20px", borderRadius: "12px", border: "2px solid #16A34A"}}>
        <div>
          <h1 style={{color: "#16A34A", margin: 0, fontSize: "28px"}}>
            ⚽ LIVE MATCH ENTERPRISE
          </h1>
          <div style={{fontSize: "12px", color: "#94A3B8", marginTop: "4px"}}>
            Lega ID: {status?.lega_id || 1} • Match ID: {finalMatchId}
          </div>
          {finalMatchId === 'demo' && (
            <button 
              onClick={iniziaPartitaEnterprise}
              disabled={loading}
              style={{
                background: loading ? "#6B7280" : "linear-gradient(135deg, #16A34A 0%, #22C55E 100%)",
                color: "#fff",
                border: "none",
                padding: "8px 16px",
                fontSize: "12px",
                fontWeight: "bold",
                borderRadius: "8px",
                cursor: loading ? "not-allowed" : "pointer",
                marginTop: "8px"
              }}
            >
              {loading ? "⏳ Avvio..." : "🚀 Avvia Match Reale"}
            </button>
          )}
        </div>
        
        <div style={{textAlign: "center"}}>
          <div style={{fontSize: "32px", fontWeight: "bold", color: "#fff"}}>
            {partita.home.name} vs {partita.away.name}
          </div>
          <div style={{fontSize: "14px", color: "#94A3B8", marginTop: "4px"}}>
            {status?.squadre?.casa?.proprietario || 'Mario Rossi'} vs {status?.squadre?.trasferta?.proprietario || 'Luigi Verdi'}
          </div>
        </div>
        
        <div style={{textAlign: "center"}}>
          <div style={{fontSize: "36px", fontWeight: "bold", color: status?.partita_finita ? "#DC2626" : "#16A34A"}}>
            {status?.minuto_corrente || 67}'
          </div>
          <div style={{fontSize: "14px", color: status?.partita_finita ? "#DC2626" : "#16A34A", fontWeight: "bold"}}>
            {status?.partita_finita ? "FINALE" : "IN CORSO"}
          </div>
          {!status?.partita_finita && (
            <div style={{fontSize: "11px", color: "#94A3B8", marginTop: "4px"}}>
              -{Math.ceil((status?.tempo_rimanente_ms || 180000) / 1000)}s
            </div>
          )}
        </div>
      </div>
      <div style={{
        position: "relative",
        width: "100%", 
        height: "600px", 
        background: "linear-gradient(45deg, #16A34A 0%, #22C55E 50%, #16A34A 100%)",
        border: "4px solid #fff",
        borderRadius: "12px",
        backgroundImage: "linear-gradient(90deg, rgba(255,255,255,0.1) 50%, transparent 50%), linear-gradient(rgba(255,255,255,0.1) 50%, transparent 50%)",
        backgroundSize: "20px 20px",
        marginBottom: "24px"
      }}>
        
        {/* Linee del campo */}
        <div style={{position: "absolute", top: "50%", left: 0, right: 0, height: 2, background: "#fff", transform: "translateY(-50%)"}} />
        <div style={{position: "absolute", top: 0, bottom: 0, left: "50%", width: 2, background: "#fff", transform: "translateX(-50%)"}} />
        
        {/* Cerchio centrale */}
        <div style={{position: "absolute", top: "50%", left: "50%", width: 120, height: 120, border: "2px solid #fff", borderRadius: "50%", transform: "translate(-50%, -50%)"}} />
        
        {/* Aree di rigore */}
        <div style={{position: "absolute", top: 0, left: "50%", width: 220, height: 110, border: "2px solid #fff", borderTop: "none", transform: "translateX(-50%)"}} />
        <div style={{position: "absolute", bottom: 0, left: "50%", width: 220, height: 110, border: "2px solid #fff", borderBottom: "none", transform: "translateX(-50%)"}} />
        
        {/* Giocatori squadra casa */}
        {partita.home.players && partita.home.players.map(p => (
          <div key={`home-${p.id}`} style={{
            position: "absolute",
            left: `${p.x}%`,
            top: `${p.y}%`,
            width: 40,
            height: 50,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            transform: "translate(-50%, -50%)"
          }}>
            <div style={{
              width: 36,
              height: 36,
              background: "#2563EB",
              borderRadius: "50%",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              color: "#fff",
              fontSize: 9,
              fontWeight: "bold",
              border: "2px solid #fff",
              boxShadow: "0 2px 8px rgba(0,0,0,0.3)"
            }}>
              {p.name.split(' ')[0]}
            </div>
            <div style={{fontSize: 10, color: "#fff", textShadow: "1px 1px 2px rgba(0,0,0,0.8)", marginTop: 2}}>
              {p.role}
            </div>
          </div>
        ))}
        
        {/* Giocatori squadra trasferta */}
        {partita.away.players && partita.away.players.map(p => (
          <div key={`away-${p.id}`} style={{
            position: "absolute",
            left: `${p.x}%`,
            top: `${p.y}%`,
            width: 40,
            height: 50,
            display: "flex",
            flexDirection: "column",
            alignItems: "center",
            transform: "translate(-50%, -50%)"
          }}>
            <div style={{
              width: 36,
              height: 36,
              background: "#DC2626",
              borderRadius: "50%",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              color: "#fff",
              fontSize: 9,
              fontWeight: "bold",
              border: "2px solid #fff",
              boxShadow: "0 2px 8px rgba(0,0,0,0.3)"
            }}>
              {p.name.split(' ')[0]}
            </div>
            <div style={{fontSize: 10, color: "#fff", textShadow: "1px 1px 2px rgba(0,0,0,0.8)", marginTop: 2}}>
              {p.role}
            </div>
          </div>
        ))}
      </div>

      {/* Tabellone risultato */}
      <div style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        gap: "40px",
        background: "linear-gradient(135deg, #1E293B 0%, #374151 100%)",
        padding: "32px",
        borderRadius: "16px",
        border: "2px solid #16A34A",
        marginBottom: "32px"
      }}>
        <div style={{textAlign: "center", flex: 1}}>
          <div style={{fontSize: "20px", fontWeight: "bold", color: "#2563EB", marginBottom: "12px"}}>
            {partita.home.name}
          </div>
          <div style={{fontSize: "16px", color: "#94A3B8", marginBottom: "8px"}}>
            {status.squadre?.casa?.proprietario || 'Mario Rossi'}
          </div>
          <div style={{fontSize: "48px", fontWeight: "bold", color: "#fff"}}>
            {status?.risultato?.casa || 1}
          </div>
        </div>
        
        <div style={{
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          padding: "20px",
          background: "rgba(22, 163, 74, 0.1)",
          borderRadius: "12px",
          border: "2px solid #16A34A"
        }}>
          <div style={{fontSize: "28px", fontWeight: "bold", color: "#16A34A"}}>
            {status?.risultato?.casa || 1} - {status?.risultato?.trasferta || 2}
          </div>
          <div style={{fontSize: "14px", color: "#16A34A", marginTop: "8px"}}>
            {status?.minuto_corrente || 67}' {status?.partita_finita ? "FT" : ""}
          </div>
          <div style={{fontSize: "12px", color: "#94A3B8", marginTop: "4px"}}>
            Eventi: {status?.statistiche?.eventi_totali || eventi.length}
          </div>
        </div>
        
        <div style={{textAlign: "center", flex: 1}}>
          <div style={{fontSize: "20px", fontWeight: "bold", color: "#DC2626", marginBottom: "12px"}}>
            {partita.away.name}
          </div>
          <div style={{fontSize: "16px", color: "#94A3B8", marginBottom: "8px"}}>
            {status?.squadre?.trasferta?.proprietario || 'Luigi Verdi'}
          </div>
          <div style={{fontSize: "48px", fontWeight: "bold", color: "#fff"}}>
            {status?.risultato?.trasferta || 2}
          </div>
        </div>
      </div>

      {/* Cronaca Eventi */}
      <div style={{background: "#1E293B", padding: "24px", borderRadius: "12px", border: "1px solid #374151"}}>
        <div style={{display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: "20px"}}>
          <h3 style={{color: "#16A34A", margin: 0, fontSize: "20px"}}>📋 Cronaca Live Enterprise</h3>
          <div style={{fontSize: "12px", color: "#94A3B8"}}>
            {status?.partita_finita ? (
              "Partita Terminata"
            ) : (
              <>
                Prossimo evento in: {Math.ceil((status?.statistiche?.prossimo_evento_in || 12000) / 1000)}s •
                Aggiornamento: 3s • Timer: {status?.minuto_corrente || 67}'/90'
              </>
            )}
          </div>
        </div>
        
        {eventi.length === 0 ? (
          <div style={{textAlign: "center", color: "#94A3B8", padding: "50px"}}>
            <div style={{fontSize: "32px", marginBottom: "16px"}}>⏳</div>
            <h4 style={{color: "#F59E0B", marginBottom: "8px"}}>Sistema Enterprise Attivo</h4>
            <p>In attesa del primo evento dalla simulazione Serie A...</p>
          </div>
        ) : (
          <div style={{display: "flex", flexDirection: "column", gap: "12px", maxHeight: "400px", overflowY: "auto"}}>
            {eventi.map((evento, i) => (
              <div key={evento.id} style={{
                padding: "16px 20px",
                background: "linear-gradient(135deg, #374151 0%, #4B5563 100%)",
                borderRadius: "12px",
                border: "1px solid #6B7280",
                borderLeft: `5px solid ${evento.lato === 'casa' ? '#2563EB' : '#DC2626'}`
              }}>
                <div style={{display: "flex", justifyContent: "space-between", alignItems: "center"}}>
                  <div style={{display: "flex", alignItems: "center", gap: "12px"}}>
                    <div style={{
                      fontSize: "24px", 
                      width: "40px", 
                      textAlign: "center"
                    }}>
                      {evento.emoji}
                    </div>
                    <div>
                      <div style={{fontSize: "16px", color: "#F3F4F6", fontWeight: "bold"}}>
                        {evento.minuto}' - {evento.giocatore_nome}
                      </div>
                      <div style={{fontSize: "12px", color: "#94A3B8"}}>
                        {evento.squadra_reale} • {evento.descrizione}
                      </div>
                    </div>
                  </div>
                  <div style={{textAlign: "right"}}>
                    <div style={{
                      fontSize: "14px", 
                      fontWeight: "bold",
                      color: evento.lato === 'casa' ? '#2563EB' : '#DC2626'
                    }}>
                      {evento.lato === 'casa' ? partita.home.name : partita.away.name}
                    </div>
                    {evento.punti_fantasy && (
                      <div style={{fontSize: "12px", color: "#16A34A"}}>
                        +{evento.punti_fantasy} punti fantasy
                      </div>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  )
}

export default LiveMatch;
