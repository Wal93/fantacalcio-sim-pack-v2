import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { Toaster } from 'react-hot-toast';
import App from './pages/App.jsx';
import LiveMatch from './pages/LiveMatch.jsx';
import Dashboard from './pages/Dashboard.jsx';
import Login from './pages/Login.jsx';
import Navbar from './components/Navbar.jsx';

function AppRouter() {
  return (
    <BrowserRouter>
      <div style={{ background: '#0F172A', minHeight: '100vh', color: '#fff' }}>
        <Toaster 
          position="top-right"
          toastOptions={{
            duration: 4000,
            style: {
              background: '#1E293B',
              color: '#fff',
              border: '1px solid #374151'
            }
          }}
        />
        
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/" element={<Navigate to="/dashboard" replace />} />
          <Route 
            path="/dashboard" 
            element={
              <>
                <Navbar />
                <Dashboard />
              </>
            } 
          />
          <Route 
            path="/live-match/:matchId" 
            element={
              <>
                <Navbar />
                <LiveMatch />
              </>
            } 
          />
          <Route 
            path="/live-match" 
            element={
              <>
                <Navbar />
                <LiveMatch />
              </>
            } 
          />
          <Route 
            path="/legacy" 
            element={<App />} 
          />
        </Routes>
      </div>
    </BrowserRouter>
  );
}

export default AppRouter;