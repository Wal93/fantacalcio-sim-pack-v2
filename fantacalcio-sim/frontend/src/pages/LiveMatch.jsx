import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from './Login.jsx';
import toast from 'react-hot-toast';
import Card from '../components/ui/Card';
import Button from '../components/ui/Button';
import LoadingSpinner from '../components/ui/LoadingSpinner';

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
      <div className="flex justify-center items-center min-h-96 flex-col">
        <LoadingSpinner size="xl" text="Caricamento Match Enterprise..." />
        <p className="text-dark-400 mt-4">Connessione al sistema live in corso</p>
      </div>
    );
  }

  // Error state
  if (error) {
    return (
      <div className="flex justify-center items-center min-h-96 flex-col">
        <div className="text-6xl mb-4">❌</div>
        <h3 className="text-red-400 text-xl mb-2">Errore Sistema Enterprise</h3>
        <p className="text-dark-400 mb-6">{error}</p>
        <Button
          onClick={() => window.location.reload()}
          variant="success"
          icon="🔄"
        >
          Ricarica
        </Button>
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto space-y-8">
      
      {/* Header Live Match */}
      <Card className="border-primary-600">
        <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-6">
          <div>
            <h1 className="text-3xl font-bold text-gradient mb-2">
              ⚽ LIVE MATCH ENTERPRISE
            </h1>
            <div className="text-sm text-dark-400">
              Lega ID: {status?.lega_id || 1} • Match ID: {finalMatchId}
            </div>
            {finalMatchId === 'demo' && (
              <Button 
                onClick={iniziaPartitaEnterprise}
                disabled={loading}
                loading={loading}
                variant="success"
                size="sm"
                className="mt-3"
                icon="🚀"
              >
                {loading ? "Avvio..." : "Avvia Match Reale"}
              </Button>
            )}
          </div>
          
          <div className="text-center">
            <div className="text-2xl lg:text-3xl font-bold text-dark-100 mb-1">
              {partita.home.name} vs {partita.away.name}
            </div>
            <div className="text-sm text-dark-400">
              {status?.squadre?.casa?.proprietario || 'Mario Rossi'} vs {status?.squadre?.trasferta?.proprietario || 'Luigi Verdi'}
            </div>
          </div>
          
          <div className="text-center">
            <div className={`text-4xl lg:text-5xl font-bold ${status?.partita_finita ? 'text-red-400' : 'text-primary-400'}`}>
              {status?.minuto_corrente || 67}'
            </div>
            <div className={`text-sm font-bold ${status?.partita_finita ? 'text-red-400' : 'text-primary-400'}`}>
              {status?.partita_finita ? "FINALE" : "IN CORSO"}
            </div>
            {!status?.partita_finita && (
              <div className="text-xs text-dark-400 mt-1">
                -{Math.ceil((status?.tempo_rimanente_ms || 180000) / 1000)}s
              </div>
            )}
          </div>
        </div>
      </Card>
      {/* Campo di Gioco */}
      <Card className="overflow-hidden p-0">
        <div className="relative w-full h-96 lg:h-[600px] bg-gradient-to-br from-green-600 via-green-500 to-green-600 border-4 border-white rounded-xl overflow-hidden">
          {/* Pattern del campo */}
          <div className="absolute inset-0 opacity-20" style={{
            backgroundImage: "linear-gradient(90deg, rgba(255,255,255,0.1) 50%, transparent 50%), linear-gradient(rgba(255,255,255,0.1) 50%, transparent 50%)",
            backgroundSize: "20px 20px"
          }} />
          
          {/* Linee del campo */}
          <div className="absolute top-1/2 left-0 right-0 h-0.5 bg-white transform -translate-y-1/2" />
          <div className="absolute top-0 bottom-0 left-1/2 w-0.5 bg-white transform -translate-x-1/2" />
          
          {/* Cerchio centrale */}
          <div className="absolute top-1/2 left-1/2 w-24 h-24 lg:w-32 lg:h-32 border-2 border-white rounded-full transform -translate-x-1/2 -translate-y-1/2" />
          
          {/* Aree di rigore */}
          <div className="absolute top-0 left-1/2 w-48 lg:w-56 h-24 lg:h-28 border-2 border-white border-t-0 transform -translate-x-1/2" />
          <div className="absolute bottom-0 left-1/2 w-48 lg:w-56 h-24 lg:h-28 border-2 border-white border-b-0 transform -translate-x-1/2" />
          
          {/* Giocatori squadra casa */}
          {partita.home.players && partita.home.players.map(p => (
            <div 
              key={`home-${p.id}`} 
              className="absolute flex flex-col items-center transform -translate-x-1/2 -translate-y-1/2 animate-fadeIn"
              style={{
                left: `${p.x || 20}%`,
                top: `${p.y || 50}%`
              }}
            >
              <div className="w-8 h-8 lg:w-10 lg:h-10 bg-blue-600 rounded-full flex items-center justify-center text-white text-xs lg:text-sm font-bold border-2 border-white shadow-lg hover:scale-110 transition-transform duration-200">
                {p.name?.split(' ')[0] || 'P'}
              </div>
              <div className="text-xs text-white text-shadow mt-1 font-medium">
                {p.role || 'P'}
              </div>
            </div>
          ))}
          
          {/* Giocatori squadra trasferta */}
          {partita.away.players && partita.away.players.map(p => (
            <div 
              key={`away-${p.id}`} 
              className="absolute flex flex-col items-center transform -translate-x-1/2 -translate-y-1/2 animate-fadeIn"
              style={{
                left: `${p.x || 80}%`,
                top: `${p.y || 50}%`
              }}
            >
              <div className="w-8 h-8 lg:w-10 lg:h-10 bg-red-600 rounded-full flex items-center justify-center text-white text-xs lg:text-sm font-bold border-2 border-white shadow-lg hover:scale-110 transition-transform duration-200">
                {p.name?.split(' ')[0] || 'P'}
              </div>
              <div className="text-xs text-white text-shadow mt-1 font-medium">
                {p.role || 'P'}
              </div>
            </div>
          ))}
        </div>
      </Card>

      {/* Tabellone Risultato */}
      <Card className="border-primary-600">
        <div className="flex items-center justify-center gap-8 lg:gap-16">
          {/* Squadra Casa */}
          <div className="text-center flex-1">
            <div className="text-xl lg:text-2xl font-bold text-blue-400 mb-3">
              {partita.home.name}
            </div>
            <div className="text-sm lg:text-base text-dark-400 mb-2">
              {status?.squadre?.casa?.proprietario || 'Mario Rossi'}
            </div>
            <div className="text-5xl lg:text-6xl font-bold text-dark-100">
              {status?.risultato?.casa || 1}
            </div>
          </div>
          
          {/* Risultato Centrale */}
          <div className="flex flex-col items-center p-6 bg-primary-600 bg-opacity-10 rounded-xl border-2 border-primary-600">
            <div className="text-3xl lg:text-4xl font-bold text-primary-400">
              {status?.risultato?.casa || 1} - {status?.risultato?.trasferta || 2}
            </div>
            <div className="text-sm text-primary-400 mt-2">
              {status?.minuto_corrente || 67}' {status?.partita_finita ? "FT" : ""}
            </div>
            <div className="text-xs text-dark-400 mt-1">
              Eventi: {status?.statistiche?.eventi_totali || eventi.length}
            </div>
          </div>
          
          {/* Squadra Trasferta */}
          <div className="text-center flex-1">
            <div className="text-xl lg:text-2xl font-bold text-red-400 mb-3">
              {partita.away.name}
            </div>
            <div className="text-sm lg:text-base text-dark-400 mb-2">
              {status?.squadre?.trasferta?.proprietario || 'Luigi Verdi'}
            </div>
            <div className="text-5xl lg:text-6xl font-bold text-dark-100">
              {status?.risultato?.trasferta || 2}
            </div>
          </div>
        </div>
      </Card>

      {/* Cronaca Eventi */}
      <Card>
        <Card.Header>
          <div className="flex justify-between items-center">
            <Card.Title className="text-primary-400">
              📋 Cronaca Live Enterprise
            </Card.Title>
            <div className="text-xs text-dark-400">
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
        </Card.Header>
        
        <Card.Content>
          {eventi.length === 0 ? (
            <div className="text-center py-12 text-dark-400">
              <div className="text-5xl mb-4">⏳</div>
              <h4 className="text-yellow-400 text-lg font-bold mb-2">Sistema Enterprise Attivo</h4>
              <p>In attesa del primo evento dalla simulazione Serie A...</p>
            </div>
          ) : (
            <div className="space-y-3 max-h-96 overflow-y-auto">
              {eventi.map((evento, i) => (
                <div 
                  key={evento.id} 
                  className={`p-4 rounded-lg border-l-4 animate-fadeIn ${
                    evento.lato === 'casa' 
                      ? 'border-blue-500 bg-blue-500 bg-opacity-10' 
                      : 'border-red-500 bg-red-500 bg-opacity-10'
                  }`}
                >
                  <div className="flex justify-between items-center">
                    <div className="flex items-center gap-4">
                      <div className="text-2xl w-10 text-center animate-bounce">
                        {evento.emoji}
                      </div>
                      <div>
                        <div className="font-bold text-dark-100 text-lg">
                          {evento.minuto}' - {evento.giocatore_nome}
                        </div>
                        <div className="text-sm text-dark-400">
                          {evento.squadra_reale} • {evento.descrizione}
                        </div>
                      </div>
                    </div>
                    <div className="text-right">
                      <div className={`font-bold ${
                        evento.lato === 'casa' ? 'text-blue-400' : 'text-red-400'
                      }`}>
                        {evento.lato === 'casa' ? partita.home.name : partita.away.name}
                      </div>
                      {evento.punti_fantasy && (
                        <div className="text-sm text-green-400 font-medium">
                          +{evento.punti_fantasy} punti fantasy
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              ))}
            </div>
          )}
        </Card.Content>
      </Card>
    </div>
  )
}

export default LiveMatch;
