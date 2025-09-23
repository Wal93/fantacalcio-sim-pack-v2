import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from './Login.jsx';
import toast from 'react-hot-toast';

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
      <div style={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        minHeight: '60vh'
      }}>
        <div style={{fontSize: '48px'}}>⏳</div>
      </div>
    );
  }

  return (
    <div style={{
      padding: '32px',
      maxWidth: '1200px',
      margin: '0 auto'
    }}>
      <div style={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'center',
        marginBottom: '32px'
      }}>
        <h1 style={{
          color: '#16A34A',
          fontSize: '32px',
          margin: 0
        }}>
          🏠 Dashboard Enterprise
        </h1>
        
        <div style={{display: 'flex', gap: '12px'}}>
          <button
            onClick={() => setShowCreateLega(true)}
            style={{
              background: 'linear-gradient(135deg, #16A34A 0%, #22C55E 100%)',
              color: '#fff',
              border: 'none',
              padding: '12px 20px',
              borderRadius: '8px',
              cursor: 'pointer',
              fontWeight: 'bold'
            }}
          >
            ➕ Nuova Lega
          </button>
          
          <button
            onClick={simulateGiornata}
            style={{
              background: 'linear-gradient(135deg, #F59E0B 0%, #FBBF24 100%)',
              color: '#000',
              border: 'none',
              padding: '12px 20px',
              borderRadius: '8px',
              cursor: 'pointer',
              fontWeight: 'bold'
            }}
          >
            ⚽ Simula Giornata
          </button>
          
          <button
            onClick={startLiveMatch}
            style={{
              background: 'linear-gradient(135deg, #DC2626 0%, #EF4444 100%)',
              color: '#fff',
              border: 'none',
              padding: '12px 20px',
              borderRadius: '8px',
              cursor: 'pointer',
              fontWeight: 'bold'
            }}
          >
            🚀 Start Live Match
          </button>
        </div>
      </div>

      {/* Modal Crea Lega */}
      {showCreateLega && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          background: 'rgba(0,0,0,0.8)',
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          zIndex: 1000
        }}>
          <div style={{
            background: '#1E293B',
            padding: '32px',
            borderRadius: '12px',
            border: '2px solid #16A34A',
            minWidth: '400px'
          }}>
            <h3 style={{color: '#16A34A', marginBottom: '20px'}}>➕ Crea Nuova Lega</h3>
            
            <input
              type="text"
              value={newLegaName}
              onChange={(e) => setNewLegaName(e.target.value)}
              placeholder="Nome della lega..."
              style={{
                width: '100%',
                padding: '12px 16px',
                background: '#374151',
                border: '1px solid #6B7280',
                borderRadius: '8px',
                color: '#fff',
                fontSize: '16px',
                marginBottom: '20px'
              }}
            />
            
            <div style={{display: 'flex', gap: '12px', justifyContent: 'flex-end'}}>
              <button
                onClick={() => setShowCreateLega(false)}
                style={{
                  background: '#6B7280',
                  color: '#fff',
                  border: 'none',
                  padding: '10px 20px',
                  borderRadius: '8px',
                  cursor: 'pointer'
                }}
              >
                Annulla
              </button>
              <button
                onClick={createLega}
                style={{
                  background: 'linear-gradient(135deg, #16A34A 0%, #22C55E 100%)',
                  color: '#fff',
                  border: 'none',
                  padding: '10px 20px',
                  borderRadius: '8px',
                  cursor: 'pointer',
                  fontWeight: 'bold'
                }}
              >
                ✅ Crea
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Griglia Leghe */}
      <div style={{
        display: 'grid',
        gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))',
        gap: '24px'
      }}>
        {leghe.length === 0 ? (
          <div style={{
            gridColumn: '1 / -1',
            textAlign: 'center',
            padding: '64px',
            background: '#1E293B',
            borderRadius: '12px',
            border: '2px dashed #6B7280'
          }}>
            <div style={{fontSize: '48px', marginBottom: '16px'}}>🏆</div>
            <h3 style={{color: '#F59E0B', marginBottom: '8px'}}>Nessuna Lega Trovata</h3>
            <p style={{color: '#94A3B8'}}>
              Crea la tua prima lega per iniziare a giocare!
            </p>
          </div>
        ) : (
          leghe.map(lega => (
            <div
              key={lega.id}
              style={{
                background: 'linear-gradient(135deg, #1E293B 0%, #374151 100%)',
                padding: '24px',
                borderRadius: '12px',
                border: '2px solid #16A34A',
                cursor: 'pointer'
              }}
              onClick={() => navigate(`/live-match?lega=${lega.id}`)}
            >
              <h3 style={{color: '#16A34A', marginBottom: '12px'}}>
                🏆 {lega.nome}
              </h3>
              <div style={{fontSize: '14px', color: '#94A3B8', marginBottom: '16px'}}>
                ID: {lega.id} • Creata: {new Date(lega.created_at).toLocaleDateString()}
              </div>
              <div style={{
                display: 'flex',
                justifyContent: 'space-between',
                alignItems: 'center'
              }}>
                <div style={{fontSize: '12px', color: '#F59E0B'}}>
                  👥 Squadre: {lega.num_squadre || 0}
                </div>
                <div style={{
                  background: '#16A34A',
                  color: '#fff',
                  padding: '4px 8px',
                  borderRadius: '4px',
                  fontSize: '12px',
                  fontWeight: 'bold'
                }}>
                  ATTIVA
                </div>
              </div>
            </div>
          ))
        )}
      </div>

      {/* Quick Actions */}
      <div style={{
        marginTop: '48px',
        background: '#1E293B',
        padding: '24px',
        borderRadius: '12px',
        border: '1px solid #374151'
      }}>
        <h3 style={{color: '#16A34A', marginBottom: '16px'}}>⚡ Azioni Rapide</h3>
        
        <div style={{display: 'flex', gap: '16px', flexWrap: 'wrap'}}>
          <button
            onClick={() => navigate('/live-match')}
            style={{
              background: 'linear-gradient(135deg, #2563EB 0%, #3B82F6 100%)',
              color: '#fff',
              border: 'none',
              padding: '12px 20px',
              borderRadius: '8px',
              cursor: 'pointer',
              fontWeight: 'bold'
            }}
          >
            ⚽ Live Match Demo
          </button>
          
          <button
            onClick={() => navigate('/legacy')}
            style={{
              background: '#6B7280',
              color: '#fff',
              border: 'none',
              padding: '12px 20px',
              borderRadius: '8px',
              cursor: 'pointer'
            }}
          >
            🔄 Versione Legacy
          </button>
        </div>
      </div>
    </div>
  );
}

export default Dashboard;