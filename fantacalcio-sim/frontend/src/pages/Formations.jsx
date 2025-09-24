import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from './Login.jsx';
import toast from 'react-hot-toast';
import Card from '../components/ui/Card';
import Button from '../components/ui/Button';
import Modal from '../components/ui/Modal';
import LoadingSpinner from '../components/ui/LoadingSpinner';
import StatCard from '../components/ui/StatCard';

const API_BASE = import.meta.env.VITE_API_BASE_URL || 'http://localhost:4000';

function Formations() {
  const navigate = useNavigate();
  const { isAuthenticated, getAuthHeaders } = useAuth();
  const [formation, setFormation] = useState({
    goalkeeper: null,
    defenders: [],
    midfielders: [],
    forwards: []
  });
  const [availablePlayers, setAvailablePlayers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [showPlayerSelect, setShowPlayerSelect] = useState(false);
  const [selectedPosition, setSelectedPosition] = useState('');
  const [selectedSlot, setSelectedSlot] = useState(null);

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }
    
    loadFormation();
    loadAvailablePlayers();
  }, [isAuthenticated, navigate]);

  const loadFormation = async () => {
    try {
      setLoading(true);
      // TODO: Implementare API per caricare la formazione attuale
      // Per ora simuliamo con dati mock
      setFormation({
        goalkeeper: { id: 1, name: 'Donnarumma', team: 'PSG', position: 'P' },
        defenders: [
          { id: 2, name: 'Bastoni', team: 'Inter', position: 'D' },
          { id: 3, name: 'Skriniar', team: 'Inter', position: 'D' },
          { id: 4, name: 'Dimarco', team: 'Inter', position: 'D' }
        ],
        midfielders: [
          { id: 5, name: 'Barella', team: 'Inter', position: 'C' },
          { id: 6, name: 'Locatelli', team: 'Juventus', position: 'C' },
          { id: 7, name: 'Pogba', team: 'Juventus', position: 'C' }
        ],
        forwards: [
          { id: 8, name: 'Leao', team: 'Milan', position: 'A' },
          { id: 9, name: 'Osimhen', team: 'Napoli', position: 'A' }
        ]
      });
    } catch (error) {
      console.error('Errore caricamento formazione:', error);
      toast.error('❌ Errore caricamento formazione');
    } finally {
      setLoading(false);
    }
  };

  const loadAvailablePlayers = async () => {
    try {
      // TODO: Implementare API per caricare i giocatori disponibili
      setAvailablePlayers([
        { id: 1, name: 'Donnarumma', team: 'PSG', position: 'P' },
        { id: 2, name: 'Bastoni', team: 'Inter', position: 'D' },
        { id: 3, name: 'Skriniar', team: 'Inter', position: 'D' },
        { id: 4, name: 'Dimarco', team: 'Inter', position: 'D' },
        { id: 5, name: 'Barella', team: 'Inter', position: 'C' },
        { id: 6, name: 'Locatelli', team: 'Juventus', position: 'C' },
        { id: 7, name: 'Pogba', team: 'Juventus', position: 'C' },
        { id: 8, name: 'Leao', team: 'Milan', position: 'A' },
        { id: 9, name: 'Osimhen', team: 'Napoli', position: 'A' },
        { id: 10, name: 'Szczesny', team: 'Juventus', position: 'P' },
        { id: 11, name: 'De Ligt', team: 'Bayern', position: 'D' },
        { id: 12, name: 'Tonali', team: 'Newcastle', position: 'C' },
        { id: 13, name: 'Immobile', team: 'Lazio', position: 'A' }
      ]);
    } catch (error) {
      console.error('Errore caricamento giocatori:', error);
      toast.error('❌ Errore caricamento giocatori');
    }
  };

  const openPlayerSelect = (position, slot) => {
    setSelectedPosition(position);
    setSelectedSlot(slot);
    setShowPlayerSelect(true);
  };

  const selectPlayer = (player) => {
    const newFormation = { ...formation };
    
    if (selectedPosition === 'goalkeeper') {
      newFormation.goalkeeper = player;
    } else {
      newFormation[selectedPosition][selectedSlot] = player;
    }
    
    setFormation(newFormation);
    setShowPlayerSelect(false);
    toast.success(`✅ ${player.name} schierato come ${selectedPosition === 'goalkeeper' ? 'portiere' : selectedPosition}!`);
  };

  const removePlayer = (position, slot) => {
    const newFormation = { ...formation };
    
    if (position === 'goalkeeper') {
      newFormation.goalkeeper = null;
    } else {
      newFormation[position][slot] = null;
    }
    
    setFormation(newFormation);
    toast.success('✅ Giocatore rimosso dalla formazione!');
  };

  const saveFormation = async () => {
    try {
      // TODO: Implementare API per salvare la formazione
      toast.success('✅ Formazione salvata con successo!');
    } catch (error) {
      console.error('Errore salvataggio formazione:', error);
      toast.error('❌ Errore salvataggio formazione');
    }
  };

  const getFilteredPlayers = () => {
    return availablePlayers.filter(player => {
      if (selectedPosition === 'goalkeeper') {
        return player.position === 'P';
      } else if (selectedPosition === 'defenders') {
        return player.position === 'D';
      } else if (selectedPosition === 'midfielders') {
        return player.position === 'C';
      } else if (selectedPosition === 'forwards') {
        return player.position === 'A';
      }
      return false;
    });
  };

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-96">
        <LoadingSpinner size="lg" text="Caricamento formazione..." />
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto space-y-8">
      {/* Header */}
      <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
        <div>
          <h1 className="text-4xl font-bold text-gradient mb-2">
            ⚽ Gestione Formazione
          </h1>
          <p className="text-dark-400">
            Schiera i tuoi giocatori per la prossima partita
          </p>
        </div>
        
        <div className="flex gap-3">
          <Button
            onClick={() => navigate('/rosters')}
            icon="👥"
            variant="secondary"
          >
            Gestisci Roster
          </Button>
          
          <Button
            onClick={saveFormation}
            icon="💾"
            variant="success"
          >
            Salva Formazione
          </Button>
        </div>
      </div>

      {/* Campo di gioco */}
      <Card className="overflow-hidden" variant="stadium" animated>
        <Card.Header>
          <Card.Title className="text-gradient text-2xl">⚽ Campo di Gioco</Card.Title>
          <Card.Description className="text-lg">
            Clicca su una posizione per schierare un giocatore
          </Card.Description>
        </Card.Header>
        
        <Card.Content>
          <div className="relative bg-gradient-to-b from-green-600 to-green-500 rounded-xl p-8 min-h-96 field-pattern stadium-glow">
            {/* Portiere */}
            <div className="absolute bottom-4 left-1/2 transform -translate-x-1/2">
              <div
                onClick={() => openPlayerSelect('goalkeeper', 0)}
                className="w-20 h-20 bg-gradient-to-br from-dark-800 to-dark-900 border-2 border-dark-600 rounded-xl flex items-center justify-center cursor-pointer hover:border-primary-500 hover:scale-105 transition-all duration-200 shadow-lg hover:shadow-xl"
              >
                {formation.goalkeeper ? (
                  <div className="text-center">
                    <div className="text-xs font-bold text-dark-100">{formation.goalkeeper.name}</div>
                    <div className="text-xs text-dark-400">{formation.goalkeeper.team}</div>
                    <button
                      onClick={(e) => {
                        e.stopPropagation();
                        removePlayer('goalkeeper', 0);
                      }}
                      className="text-red-400 hover:text-red-300 text-xs mt-1"
                    >
                      ✕
                    </button>
                  </div>
                ) : (
                  <div className="text-dark-400 text-xs">P</div>
                )}
              </div>
            </div>

            {/* Difensori */}
            <div className="absolute bottom-16 left-1/2 transform -translate-x-1/2 flex gap-4">
              {formation.defenders.map((player, index) => (
                <div
                  key={index}
                  onClick={() => openPlayerSelect('defenders', index)}
                  className="w-16 h-16 bg-dark-800 border-2 border-dark-600 rounded-lg flex items-center justify-center cursor-pointer hover:border-primary-500 transition-colors duration-200"
                >
                  {player ? (
                    <div className="text-center">
                      <div className="text-xs font-bold text-dark-100">{player.name}</div>
                      <div className="text-xs text-dark-400">{player.team}</div>
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          removePlayer('defenders', index);
                        }}
                        className="text-red-400 hover:text-red-300 text-xs mt-1"
                      >
                        ✕
                      </button>
                    </div>
                  ) : (
                    <div className="text-dark-400 text-xs">D</div>
                  )}
                </div>
              ))}
            </div>

            {/* Centrocampisti */}
            <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex gap-4">
              {formation.midfielders.map((player, index) => (
                <div
                  key={index}
                  onClick={() => openPlayerSelect('midfielders', index)}
                  className="w-16 h-16 bg-dark-800 border-2 border-dark-600 rounded-lg flex items-center justify-center cursor-pointer hover:border-primary-500 transition-colors duration-200"
                >
                  {player ? (
                    <div className="text-center">
                      <div className="text-xs font-bold text-dark-100">{player.name}</div>
                      <div className="text-xs text-dark-400">{player.team}</div>
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          removePlayer('midfielders', index);
                        }}
                        className="text-red-400 hover:text-red-300 text-xs mt-1"
                      >
                        ✕
                      </button>
                    </div>
                  ) : (
                    <div className="text-dark-400 text-xs">C</div>
                  )}
                </div>
              ))}
            </div>

            {/* Attaccanti */}
            <div className="absolute top-16 left-1/2 transform -translate-x-1/2 flex gap-4">
              {formation.forwards.map((player, index) => (
                <div
                  key={index}
                  onClick={() => openPlayerSelect('forwards', index)}
                  className="w-16 h-16 bg-dark-800 border-2 border-dark-600 rounded-lg flex items-center justify-center cursor-pointer hover:border-primary-500 transition-colors duration-200"
                >
                  {player ? (
                    <div className="text-center">
                      <div className="text-xs font-bold text-dark-100">{player.name}</div>
                      <div className="text-xs text-dark-400">{player.team}</div>
                      <button
                        onClick={(e) => {
                          e.stopPropagation();
                          removePlayer('forwards', index);
                        }}
                        className="text-red-400 hover:text-red-300 text-xs mt-1"
                      >
                        ✕
                      </button>
                    </div>
                  ) : (
                    <div className="text-dark-400 text-xs">A</div>
                  )}
                </div>
              ))}
            </div>
          </div>
        </Card.Content>
      </Card>

      {/* Statistiche formazione */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <StatCard
          title="Attaccanti"
          value={formation.forwards.filter(p => p).length}
          icon="⚽"
          color="warning"
          animated
          delay={0}
        />
        
        <StatCard
          title="Difensori"
          value={formation.defenders.filter(p => p).length}
          icon="🛡️"
          color="info"
          animated
          delay={0.1}
        />
        
        <StatCard
          title="Centrocampisti"
          value={formation.midfielders.filter(p => p).length}
          icon="🎯"
          color="primary"
          animated
          delay={0.2}
        />
      </div>

      {/* Modal Selezione Giocatore */}
      <Modal
        isOpen={showPlayerSelect}
        onClose={() => setShowPlayerSelect(false)}
        title={`Seleziona ${selectedPosition === 'goalkeeper' ? 'Portiere' : selectedPosition === 'defenders' ? 'Difensore' : selectedPosition === 'midfielders' ? 'Centrocampista' : 'Attaccante'}`}
        size="md"
      >
        <div className="space-y-4">
          <div className="max-h-96 overflow-y-auto space-y-2">
            {getFilteredPlayers().map(player => (
              <div
                key={player.id}
                onClick={() => selectPlayer(player)}
                className="flex items-center justify-between p-3 bg-dark-700 rounded-lg border border-dark-600 hover:border-primary-500 transition-colors duration-200 cursor-pointer"
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
                
                <Button
                  size="sm"
                  variant="primary"
                  icon="✅"
                >
                  Seleziona
                </Button>
              </div>
            ))}
          </div>
          
          {getFilteredPlayers().length === 0 && (
            <div className="text-center py-8 text-dark-400">
              <div className="text-4xl mb-2">👥</div>
              <p>Nessun giocatore disponibile per questa posizione</p>
            </div>
          )}
        </div>
      </Modal>
    </div>
  );
}

export default Formations;
