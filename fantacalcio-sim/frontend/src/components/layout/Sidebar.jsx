import React from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../pages/Login.jsx';

const Sidebar = ({ isOpen, onClose }) => {
  const navigate = useNavigate();
  const location = useLocation();
  const { user, logout } = useAuth();
  
  const menuItems = [
    {
      id: 'dashboard',
      label: 'Dashboard',
      icon: '🏠',
      path: '/dashboard',
      description: 'Panoramica generale'
    },
    {
      id: 'rosters',
      label: 'Gestione Roster',
      icon: '👥',
      path: '/rosters',
      description: 'Gestisci la tua squadra'
    },
    {
      id: 'formations',
      label: 'Formazioni',
      icon: '⚽',
      path: '/formations',
      description: 'Schiera i tuoi giocatori'
    },
    {
      id: 'leagues',
      label: 'Leghe',
      icon: '🏆',
      path: '/leagues',
      description: 'Partecipa alle leghe'
    },
    {
      id: 'live-matches',
      label: 'Partite Live',
      icon: '📺',
      path: '/live-matches',
      description: 'Segui le partite in tempo reale'
    },
    {
      id: 'transfers',
      label: 'Trasferimenti',
      icon: '🔄',
      path: '/transfers',
      description: 'Acquista e vendi giocatori'
    },
    {
      id: 'statistics',
      label: 'Statistiche',
      icon: '📊',
      path: '/statistics',
      description: 'Analizza le performance'
    },
    {
      id: 'admin',
      label: 'Admin Panel',
      icon: '⚙️',
      path: '/admin',
      description: 'Gestione sistema'
    }
  ];
  
  const isActive = (path) => location.pathname === path || location.pathname.startsWith(path);
  
  return (
    <>
      {/* Overlay per mobile */}
      {isOpen && (
        <div 
          className="fixed inset-0 bg-black bg-opacity-50 z-40 lg:hidden"
          onClick={onClose}
        />
      )}
      
      {/* Sidebar */}
      <div className={`
        fixed top-0 left-0 h-full bg-dark-800 border-r border-dark-700 z-50
        transform transition-transform duration-300 ease-in-out
        ${isOpen ? 'translate-x-0' : '-translate-x-full'}
        lg:translate-x-0 lg:static lg:z-auto
        w-80 flex flex-col sidebar-mobile
      `}>
        {/* Header */}
        <div className="p-6 border-b border-dark-700">
          <div className="flex items-center justify-between">
            <h1 className="text-2xl font-bold text-gradient">
              ⚽ Fantacalcio
            </h1>
            <button
              onClick={onClose}
              className="lg:hidden p-2 text-dark-400 hover:text-dark-200 hover:bg-dark-700 rounded-lg"
            >
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
          
          {user && (
            <div className="mt-4 p-3 bg-dark-700 rounded-lg">
              <p className="text-sm text-dark-300">Benvenuto</p>
              <p className="font-medium text-dark-100">{user.email}</p>
            </div>
          )}
        </div>
        
        {/* Navigation */}
        <nav className="flex-1 p-4 space-y-2 overflow-y-auto">
          {menuItems.map((item) => (
            <button
              key={item.id}
              onClick={() => {
                navigate(item.path);
                onClose();
              }}
              className={`
                w-full flex items-center p-3 rounded-lg transition-all duration-200
                ${isActive(item.path) 
                  ? 'bg-primary-600 text-white shadow-lg' 
                  : 'text-dark-300 hover:bg-dark-700 hover:text-dark-100'
                }
              `}
            >
              <span className="text-xl mr-3">{item.icon}</span>
              <div className="text-left">
                <div className="font-medium">{item.label}</div>
                <div className="text-xs opacity-75">{item.description}</div>
              </div>
            </button>
          ))}
        </nav>
        
        {/* Footer */}
        <div className="p-4 border-t border-dark-700">
          <button
            onClick={logout}
            className="w-full flex items-center p-3 text-dark-300 hover:bg-dark-700 hover:text-red-400 rounded-lg transition-colors duration-200"
          >
            <span className="text-xl mr-3">🚪</span>
            <span className="font-medium">Logout</span>
          </button>
        </div>
      </div>
    </>
  );
};

export default Sidebar;
