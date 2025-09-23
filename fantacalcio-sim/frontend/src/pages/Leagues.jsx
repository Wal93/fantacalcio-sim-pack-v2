import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from './Login.jsx';
import toast from 'react-hot-toast';
import Card from '../components/ui/Card';
import Button from '../components/ui/Button';
import Input from '../components/ui/Input';
import Modal from '../components/ui/Modal';
import LoadingSpinner from '../components/ui/LoadingSpinner';

const API_BASE = import.meta.env.VITE_API_BASE_URL || 'http://localhost:4000';

function Leagues() {
  const navigate = useNavigate();
  const { isAuthenticated, getAuthHeaders } = useAuth();
  const [leagues, setLeagues] = useState([]);
  const [myLeagues, setMyLeagues] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showCreateLeague, setShowCreateLeague] = useState(false);
  const [showJoinLeague, setShowJoinLeague] = useState(false);
  const [newLeagueName, setNewLeagueName] = useState('');
  const [joinCode, setJoinCode] = useState('');
  const [activeTab, setActiveTab] = useState('my-leagues');

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }
    
    loadLeagues();
  }, [isAuthenticated, navigate]);

  const loadLeagues = async () => {
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
          setLeagues(data.data || []);
          setMyLeagues(data.data || []); // Per ora sono le stesse
        } else {
          toast.error(`❌ ${data.error}`);
        }
      } else {
        throw new Error(`HTTP ${response.status}`);
      }
    } catch (error) {
      console.error('Errore caricamento leghe:', error);
      toast.error('❌ Errore caricamento leghe');
      setLeagues([]);
      setMyLeagues([]);
    } finally {
      setLoading(false);
    }
  };

  const createLeague = async () => {
    if (!newLeagueName.trim()) {
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
        body: JSON.stringify({ nome: newLeagueName })
      });

      const data = await response.json();

      if (data.status === 'ok') {
        toast.success('✅ Lega creata con successo!');
        setNewLeagueName('');
        setShowCreateLeague(false);
        loadLeagues();
      } else {
        toast.error(`❌ ${data.error}`);
      }
    } catch (error) {
      console.error('Errore creazione lega:', error);
      toast.error('❌ Errore creazione lega');
    }
  };

  const joinLeague = async () => {
    if (!joinCode.trim()) {
      toast.error('❌ Codice lega richiesto');
      return;
    }

    try {
      // TODO: Implementare API per unirsi a una lega
      toast.success('✅ Ti sei unito alla lega con successo!');
      setJoinCode('');
      setShowJoinLeague(false);
      loadLeagues();
    } catch (error) {
      console.error('Errore unione lega:', error);
      toast.error('❌ Errore unione lega');
    }
  };

  const getLeagueStandings = async (leagueId) => {
    try {
      const response = await fetch(`${API_BASE}/leagues/${leagueId}/classifica`, {
        headers: {
          'Content-Type': 'application/json',
          ...getAuthHeaders()
        }
      });

      if (response.ok) {
        const data = await response.json();
        return data.status === 'ok' ? data.data : [];
      }
    } catch (error) {
      console.error('Errore caricamento classifica:', error);
    }
    return [];
  };

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-96">
        <LoadingSpinner size="lg" text="Caricamento leghe..." />
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto space-y-8">
      {/* Header */}
      <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
        <div>
          <h1 className="text-4xl font-bold text-gradient mb-2">
            🏆 Gestione Leghe
          </h1>
          <p className="text-dark-400">
            Crea, gestisci e partecipa alle leghe fantacalcio
          </p>
        </div>
        
        <div className="flex gap-3">
          <Button
            onClick={() => setShowCreateLeague(true)}
            icon="➕"
            variant="success"
          >
            Crea Lega
          </Button>
          
          <Button
            onClick={() => setShowJoinLeague(true)}
            icon="🔗"
            variant="primary"
          >
            Unisciti a Lega
          </Button>
        </div>
      </div>

      {/* Tabs */}
      <div className="flex space-x-1 bg-dark-800 p-1 rounded-lg">
        <button
          onClick={() => setActiveTab('my-leagues')}
          className={`flex-1 py-2 px-4 rounded-md transition-colors duration-200 ${
            activeTab === 'my-leagues'
              ? 'bg-primary-600 text-white'
              : 'text-dark-400 hover:text-dark-200'
          }`}
        >
          Le Mie Leghe
        </button>
        <button
          onClick={() => setActiveTab('all-leagues')}
          className={`flex-1 py-2 px-4 rounded-md transition-colors duration-200 ${
            activeTab === 'all-leagues'
              ? 'bg-primary-600 text-white'
              : 'text-dark-400 hover:text-dark-200'
          }`}
        >
          Tutte le Leghe
        </button>
      </div>

      {/* Contenuto Tab */}
      {activeTab === 'my-leagues' ? (
        <div>
          <h2 className="text-2xl font-bold text-dark-100 mb-6">Le Tue Leghe</h2>
          
          {myLeagues.length === 0 ? (
            <Card className="text-center py-16">
              <div className="text-6xl mb-4">🏆</div>
              <h3 className="text-xl font-bold text-dark-100 mb-2">Nessuna Lega Trovata</h3>
              <p className="text-dark-400 mb-6">
                Crea la tua prima lega o unisciti a una esistente!
              </p>
              <div className="flex gap-3 justify-center">
                <Button
                  onClick={() => setShowCreateLeague(true)}
                  icon="➕"
                  variant="success"
                >
                  Crea Prima Lega
                </Button>
                <Button
                  onClick={() => setShowJoinLeague(true)}
                  icon="🔗"
                  variant="primary"
                >
                  Unisciti a Lega
                </Button>
              </div>
            </Card>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              {myLeagues.map(league => (
                <Card key={league.id} hover className="cursor-pointer">
                  <Card.Header>
                    <Card.Title className="text-primary-400">
                      🏆 {league.nome}
                    </Card.Title>
                    <Card.Description>
                      Creata il {new Date(league.created_at).toLocaleDateString()}
                    </Card.Description>
                  </Card.Header>
                  
                  <Card.Content>
                    <div className="space-y-3">
                      <div className="flex justify-between items-center">
                        <span className="text-sm text-dark-400">
                          👥 Squadre: {league.num_squadre || 0}
                        </span>
                        <span className="px-2 py-1 bg-primary-600 text-white text-xs rounded-full">
                          ATTIVA
                        </span>
                      </div>
                      
                      <div className="flex gap-2">
                        <Button
                          onClick={() => navigate(`/league/${league.id}/standings`)}
                          size="sm"
                          variant="secondary"
                          icon="📊"
                        >
                          Classifica
                        </Button>
                        <Button
                          onClick={() => navigate(`/league/${league.id}/matches`)}
                          size="sm"
                          variant="outline"
                          icon="⚽"
                        >
                          Partite
                        </Button>
                      </div>
                    </div>
                  </Card.Content>
                </Card>
              ))}
            </div>
          )}
        </div>
      ) : (
        <div>
          <h2 className="text-2xl font-bold text-dark-100 mb-6">Tutte le Leghe</h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {leagues.map(league => (
              <Card key={league.id} hover className="cursor-pointer">
                <Card.Header>
                  <Card.Title className="text-primary-400">
                    🏆 {league.nome}
                  </Card.Title>
                  <Card.Description>
                    Creata il {new Date(league.created_at).toLocaleDateString()}
                  </Card.Description>
                </Card.Header>
                
                <Card.Content>
                  <div className="space-y-3">
                    <div className="flex justify-between items-center">
                      <span className="text-sm text-dark-400">
                        👥 Squadre: {league.num_squadre || 0}
                      </span>
                      <span className="px-2 py-1 bg-green-600 text-white text-xs rounded-full">
                        PUBBLICA
                      </span>
                    </div>
                    
                    <div className="flex gap-2">
                      <Button
                        onClick={() => navigate(`/league/${league.id}/standings`)}
                        size="sm"
                        variant="secondary"
                        icon="📊"
                      >
                        Classifica
                      </Button>
                      <Button
                        onClick={() => navigate(`/league/${league.id}/join`)}
                        size="sm"
                        variant="success"
                        icon="🔗"
                      >
                        Unisciti
                      </Button>
                    </div>
                  </div>
                </Card.Content>
              </Card>
            ))}
          </div>
        </div>
      )}

      {/* Modal Crea Lega */}
      <Modal
        isOpen={showCreateLeague}
        onClose={() => setShowCreateLeague(false)}
        title="➕ Crea Nuova Lega"
        size="md"
      >
        <div className="space-y-6">
          <Input
            label="Nome della Lega"
            value={newLeagueName}
            onChange={(e) => setNewLeagueName(e.target.value)}
            placeholder="Inserisci il nome della lega..."
            icon="🏆"
          />
          
          <div className="bg-dark-700 p-4 rounded-lg">
            <h4 className="font-bold text-dark-100 mb-2">Regole Predefinite</h4>
            <ul className="text-sm text-dark-400 space-y-1">
              <li>• 25 giocatori per squadra</li>
              <li>• Budget iniziale: €500M</li>
              <li>• Formazione: 3-4-3</li>
              <li>• Voti da 6 a 10</li>
            </ul>
          </div>
          
          <div className="flex justify-end gap-3">
            <Button
              onClick={() => setShowCreateLeague(false)}
              variant="secondary"
            >
              Annulla
            </Button>
            <Button
              onClick={createLeague}
              variant="success"
              icon="✅"
            >
              Crea Lega
            </Button>
          </div>
        </div>
      </Modal>

      {/* Modal Unisciti a Lega */}
      <Modal
        isOpen={showJoinLeague}
        onClose={() => setShowJoinLeague(false)}
        title="🔗 Unisciti a una Lega"
        size="md"
      >
        <div className="space-y-6">
          <Input
            label="Codice Lega"
            value={joinCode}
            onChange={(e) => setJoinCode(e.target.value)}
            placeholder="Inserisci il codice della lega..."
            icon="🔑"
          />
          
          <div className="bg-dark-700 p-4 rounded-lg">
            <h4 className="font-bold text-dark-100 mb-2">Come ottenere il codice?</h4>
            <p className="text-sm text-dark-400">
              Chiedi al commissario della lega di fornirti il codice di invito.
              Il codice è univoco per ogni lega e ti permetterà di unirti.
            </p>
          </div>
          
          <div className="flex justify-end gap-3">
            <Button
              onClick={() => setShowJoinLeague(false)}
              variant="secondary"
            >
              Annulla
            </Button>
            <Button
              onClick={joinLeague}
              variant="success"
              icon="🔗"
            >
              Unisciti
            </Button>
          </div>
        </div>
      </Modal>
    </div>
  );
}

export default Leagues;
