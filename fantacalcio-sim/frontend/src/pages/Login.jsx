import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import toast from 'react-hot-toast';
import Card from '../components/ui/Card';
import Button from '../components/ui/Button';
import Input from '../components/ui/Input';
import LoadingSpinner from '../components/ui/LoadingSpinner';

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
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-dark-900 via-dark-800 to-dark-900 p-4">
      <div className="w-full max-w-md">
        <Card className="animate-fadeIn" padding="xl">
          <Card.Header className="text-center">
            <div className="text-6xl mb-4">⚽</div>
            <Card.Title className="text-3xl text-gradient">
              Fantacalcio Enterprise
            </Card.Title>
            <Card.Description className="mt-2">
              {isRegistering ? 'Crea il tuo account' : 'Accedi al tuo account'}
            </Card.Description>
          </Card.Header>
          
          <Card.Content>
            <form onSubmit={handleSubmit} className="space-y-6">
              <Input
                label="Email"
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="mario.rossi@email.com"
                icon="📧"
                required
              />
              
              <Input
                label="Password"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="••••••••"
                icon="🔒"
                required
              />
              
              <Button
                type="submit"
                disabled={loading}
                loading={loading}
                variant="primary"
                size="lg"
                className="w-full"
                icon={isRegistering ? "✅" : "🚀"}
              >
                {isRegistering ? 'Registrati' : 'Accedi'}
              </Button>
            </form>
            
            <div className="mt-6 text-center">
              <button
                onClick={() => setIsRegistering(!isRegistering)}
                className="text-primary-400 hover:text-primary-300 text-sm underline transition-colors duration-200"
              >
                {isRegistering ? 'Hai già un account? Accedi' : 'Non hai un account? Registrati'}
              </button>
            </div>
          </Card.Content>
        </Card>
        
        {/* Footer */}
        <div className="text-center mt-8 text-dark-400 text-sm">
          <p>© 2024 Fantacalcio Enterprise. Tutti i diritti riservati.</p>
        </div>
      </div>
    </div>
  );
}

export default Login;