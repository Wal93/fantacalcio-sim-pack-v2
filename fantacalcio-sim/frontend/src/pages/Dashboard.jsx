import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from './Login.jsx';
import toast from 'react-hot-toast';
import Card from '../components/ui/Card';
import Button from '../components/ui/Button';
import Modal from '../components/ui/Modal';
import Input from '../components/ui/Input';
import LoadingSpinner from '../components/ui/LoadingSpinner';

const API_BASE = import.meta.env.VITE_API_BASE_URL || 'http://localhost:4000';

function Dashboard() {
  const navigate = useNavigate();
  const { isAuthenticated, getAuthHeaders } = useAuth();
  const [leghe, setLeghe] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showCreateLega, setShowCreateLega] = useState(false);
  const [newLegaName, setNewLegaName] = useState('');

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }
    
    loadLeghe();
  }, [isAuthenticated, navigate]);

  const loadLeghe = async () => {
    try {
      setLoading(true);
      const response = await fetch(`${API_BASE}/leagues`, {
        headers: {
          'Content-Type': 'application/json',
          ...getAuthHeaders()
        }
      });

      if (response.ok) {
        const data = await response.json();
        if (data.status === 'ok') {
          setLeghe(data.data || []);
        } else {
          toast.error(`❌ ${data.error}`);
        }
      } else {
        throw new Error(`HTTP ${response.status}`);
      }
    } catch (error) {
      console.error('Errore caricamento leghe:', error);
      toast.error('❌ Errore caricamento leghe');
      setLeghe([]);
    } finally {
      setLoading(false);
    }
  };

  const createLega = async () => {
    if (!newLegaName.trim()) {
      toast.error('❌ Nome lega richiesto');
      return;
    }

    try {
      const response = await fetch(`${API_BASE}/leagues`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...getAuthHeaders()
        },
        body: JSON.stringify({ nome: newLegaName })
      });

      const data = await response.json();

      if (data.status === 'ok') {
        toast.success('✅ Lega creata con successo!');
        setNewLegaName('');
        setShowCreateLega(false);
        loadLeghe();
      } else {
        toast.error(`❌ ${data.error}`);
      }
    } catch (error) {
      console.error('Errore creazione lega:', error);
      toast.error('❌ Errore creazione lega');
    }
  };

  const startLiveMatch = async () => {
    try {
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
        toast.success('🚀 Match avviato!');
        navigate(`/live-match/${data.data.match_id}`);
      } else {
        toast.error(`❌ ${data.error}`);
      }
    } catch (error) {
      console.error('Errore avvio match:', error);
      toast.error('❌ Errore avvio match');
    }
  };

  const simulateGiornata = async () => {
    try {
      const response = await fetch(`${API_BASE}/admin/simulate`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          ...getAuthHeaders()
        },
        body: JSON.stringify({ giornata_id: 1 })
      });

      if (response.ok) {
        toast.success('⚽ Giornata simulata con successo!');
      } else {
        throw new Error(`HTTP ${response.status}`);
      }
    } catch (error) {
      console.error('Errore simulazione:', error);
      toast.error('❌ Errore simulazione giornata');
    }
  };

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-96">
        <LoadingSpinner size="lg" text="Caricamento dashboard..." />
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto space-y-8">
      {/* Header */}
      <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
        <div>
          <h1 className="text-4xl font-bold text-gradient mb-2">
            🏠 Dashboard
          </h1>
          <p className="text-dark-400">
            Benvenuto nel tuo centro di controllo fantacalcio
          </p>
        </div>
        
        <div className="flex flex-wrap gap-3">
          <Button
            onClick={() => setShowCreateLega(true)}
            icon="➕"
            variant="success"
          >
            Nuova Lega
          </Button>
          
          <Button
            onClick={simulateGiornata}
            icon="⚽"
            variant="warning"
          >
            Simula Giornata
          </Button>
          
          <Button
            onClick={startLiveMatch}
            icon="🚀"
            variant="danger"
          >
            Start Live Match
          </Button>
        </div>
      </div>

      {/* Statistiche rapide */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <Card className="text-center">
          <div className="text-3xl mb-2">🏆</div>
          <div className="text-2xl font-bold text-primary-400">{leghe.length}</div>
          <div className="text-dark-400">Leghe Attive</div>
        </Card>
        
        <Card className="text-center">
          <div className="text-3xl mb-2">👥</div>
          <div className="text-2xl font-bold text-green-400">0</div>
          <div className="text-dark-400">Squadre Totali</div>
        </Card>
        
        <Card className="text-center">
          <div className="text-3xl mb-2">⚽</div>
          <div className="text-2xl font-bold text-yellow-400">0</div>
          <div className="text-dark-400">Partite Giocate</div>
        </Card>
        
        <Card className="text-center">
          <div className="text-3xl mb-2">📊</div>
          <div className="text-2xl font-bold text-blue-400">0</div>
          <div className="text-dark-400">Punti Totali</div>
        </Card>
      </div>

      {/* Leghe */}
      <div>
        <h2 className="text-2xl font-bold text-dark-100 mb-6">Le Tue Leghe</h2>
        
        {leghe.length === 0 ? (
          <Card className="text-center py-16">
            <div className="text-6xl mb-4">🏆</div>
            <h3 className="text-xl font-bold text-dark-100 mb-2">Nessuna Lega Trovata</h3>
            <p className="text-dark-400 mb-6">
              Crea la tua prima lega per iniziare a giocare!
            </p>
            <Button
              onClick={() => setShowCreateLega(true)}
              icon="➕"
              variant="primary"
            >
              Crea Prima Lega
            </Button>
          </Card>
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {leghe.map(lega => (
              <Card
                key={lega.id}
                hover
                onClick={() => navigate(`/live-match?lega=${lega.id}`)}
                className="cursor-pointer"
              >
                <Card.Header>
                  <Card.Title className="text-primary-400">
                    🏆 {lega.nome}
                  </Card.Title>
                  <Card.Description>
                    Creata il {new Date(lega.created_at).toLocaleDateString()}
                  </Card.Description>
                </Card.Header>
                
                <Card.Content>
                  <div className="flex justify-between items-center">
                    <span className="text-sm text-dark-400">
                      👥 Squadre: {lega.num_squadre || 0}
                    </span>
                    <span className="px-2 py-1 bg-primary-600 text-white text-xs rounded-full">
                      ATTIVA
                    </span>
                  </div>
                </Card.Content>
              </Card>
            ))}
          </div>
        )}
      </div>

      {/* Azioni rapide */}
      <Card>
        <Card.Header>
          <Card.Title>⚡ Azioni Rapide</Card.Title>
          <Card.Description>
            Accesso veloce alle funzionalità principali
          </Card.Description>
        </Card.Header>
        
        <Card.Content>
          <div className="flex flex-wrap gap-4">
            <Button
              onClick={() => navigate('/rosters')}
              icon="👥"
              variant="primary"
            >
              Gestisci Roster
            </Button>
            
            <Button
              onClick={() => navigate('/formations')}
              icon="⚽"
              variant="secondary"
            >
              Schiera Formazione
            </Button>
            
            <Button
              onClick={() => navigate('/live-match')}
              icon="📺"
              variant="info"
            >
              Live Match Demo
            </Button>
            
            <Button
              onClick={() => navigate('/transfers')}
              icon="🔄"
              variant="outline"
            >
              Trasferimenti
            </Button>
          </div>
        </Card.Content>
      </Card>

      {/* Modal Crea Lega */}
      <Modal
        isOpen={showCreateLega}
        onClose={() => setShowCreateLega(false)}
        title="➕ Crea Nuova Lega"
        size="md"
      >
        <div className="space-y-6">
          <Input
            label="Nome della Lega"
            value={newLegaName}
            onChange={(e) => setNewLegaName(e.target.value)}
            placeholder="Inserisci il nome della lega..."
            icon="🏆"
          />
          
          <div className="flex justify-end gap-3">
            <Button
              onClick={() => setShowCreateLega(false)}
              variant="secondary"
            >
              Annulla
            </Button>
            <Button
              onClick={createLega}
              variant="success"
              icon="✅"
            >
              Crea Lega
            </Button>
          </div>
        </div>
      </Modal>
    </div>
  );
}

export default Dashboard;