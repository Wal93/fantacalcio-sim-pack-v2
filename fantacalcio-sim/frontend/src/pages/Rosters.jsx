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

function Rosters() {
  const navigate = useNavigate();
  const { isAuthenticated, getAuthHeaders } = useAuth();
  const [rosters, setRosters] = useState([]);
  const [players, setPlayers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showAddPlayer, setShowAddPlayer] = useState(false);
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedPosition, setSelectedPosition] = useState('all');

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }
    
    loadRosters();
    loadPlayers();
  }, [isAuthenticated, navigate]);

  const loadRosters = async () => {
    try {
      setLoading(true);
      // TODO: Implementare API per caricare i roster dell'utente
      // Per ora simuliamo con dati mock
      setRosters([
        {
          id: 1,
          name: 'Squadra Principale',
          players: [
            { id: 1, name: 'Donnarumma', position: 'P', team: 'PSG', value: 15 },
            { id: 2, name: 'Bastoni', position: 'D', team: 'Inter', value: 12 },
            { id: 3, name: 'Barella', position: 'C', team: 'Inter', value: 18 },
            { id: 4, name: 'Leao', position: 'A', team: 'Milan', value: 20 }
          ]
        }
      ]);
    } catch (error) {
      console.error('Errore caricamento roster:', error);
      toast.error('❌ Errore caricamento roster');
    } finally {
      setLoading(false);
    }
  };

  const loadPlayers = async () => {
    try {
      // TODO: Implementare API per caricare il listone giocatori
      // Per ora simuliamo con dati mock
      setPlayers([
        { id: 1, name: 'Donnarumma', position: 'P', team: 'PSG', value: 15, available: true },
        { id: 2, name: 'Bastoni', position: 'D', team: 'Inter', value: 12, available: true },
        { id: 3, name: 'Barella', position: 'C', team: 'Inter', value: 18, available: true },
        { id: 4, name: 'Leao', position: 'A', team: 'Milan', value: 20, available: true },
        { id: 5, name: 'Szczesny', position: 'P', team: 'Juventus', value: 14, available: true },
        { id: 6, name: 'Skriniar', position: 'D', team: 'Inter', value: 13, available: true },
        { id: 7, name: 'Locatelli', position: 'C', team: 'Juventus', value: 16, available: true },
        { id: 8, name: 'Osimhen', position: 'A', team: 'Napoli', value: 22, available: true }
      ]);
    } catch (error) {
      console.error('Errore caricamento giocatori:', error);
      toast.error('❌ Errore caricamento giocatori');
    }
  };

  const filteredPlayers = players.filter(player => {
    const matchesSearch = player.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         player.team.toLowerCase().includes(searchTerm.toLowerCase());
    const matchesPosition = selectedPosition === 'all' || player.position === selectedPosition;
    return matchesSearch && matchesPosition && player.available;
  });

  const addPlayerToRoster = (playerId) => {
    // TODO: Implementare logica per aggiungere giocatore al roster
    toast.success(`✅ Giocatore aggiunto al roster!`);
    setShowAddPlayer(false);
  };

  const removePlayerFromRoster = (rosterId, playerId) => {
    // TODO: Implementare logica per rimuovere giocatore dal roster
    toast.success(`✅ Giocatore rimosso dal roster!`);
  };

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-96">
        <LoadingSpinner size="lg" text="Caricamento roster..." />
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto space-y-8">
      {/* Header */}
      <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
        <div>
          <h1 className="text-4xl font-bold text-gradient mb-2">
            👥 Gestione Roster
          </h1>
          <p className="text-dark-400">
            Gestisci la tua squadra e acquista nuovi giocatori
          </p>
        </div>
        
        <div className="flex gap-3">
          <Button
            onClick={() => setShowAddPlayer(true)}
            icon="➕"
            variant="success"
          >
            Aggiungi Giocatore
          </Button>
          
          <Button
            onClick={() => navigate('/formations')}
            icon="⚽"
            variant="primary"
          >
            Schiera Formazione
          </Button>
        </div>
      </div>

      {/* Roster attuale */}
      <div>
        <h2 className="text-2xl font-bold text-dark-100 mb-6">Il Tuo Roster</h2>
        
        {rosters.map(roster => (
          <Card key={roster.id} className="mb-6">
            <Card.Header>
              <Card.Title className="text-primary-400">
                🏆 {roster.name}
              </Card.Title>
              <Card.Description>
                {roster.players.length} giocatori • Budget rimanente: €50M
              </Card.Description>
            </Card.Header>
            
            <Card.Content>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                {roster.players.map(player => (
                  <div
                    key={player.id}
                    className="bg-dark-700 p-4 rounded-lg border border-dark-600 hover:border-primary-500 transition-colors duration-200"
                  >
                    <div className="flex justify-between items-start mb-2">
                      <span className="text-xs bg-primary-600 text-white px-2 py-1 rounded">
                        {player.position}
                      </span>
                      <button
                        onClick={() => removePlayerFromRoster(roster.id, player.id)}
                        className="text-red-400 hover:text-red-300 text-sm"
                      >
                        ✕
                      </button>
                    </div>
                    
                    <h3 className="font-bold text-dark-100 mb-1">{player.name}</h3>
                    <p className="text-sm text-dark-400 mb-1">{player.team}</p>
                    <p className="text-sm text-yellow-400 font-medium">€{player.value}M</p>
                  </div>
                ))}
              </div>
            </Card.Content>
          </Card>
        ))}
      </div>

      {/* Modal Aggiungi Giocatore */}
      <Modal
        isOpen={showAddPlayer}
        onClose={() => setShowAddPlayer(false)}
        title="➕ Aggiungi Giocatore al Roster"
        size="lg"
      >
        <div className="space-y-6">
          {/* Filtri */}
          <div className="flex gap-4">
            <Input
              placeholder="Cerca giocatore o squadra..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              icon="🔍"
              className="flex-1"
            />
            
            <select
              value={selectedPosition}
              onChange={(e) => setSelectedPosition(e.target.value)}
              className="px-4 py-3 bg-dark-700 border border-dark-600 rounded-lg text-dark-100 focus:outline-none focus:ring-2 focus:ring-primary-500"
            >
              <option value="all">Tutte le posizioni</option>
              <option value="P">Portieri</option>
              <option value="D">Difensori</option>
              <option value="C">Centrocampisti</option>
              <option value="A">Attaccanti</option>
            </select>
          </div>
          
          {/* Lista giocatori */}
          <div className="max-h-96 overflow-y-auto space-y-2">
            {filteredPlayers.map(player => (
              <div
                key={player.id}
                className="flex items-center justify-between p-3 bg-dark-700 rounded-lg border border-dark-600 hover:border-primary-500 transition-colors duration-200"
              >
                <div className="flex items-center gap-3">
                  <span className="text-xs bg-primary-600 text-white px-2 py-1 rounded">
                    {player.position}
                  </span>
                  <div>
                    <h3 className="font-bold text-dark-100">{player.name}</h3>
                    <p className="text-sm text-dark-400">{player.team}</p>
                  </div>
                </div>
                
                <div className="flex items-center gap-3">
                  <span className="text-yellow-400 font-medium">€{player.value}M</span>
                  <Button
                    onClick={() => addPlayerToRoster(player.id)}
                    size="sm"
                    variant="success"
                    icon="➕"
                  >
                    Aggiungi
                  </Button>
                </div>
              </div>
            ))}
          </div>
          
          {filteredPlayers.length === 0 && (
            <div className="text-center py-8 text-dark-400">
              <div className="text-4xl mb-2">🔍</div>
              <p>Nessun giocatore trovato</p>
            </div>
          )}
        </div>
      </Modal>
    </div>
  );
}

export default Rosters;
