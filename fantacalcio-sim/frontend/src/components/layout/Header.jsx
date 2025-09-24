import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../../pages/Login.jsx';

const Header = ({ onMenuClick }) => {
  const navigate = useNavigate();
  const { user } = useAuth();
  const [showUserMenu, setShowUserMenu] = useState(false);
  
  return (
    <header className="bg-gradient-to-r from-dark-800 to-dark-700 border-b border-dark-600 px-4 py-4 lg:px-6 backdrop-blur-sm">
      <div className="flex items-center justify-between">
        {/* Left side */}
        <div className="flex items-center space-x-4">
          <button
            onClick={onMenuClick}
            className="lg:hidden p-2 text-dark-400 hover:text-dark-200 hover:bg-dark-700 rounded-xl transition-all duration-200 hover:scale-105"
          >
            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
          
          <div className="hidden lg:block">
            <h1 className="text-2xl font-bold text-gradient hover-glow">
              ⚽ Fantacalcio Enterprise
            </h1>
          </div>
          <div className="lg:hidden">
            <h1 className="text-lg font-bold text-gradient">
              ⚽ Fantacalcio
            </h1>
          </div>
        </div>
        
        {/* Right side */}
        <div className="flex items-center space-x-4">
          {/* Notifications */}
          <button className="p-2 text-dark-400 hover:text-dark-200 hover:bg-dark-700 rounded-xl relative transition-all duration-200 hover:scale-105">
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 17h5l-5 5v-5zM9 12l2 2 4-4M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            <span className="absolute -top-1 -right-1 w-3 h-3 bg-red-500 rounded-full animate-pulse"></span>
          </button>
          
          {/* User menu */}
          {user && (
            <div className="relative">
              <button
                onClick={() => setShowUserMenu(!showUserMenu)}
                className="flex items-center space-x-2 p-2 text-dark-300 hover:text-dark-100 hover:bg-dark-700 rounded-xl transition-all duration-200 hover:scale-105"
              >
                <div className="w-8 h-8 bg-gradient-to-r from-primary-600 to-primary-500 rounded-full flex items-center justify-center shadow-lg">
                  <span className="text-sm font-medium text-white">
                    {user.email.charAt(0).toUpperCase()}
                  </span>
                </div>
                <span className="hidden lg:block text-sm font-medium">{user.email}</span>
                <svg className="w-4 h-4 transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                </svg>
              </button>
              
              {showUserMenu && (
                <div className="absolute right-0 mt-2 w-48 bg-dark-800 border border-dark-700 rounded-lg shadow-xl z-50">
                  <div className="p-3 border-b border-dark-700">
                    <p className="text-sm text-dark-300">Connesso come</p>
                    <p className="font-medium text-dark-100">{user.email}</p>
                  </div>
                  
                  <div className="p-1">
                    <button
                      onClick={() => {
                        navigate('/profile');
                        setShowUserMenu(false);
                      }}
                      className="w-full flex items-center px-3 py-2 text-sm text-dark-300 hover:bg-dark-700 hover:text-dark-100 rounded-lg"
                    >
                      <span className="mr-2">👤</span>
                      Profilo
                    </button>
                    
                    <button
                      onClick={() => {
                        navigate('/settings');
                        setShowUserMenu(false);
                      }}
                      className="w-full flex items-center px-3 py-2 text-sm text-dark-300 hover:bg-dark-700 hover:text-dark-100 rounded-lg"
                    >
                      <span className="mr-2">⚙️</span>
                      Impostazioni
                    </button>
                  </div>
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </header>
  );
};

export default Header;
