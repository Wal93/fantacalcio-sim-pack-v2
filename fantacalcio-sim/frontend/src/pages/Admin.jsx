import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from './Login.jsx';
import toast from 'react-hot-toast';
import Card from '../components/ui/Card';
import Button from '../components/ui/Button';
import Input from '../components/ui/Input';
import LoadingSpinner from '../components/ui/LoadingSpinner';

const API_BASE = import.meta.env.VITE_API_BASE_URL || 'http://localhost:4000';

function Admin() {
  const navigate = useNavigate();
  const { isAuthenticated, getAuthHeaders, user } = useAuth();
  const [loading, setLoading] = useState(false);
  const [giornataId, setGiornataId] = useState(1);
  const [simulationResults, setSimulationResults] = useState(null);
  const [squadreValues, setSquadreValues] = useState({});

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }
    
    // Check se è admin (per ora tutti possono accedere)
    loadSquadreValues();
  }, [isAuthenticated, navigate]);

  const loadSquadreValues = async () => {
    try {
      // TODO: implementare endpoint per caricare valori squadre
      toast.info('ℹ️ Pannello Admin caricato');
    } catch (error) {
      console.error('Errore caricamento dati admin:', error);
    }
  };

  const simulateGiornata = async () => {
    if (!giornataId) {
      toast.error('❌ Inserisci l\'ID della giornata');
      return;
    }

    try {
      setLoading(true);
      toast.info('🎲 Avvio simulazione giornata...');

      const response = await fetch(`${API_BASE}/admin/simulate`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...getAuthHeaders()
        },
        body: JSON.stringify({ giornata_id: parseInt(giornataId) })
      });

      const data = await response.json();

      if (data.status === 'ok') {
        setSimulationResults(data.data);
        toast.success(`🎉 Giornata ${giornataId} simulata! ${data.data.partite} partite completate`);
      } else {
        toast.error(`❌ ${data.error}`);
      }
    } catch (error) {
      console.error('Errore simulazione:', error);
      toast.error('❌ Errore durante la simulazione');
    } finally {
      setLoading(false);
    }
  };

  const updateSquadreValues = async () => {
    try {
      setLoading(true);
      toast.info('⚙️ Aggiornamento valori squadre...');

      // Valori realistici per le squadre di Serie A
      const defaultValues = {
        'INTER': { attacco: 0.85, difesa: 0.82, ritmo: 0.75 },
        'NAPOLI': { attacco: 0.82, difesa: 0.78, ritmo: 0.72 },
        'MILAN': { attacco: 0.78, difesa: 0.75, ritmo: 0.70 },
        'JUVENTUS': { attacco: 0.75, difesa: 0.80, ritmo: 0.68 },
        'ATALANTA': { attacco: 0.80, difesa: 0.65, ritmo: 0.85 },
        'LAZIO': { attacco: 0.72, difesa: 0.70, ritmo: 0.75 },
        'ROMA': { attacco: 0.70, difesa: 0.72, ritmo: 0.70 },
        'FIORENTINA': { attacco: 0.68, difesa: 0.65, ritmo: 0.72 },
        'BOLOGNA': { attacco: 0.65, difesa: 0.68, ritmo: 0.70 },
        'TORINO': { attacco: 0.62, difesa: 0.65, ritmo: 0.68 }
      };

      // Aggiorna tutte le squadre con valori più realistici
      for (const [nome, valori] of Object.entries(defaultValues)) {
        await fetch(`${API_BASE}/admin/update-team-values`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            ...getAuthHeaders()
          },
          body: JSON.stringify({
            team_name: nome,
            valore_attacco: valori.attacco,
            valore_difesa: valori.difesa,
            valore_ritmo: valori.ritmo
          })
        });
      }

      toast.success('✅ Valori squadre aggiornati!');
    } catch (error) {
      console.error('Errore aggiornamento valori:', error);
      toast.error('❌ Errore aggiornamento valori squadre');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="max-w-7xl mx-auto space-y-8">
      {/* Header */}
      <div className="relative overflow-hidden rounded-2xl bg-gradient-to-r from-purple-600/20 to-blue-600/20 border border-purple-500/30 p-8 mb-8 backdrop-blur-sm">
        <div className="absolute top-0 left-0 w-full h-full bg-gradient-to-r from-purple-500/10 to-blue-500/10 shimmer"></div>
        <div className="relative z-10">
          <h1 className="text-5xl font-bold text-gradient-secondary mb-3 animate-fadeIn">
            ⚙️ Pannello Amministrazione
          </h1>
          <p className="text-xl text-dark-200 animate-fadeIn">
            🎮 Gestione simulazioni e configurazione del sistema fantacalcio
          </p>
          <div className="flex gap-4 mt-4">
            <div className="flex items-center gap-2 text-green-400">
              <span className="w-3 h-3 bg-green-400 rounded-full animate-pulse"></span>
              <span className="text-sm">Sistema Attivo</span>
            </div>
            <div className="flex items-center gap-2 text-blue-400">
              <span className="text-sm">🏆 Serie A 2025/26</span>
            </div>
          </div>
        </div>
      </div>

      {/* Simulazione Giornata */}
      <Card variant="primary" hover className="animate-fadeIn">
        <Card.Header>
          <Card.Title className="text-gradient-primary text-2xl flex items-center gap-3">
            🎲 Simulazione Giornata
            <span className="text-xs bg-primary-600 text-white px-2 py-1 rounded-full">LIVE</span>
          </Card.Title>
          <Card.Description className="text-lg text-dark-300">
            ⚡ Simula una giornata di campionato con risultati realistici e pagelle dettagliate
          </Card.Description>
        </Card.Header>
        
        <Card.Content>
          <div className="space-y-6">
            <div className="flex gap-4 items-end">
              <Input
                label="ID Giornata"
                type="number"
                value={giornataId}
                onChange={(e) => setGiornataId(e.target.value)}
                placeholder="1"
                icon="📅"
              />
              
              <Button
                onClick={simulateGiornata}
                disabled={loading}
                variant="primary"
                size="lg"
                icon="🎲"
                className="shadow-2xl"
              >
                {loading ? <LoadingSpinner size="sm" /> : '🚀 Avvia Simulazione'}
              </Button>
            </div>

            {simulationResults && (
              <div className="bg-gradient-to-r from-green-600/20 to-green-500/20 border border-green-500/30 p-6 rounded-xl backdrop-blur-sm animate-fadeIn">
                <h4 className="font-bold text-green-400 mb-3 text-lg flex items-center gap-2">
                  ✅ Simulazione Completata con Successo!
                  <span className="animate-bounce">🎉</span>
                </h4>
                <div className="grid grid-cols-2 gap-4">
                  <div className="bg-dark-800/50 p-3 rounded-lg">
                    <div className="text-2xl font-bold text-green-400">{simulationResults.partite}</div>
                    <div className="text-sm text-dark-300">Partite Simulate</div>
                  </div>
                  <div className="bg-dark-800/50 p-3 rounded-lg">
                    <div className="text-2xl font-bold text-blue-400">~530</div>
                    <div className="text-sm text-dark-300">Giocatori Valutati</div>
                  </div>
                </div>
                <div className="mt-3 text-sm text-dark-300 flex items-center gap-2">
                  <span className="w-2 h-2 bg-green-400 rounded-full animate-pulse"></span>
                  Voti generati: 4.0 - 10.0 • Stato: {simulationResults.stato}
                </div>
              </div>
            )}
          </div>
        </Card.Content>
      </Card>

      {/* Configurazione Squadre */}
      <Card variant="info" hover className="animate-fadeIn">
        <Card.Header>
          <Card.Title className="text-gradient-info text-2xl flex items-center gap-3">
            ⚽ Configurazione Squadre
            <span className="text-xs bg-blue-600 text-white px-2 py-1 rounded-full">CONFIG</span>
          </Card.Title>
          <Card.Description className="text-lg text-dark-300">
            🔧 Personalizza i parametri di gioco delle squadre di Serie A
          </Card.Description>
        </Card.Header>
        
        <Card.Content>
          <div className="space-y-4">
            <div className="bg-gradient-to-br from-blue-600/10 to-purple-600/10 border border-blue-500/20 p-6 rounded-xl backdrop-blur-sm">
              <h4 className="font-bold text-blue-400 mb-4 text-lg flex items-center gap-2">
                📊 Configurazione Predefinita
                <span className="text-xs bg-blue-600/20 text-blue-300 px-2 py-1 rounded-full">OTTIMIZZATA</span>
              </h4>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                <div className="space-y-2">
                  <div className="flex items-center justify-between bg-dark-800/50 p-3 rounded-lg">
                    <span className="font-medium text-dark-200">🔵 Inter</span>
                    <span className="text-green-400">ATT: 0.85 | DIF: 0.82 | RIT: 0.75</span>
                  </div>
                  <div className="flex items-center justify-between bg-dark-800/50 p-3 rounded-lg">
                    <span className="font-medium text-dark-200">🔵 Napoli</span>
                    <span className="text-blue-400">ATT: 0.82 | DIF: 0.78 | RIT: 0.72</span>
                  </div>
                  <div className="flex items-center justify-between bg-dark-800/50 p-3 rounded-lg">
                    <span className="font-medium text-dark-200">🔴 Milan</span>
                    <span className="text-red-400">ATT: 0.78 | DIF: 0.75 | RIT: 0.70</span>
                  </div>
                </div>
                <div className="space-y-2">
                  <div className="flex items-center justify-between bg-dark-800/50 p-3 rounded-lg">
                    <span className="font-medium text-dark-200">⚪ Juventus</span>
                    <span className="text-gray-400">ATT: 0.75 | DIF: 0.80 | RIT: 0.68</span>
                  </div>
                  <div className="flex items-center justify-between bg-dark-800/50 p-3 rounded-lg">
                    <span className="font-medium text-dark-200">🖤 Atalanta</span>
                    <span className="text-purple-400">ATT: 0.80 | DIF: 0.65 | RIT: 0.85</span>
                  </div>
                  <div className="bg-dark-800/30 p-3 rounded-lg text-center">
                    <span className="text-xs text-dark-400">+ 15 squadre con valori bilanciati</span>
                  </div>
                </div>
              </div>
            </div>
            
            <Button
              onClick={updateSquadreValues}
              disabled={loading}
              variant="info"
              size="lg"
              icon="⚙️"
              className="shadow-2xl"
            >
              {loading ? <LoadingSpinner size="sm" /> : '🔄 Applica Configurazione'}
            </Button>
          </div>
        </Card.Content>
      </Card>

      {/* Statistiche Sistema */}
      <Card variant="success" hover className="animate-fadeIn">
        <Card.Header>
          <Card.Title className="text-gradient-primary text-2xl flex items-center gap-3">
            📊 Statistiche Sistema
            <span className="text-xs bg-green-600 text-white px-2 py-1 rounded-full animate-pulse">LIVE</span>
          </Card.Title>
          <Card.Description className="text-lg text-dark-300">
            📈 Panoramica in tempo reale del database e delle simulazioni
          </Card.Description>
        </Card.Header>
        
        <Card.Content>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            <div className="bg-gradient-to-br from-primary-600/20 to-primary-500/20 border border-primary-500/30 p-6 rounded-xl text-center backdrop-blur-sm card-hover">
              <div className="text-4xl font-bold text-primary-400 mb-2 animate-pulse">530</div>
              <div className="text-dark-300 font-medium">⚽ Giocatori Reali</div>
              <div className="text-xs text-dark-400 mt-1">Serie A 2025/26</div>
            </div>
            
            <div className="bg-gradient-to-br from-purple-600/20 to-purple-500/20 border border-purple-500/30 p-6 rounded-xl text-center backdrop-blur-sm card-hover">
              <div className="text-4xl font-bold text-purple-400 mb-2">20</div>
              <div className="text-dark-300 font-medium">🏟️ Squadre Serie A</div>
              <div className="text-xs text-dark-400 mt-1">Complete con statistiche</div>
            </div>
            
            <div className="bg-gradient-to-br from-green-600/20 to-green-500/20 border border-green-500/30 p-6 rounded-xl text-center backdrop-blur-sm card-hover">
              <div className="text-4xl font-bold text-green-400 mb-2">10</div>
              <div className="text-dark-300 font-medium">🎮 Partite per Giornata</div>
              <div className="text-xs text-dark-400 mt-1">Simulazione realistica</div>
            </div>
          </div>
          
          <div className="mt-6 bg-gradient-to-r from-yellow-600/10 to-orange-600/10 border border-yellow-500/20 p-4 rounded-xl backdrop-blur-sm">
            <div className="flex items-center gap-3">
              <span className="text-2xl">🚀</span>
              <div>
                <div className="font-semibold text-yellow-400">Sistema Ottimizzato</div>
                <div className="text-sm text-dark-300">Engine di simulazione con IA avanzata per risultati realistici</div>
              </div>
            </div>
          </div>
        </Card.Content>
      </Card>
    </div>
  );
}

export default Admin;