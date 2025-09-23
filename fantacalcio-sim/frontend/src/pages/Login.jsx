import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import toast from 'react-hot-toast';

const API_BASE = import.meta.env.VITE_API_BASE_URL || 'http://localhost:4000';

// Simple auth store per ora
let authState = {
  user: null,
  token: localStorage.getItem('auth_token'),
  isAuthenticated: !!localStorage.getItem('auth_token')
};

export const useAuth = () => {
  const [state, setState] = useState(authState);
  const navigate = useNavigate();

  const login = async (email, password) => {
    try {
      const response = await fetch(`${API_BASE}/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password })
      });

      const data = await response.json();

      if (data.status === 'ok') {
        const token = data.data.access_token;
        
        // Decodifica JWT per info utente
        const payload = JSON.parse(atob(token.split('.')[1]));
        const user = {
          id: payload.sub,
          email: email,
          role: payload.role || 'user'
        };

        localStorage.setItem('auth_token', token);
        authState = { user, token, isAuthenticated: true };
        setState(authState);

        toast.success('🎉 Login effettuato con successo!');
        navigate('/dashboard');
        return { success: true };
      } else {
        toast.error(`❌ ${data.error}`);
        return { success: false, error: data.error };
      }
    } catch (error) {
      console.error('Errore login:', error);
      toast.error('❌ Errore di connessione');
      return { success: false, error: 'Errore di connessione' };
    }
  };

  const register = async (email, password) => {
    try {
      const response = await fetch(`${API_BASE}/auth/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password })
      });

      const data = await response.json();

      if (data.status === 'ok') {
        toast.success('✅ Registrazione completata! Ora puoi effettuare il login.');
        return { success: true };
      } else {
        toast.error(`❌ ${data.error}`);
        return { success: false, error: data.error };
      }
    } catch (error) {
      console.error('Errore registrazione:', error);
      toast.error('❌ Errore di connessione');
      return { success: false, error: 'Errore di connessione' };
    }
  };

  const logout = () => {
    localStorage.removeItem('auth_token');
    authState = { user: null, token: null, isAuthenticated: false };
    setState(authState);
    toast.success('👋 Logout effettuato');
    navigate('/login');
  };

  const getAuthHeaders = () => {
    return state.token ? { 'Authorization': `Bearer ${state.token}` } : {};
  };

  return {
    ...state,
    login,
    register,
    logout,
    getAuthHeaders
  };
};

function Login() {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isRegistering, setIsRegistering] = useState(false);
  const [loading, setLoading] = useState(false);
  const { login, register, isAuthenticated } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (isAuthenticated) {
      navigate('/dashboard');
    }
  }, [isAuthenticated, navigate]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!email || !password) {
      toast.error('❌ Email e password sono richiesti');
      return;
    }

    setLoading(true);
    
    if (isRegistering) {
      await register(email, password);
      setIsRegistering(false);
    } else {
      await login(email, password);
    }
    
    setLoading(false);
  };

  return (
    <div style={{
      display: 'flex',
      justifyContent: 'center',
      alignItems: 'center',
      minHeight: '100vh',
      background: 'linear-gradient(135deg, #0F172A 0%, #1E293B 100%)'
    }}>
      <div style={{
        background: '#1E293B',
        padding: '48px',
        borderRadius: '16px',
        border: '2px solid #16A34A',
        minWidth: '400px',
        boxShadow: '0 25px 50px -12px rgba(0, 0, 0, 0.25)'
      }}>
        <h1 style={{
          color: '#16A34A',
          textAlign: 'center',
          marginBottom: '32px',
          fontSize: '28px'
        }}>
          ⚽ Fantacalcio Enterprise
        </h1>
        
        <form onSubmit={handleSubmit}>
          <div style={{marginBottom: '24px'}}>
            <label style={{display: 'block', marginBottom: '8px', color: '#F3F4F6'}}>
              Email
            </label>
            <input
              type="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              style={{
                width: '100%',
                padding: '12px 16px',
                background: '#374151',
                border: '1px solid #6B7280',
                borderRadius: '8px',
                color: '#fff',
                fontSize: '16px'
              }}
              placeholder="mario.rossi@email.com"
            />
          </div>
          
          <div style={{marginBottom: '32px'}}>
            <label style={{display: 'block', marginBottom: '8px', color: '#F3F4F6'}}>
              Password
            </label>
            <input
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              style={{
                width: '100%',
                padding: '12px 16px',
                background: '#374151',
                border: '1px solid #6B7280',
                borderRadius: '8px',
                color: '#fff',
                fontSize: '16px'
              }}
              placeholder="••••••••"
            />
          </div>
          
          <button
            type="submit"
            disabled={loading}
            style={{
              width: '100%',
              padding: '16px',
              background: loading ? '#6B7280' : 'linear-gradient(135deg, #16A34A 0%, #22C55E 100%)',
              color: '#fff',
              border: 'none',
              borderRadius: '8px',
              fontSize: '16px',
              fontWeight: 'bold',
              cursor: loading ? 'not-allowed' : 'pointer',
              marginBottom: '16px'
            }}
          >
            {loading ? '⏳' : (isRegistering ? '✅ Registrati' : '🚀 Accedi')}
          </button>
        </form>
        
        <div style={{textAlign: 'center'}}>
          <button
            onClick={() => setIsRegistering(!isRegistering)}
            style={{
              background: 'transparent',
              border: 'none',
              color: '#16A34A',
              cursor: 'pointer',
              textDecoration: 'underline'
            }}
          >
            {isRegistering ? 'Hai già un account? Accedi' : 'Non hai un account? Registrati'}
          </button>
        </div>
      </div>
    </div>
  );
}

export default Login;