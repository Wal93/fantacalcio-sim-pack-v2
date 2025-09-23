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

function Profile() {
  const navigate = useNavigate();
  const { isAuthenticated, user, getAuthHeaders } = useAuth();
  const [profile, setProfile] = useState(null);
  const [stats, setStats] = useState(null);
  const [loading, setLoading] = useState(true);
  const [showEditModal, setShowEditModal] = useState(false);
  const [showPasswordModal, setShowPasswordModal] = useState(false);
  const [editForm, setEditForm] = useState({
    email: '',
    nome: '',
    cognome: '',
    telefono: ''
  });
  const [passwordForm, setPasswordForm] = useState({
    currentPassword: '',
    newPassword: '',
    confirmPassword: ''
  });

  useEffect(() => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }
    
    loadProfile();
    loadStats();
  }, [isAuthenticated, navigate]);

  const loadProfile = async () => {
    try {
      setLoading(true);
      // TODO: Implementare API per caricare il profilo utente
      // Per ora simuliamo con dati mock
      setProfile({
        id: user.id,
        email: user.email,
        nome: 'Mario',
        cognome: 'Rossi',
        telefono: '+39 123 456 7890',
        data_registrazione: '2024-01-15',
        ruolo: 'user',
        avatar_url: null
      });
    } catch (error) {
      console.error('Errore caricamento profilo:', error);
      toast.error('❌ Errore caricamento profilo');
    } finally {
      setLoading(false);
    }
  };

  const loadStats = async () => {
    try {
      // TODO: Implementare API per caricare le statistiche utente
      setStats({
        partite_giocate: 15,
        partite_vinte: 8,
        partite_pareggiate: 4,
        partite_perse: 3,
        punti_totali: 156,
        gol_fatti: 23,
        gol_subiti: 18,
        media_punti: 10.4,
        posizione_classifica: 3,
        leghe_partecipate: 2,
        giocatori_acquistati: 45,
        giocatori_venduti: 12
      });
    } catch (error) {
      console.error('Errore caricamento statistiche:', error);
      toast.error('❌ Errore caricamento statistiche');
    }
  };

  const updateProfile = async () => {
    try {
      // TODO: Implementare API per aggiornare il profilo
      toast.success('✅ Profilo aggiornato con successo!');
      setShowEditModal(false);
      loadProfile();
    } catch (error) {
      console.error('Errore aggiornamento profilo:', error);
      toast.error('❌ Errore aggiornamento profilo');
    }
  };

  const changePassword = async () => {
    if (passwordForm.newPassword !== passwordForm.confirmPassword) {
      toast.error('❌ Le password non coincidono');
      return;
    }

    try {
      // TODO: Implementare API per cambiare password
      toast.success('✅ Password cambiata con successo!');
      setShowPasswordModal(false);
      setPasswordForm({ currentPassword: '', newPassword: '', confirmPassword: '' });
    } catch (error) {
      console.error('Errore cambio password:', error);
      toast.error('❌ Errore cambio password');
    }
  };

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-96">
        <LoadingSpinner size="lg" text="Caricamento profilo..." />
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto space-y-8">
      {/* Header */}
      <div className="flex flex-col lg:flex-row lg:items-center lg:justify-between gap-4">
        <div>
          <h1 className="text-4xl font-bold text-gradient mb-2">
            👤 Profilo Utente
          </h1>
          <p className="text-dark-400">
            Gestisci le tue informazioni personali e visualizza le statistiche
          </p>
        </div>
        
        <div className="flex gap-3">
          <Button
            onClick={() => setShowEditModal(true)}
            icon="✏️"
            variant="secondary"
          >
            Modifica Profilo
          </Button>
          
          <Button
            onClick={() => setShowPasswordModal(true)}
            icon="🔒"
            variant="outline"
          >
            Cambia Password
          </Button>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        {/* Informazioni Personali */}
        <div className="lg:col-span-1">
          <Card>
            <Card.Header>
              <Card.Title className="text-primary-400">
                📋 Informazioni Personali
              </Card.Title>
            </Card.Header>
            
            <Card.Content>
              <div className="space-y-4">
                <div className="flex items-center gap-4">
                  <div className="w-16 h-16 bg-primary-600 rounded-full flex items-center justify-center text-white text-xl font-bold">
                    {profile?.nome?.charAt(0) || 'U'}
                  </div>
                  <div>
                    <h3 className="font-bold text-dark-100 text-lg">
                      {profile?.nome} {profile?.cognome}
                    </h3>
                    <p className="text-dark-400">{profile?.email}</p>
                  </div>
                </div>
                
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span className="text-dark-400">Email:</span>
                    <span className="text-dark-100">{profile?.email}</span>
                  </div>
                  
                  <div className="flex justify-between">
                    <span className="text-dark-400">Telefono:</span>
                    <span className="text-dark-100">{profile?.telefono || 'Non specificato'}</span>
                  </div>
                  
                  <div className="flex justify-between">
                    <span className="text-dark-400">Registrato:</span>
                    <span className="text-dark-100">
                      {profile?.data_registrazione ? new Date(profile.data_registrazione).toLocaleDateString() : 'N/A'}
                    </span>
                  </div>
                  
                  <div className="flex justify-between">
                    <span className="text-dark-400">Ruolo:</span>
                    <span className="text-primary-400 capitalize">{profile?.ruolo}</span>
                  </div>
                </div>
              </div>
            </Card.Content>
          </Card>
        </div>

        {/* Statistiche */}
        <div className="lg:col-span-2">
          <Card>
            <Card.Header>
              <Card.Title className="text-primary-400">
                📊 Statistiche Giocatore
              </Card.Title>
              <Card.Description>
                Le tue performance nel fantacalcio
              </Card.Description>
            </Card.Header>
            
            <Card.Content>
              <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                <div className="text-center">
                  <div className="text-3xl mb-2">⚽</div>
                  <div className="text-2xl font-bold text-primary-400">{stats?.partite_giocate || 0}</div>
                  <div className="text-dark-400">Partite Giocate</div>
                </div>
                
                <div className="text-center">
                  <div className="text-3xl mb-2">🏆</div>
                  <div className="text-2xl font-bold text-green-400">{stats?.partite_vinte || 0}</div>
                  <div className="text-dark-400">Vittorie</div>
                </div>
                
                <div className="text-center">
                  <div className="text-3xl mb-2">📊</div>
                  <div className="text-2xl font-bold text-yellow-400">{stats?.punti_totali || 0}</div>
                  <div className="text-dark-400">Punti Totali</div>
                </div>
                
                <div className="text-center">
                  <div className="text-3xl mb-2">🎯</div>
                  <div className="text-2xl font-bold text-blue-400">{stats?.media_punti || 0}</div>
                  <div className="text-dark-400">Media Punti</div>
                </div>
              </div>
              
              <div className="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-4">
                  <h4 className="font-bold text-dark-100">Statistiche Attacco</h4>
                  <div className="space-y-2">
                    <div className="flex justify-between">
                      <span className="text-dark-400">Gol Fatti:</span>
                      <span className="text-green-400 font-bold">{stats?.gol_fatti || 0}</span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-dark-400">Giocatori Acquistati:</span>
                      <span className="text-blue-400 font-bold">{stats?.giocatori_acquistati || 0}</span>
                    </div>
                  </div>
                </div>
                
                <div className="space-y-4">
                  <h4 className="font-bold text-dark-100">Statistiche Difesa</h4>
                  <div className="space-y-2">
                    <div className="flex justify-between">
                      <span className="text-dark-400">Gol Subiti:</span>
                      <span className="text-red-400 font-bold">{stats?.gol_subiti || 0}</span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-dark-400">Giocatori Venduti:</span>
                      <span className="text-yellow-400 font-bold">{stats?.giocatori_venduti || 0}</span>
                    </div>
                  </div>
                </div>
              </div>
            </Card.Content>
          </Card>
        </div>
      </div>

      {/* Leghe Partecipate */}
      <Card>
        <Card.Header>
          <Card.Title className="text-primary-400">
            🏆 Leghe Partecipate
          </Card.Title>
          <Card.Description>
            Le leghe a cui partecipi attualmente
          </Card.Description>
        </Card.Header>
        
        <Card.Content>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {/* Mock data per le leghe */}
            <div className="p-4 bg-dark-700 rounded-lg border border-dark-600">
              <h4 className="font-bold text-dark-100 mb-2">Lega Serie A 2024</h4>
              <div className="text-sm text-dark-400 mb-2">Posizione: 3°</div>
              <div className="text-sm text-dark-400 mb-2">Punti: 45</div>
              <div className="text-xs text-green-400">Attiva</div>
            </div>
            
            <div className="p-4 bg-dark-700 rounded-lg border border-dark-600">
              <h4 className="font-bold text-dark-100 mb-2">Champions League Fantasy</h4>
              <div className="text-sm text-dark-400 mb-2">Posizione: 7°</div>
              <div className="text-sm text-dark-400 mb-2">Punti: 38</div>
              <div className="text-xs text-green-400">Attiva</div>
            </div>
          </div>
        </Card.Content>
      </Card>

      {/* Modal Modifica Profilo */}
      <Modal
        isOpen={showEditModal}
        onClose={() => setShowEditModal(false)}
        title="✏️ Modifica Profilo"
        size="md"
      >
        <div className="space-y-6">
          <Input
            label="Nome"
            value={editForm.nome}
            onChange={(e) => setEditForm({...editForm, nome: e.target.value})}
            placeholder="Inserisci il tuo nome..."
          />
          
          <Input
            label="Cognome"
            value={editForm.cognome}
            onChange={(e) => setEditForm({...editForm, cognome: e.target.value})}
            placeholder="Inserisci il tuo cognome..."
          />
          
          <Input
            label="Email"
            type="email"
            value={editForm.email}
            onChange={(e) => setEditForm({...editForm, email: e.target.value})}
            placeholder="Inserisci la tua email..."
          />
          
          <Input
            label="Telefono"
            value={editForm.telefono}
            onChange={(e) => setEditForm({...editForm, telefono: e.target.value})}
            placeholder="Inserisci il tuo telefono..."
          />
          
          <div className="flex justify-end gap-3">
            <Button
              onClick={() => setShowEditModal(false)}
              variant="secondary"
            >
              Annulla
            </Button>
            <Button
              onClick={updateProfile}
              variant="success"
              icon="✅"
            >
              Salva Modifiche
            </Button>
          </div>
        </div>
      </Modal>

      {/* Modal Cambia Password */}
      <Modal
        isOpen={showPasswordModal}
        onClose={() => setShowPasswordModal(false)}
        title="🔒 Cambia Password"
        size="md"
      >
        <div className="space-y-6">
          <Input
            label="Password Attuale"
            type="password"
            value={passwordForm.currentPassword}
            onChange={(e) => setPasswordForm({...passwordForm, currentPassword: e.target.value})}
            placeholder="Inserisci la password attuale..."
            icon="🔒"
          />
          
          <Input
            label="Nuova Password"
            type="password"
            value={passwordForm.newPassword}
            onChange={(e) => setPasswordForm({...passwordForm, newPassword: e.target.value})}
            placeholder="Inserisci la nuova password..."
            icon="🔑"
          />
          
          <Input
            label="Conferma Password"
            type="password"
            value={passwordForm.confirmPassword}
            onChange={(e) => setPasswordForm({...passwordForm, confirmPassword: e.target.value})}
            placeholder="Conferma la nuova password..."
            icon="🔑"
          />
          
          <div className="flex justify-end gap-3">
            <Button
              onClick={() => setShowPasswordModal(false)}
              variant="secondary"
            >
              Annulla
            </Button>
            <Button
              onClick={changePassword}
              variant="success"
              icon="🔒"
            >
              Cambia Password
            </Button>
          </div>
        </div>
      </Modal>
    </div>
  );
}

export default Profile;
