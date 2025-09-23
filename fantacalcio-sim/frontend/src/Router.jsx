import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { Toaster } from 'react-hot-toast';
import App from './pages/App.jsx';
import LiveMatch from './pages/LiveMatch.jsx';
import Dashboard from './pages/Dashboard.jsx';
import Login from './pages/Login.jsx';
import Rosters from './pages/Rosters.jsx';
import Formations from './pages/Formations.jsx';
import Leagues from './pages/Leagues.jsx';
import Profile from './pages/Profile.jsx';
import Layout from './components/layout/Layout.jsx';

function AppRouter() {
  return (
    <BrowserRouter>
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
            <Layout>
              <Dashboard />
            </Layout>
          } 
        />
        <Route 
          path="/rosters" 
          element={
            <Layout>
              <Rosters />
            </Layout>
          } 
        />
        <Route 
          path="/formations" 
          element={
            <Layout>
              <Formations />
            </Layout>
          } 
        />
        <Route 
          path="/leagues" 
          element={
            <Layout>
              <Leagues />
            </Layout>
          } 
        />
        <Route 
          path="/live-matches" 
          element={
            <Layout>
              <LiveMatch />
            </Layout>
          } 
        />
        <Route 
          path="/profile" 
          element={
            <Layout>
              <Profile />
            </Layout>
          } 
        />
        <Route 
          path="/live-match/:matchId" 
          element={
            <Layout>
              <LiveMatch />
            </Layout>
          } 
        />
        <Route 
          path="/live-match" 
          element={
            <Layout>
              <LiveMatch />
            </Layout>
          } 
        />
        <Route 
          path="/legacy" 
          element={<App />} 
        />
      </Routes>
    </BrowserRouter>
  );
}

export default AppRouter;