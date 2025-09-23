import React from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../pages/Login.jsx';

function Navbar() {
  const navigate = useNavigate();
  const location = useLocation();
  const { user, logout, isAuthenticated } = useAuth();

  if (!isAuthenticated) return null;

  const navItems = [
    { path: '/dashboard', label: '🏠 Dashboard', icon: '🏠' },
    { path: '/live-match', label: '⚽ Live Match', icon: '⚽' },
  ];

  return (
    <nav style={{
      background: 'linear-gradient(135deg, #1E293B 0%, #374151 100%)',
      padding: '16px 24px',
      borderBottom: '2px solid #16A34A',
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }}>
      <div style={{display: 'flex', alignItems: 'center', gap: '32px'}}>
        <div style={{
          fontSize: '24px',
          fontWeight: 'bold',
          color: '#16A34A'
        }}>
          ⚽ Fantacalcio Enterprise
        </div>
        
        <div style={{display: 'flex', gap: '16px'}}>
          {navItems.map(item => (
            <button
              key={item.path}
              onClick={() => navigate(item.path)}
              style={{
                background: location.pathname === item.path 
                  ? 'linear-gradient(135deg, #16A34A 0%, #22C55E 100%)' 
                  : 'transparent',
                color: '#fff',
                border: location.pathname === item.path ? 'none' : '1px solid #6B7280',
                padding: '8px 16px',
                borderRadius: '8px',
                cursor: 'pointer',
                fontSize: '14px',
                fontWeight: '500'
              }}
            >
              {item.label}
            </button>
          ))}
        </div>
      </div>
      
      <div style={{display: 'flex', alignItems: 'center', gap: '16px'}}>
        <div style={{
          background: '#374151',
          padding: '8px 12px',
          borderRadius: '8px',
          fontSize: '14px',
          color: '#F3F4F6'
        }}>
          👤 {user?.email || 'Utente'}
        </div>
        
        <button
          onClick={logout}
          style={{
            background: '#DC2626',
            color: '#fff',
            border: 'none',
            padding: '8px 16px',
            borderRadius: '8px',
            cursor: 'pointer',
            fontSize: '14px',
            fontWeight: '500'
          }}
        >
          🚪 Logout
        </button>
      </div>
    </nav>
  );
}

export default Navbar;