import React, { useState } from 'react'
import PartitaLive from './LiveMatch.jsx'

const API = import.meta.env.VITE_API_BASE_URL || 'http://localhost:4000'
const WS = import.meta.env.VITE_WS_BASE_URL || 'ws://localhost:4000'

export default function App(){
  const [token, setToken] = useState(null)
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [view, setView] = useState('home')

  const register = async () => {
    await fetch(`${API}/auth/register`, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({email, password}) })
    alert('Registrato, ora login')
  }
  const login = async () => {
    const res = await fetch(`${API}/auth/login`, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({email, password}) })
    const js = await res.json()
    if (js.status==='ok') setToken(js.data.access_token)
  }
  const simulate = async () => {
    await fetch(`${API}/admin/simulate`, { method:'POST', headers:{'Content-Type':'application/json'}, body: JSON.stringify({giornata_id:1}) })
    alert('Giornata simulata. Vai sul live!')
  }

  if (view==='live') return <PartitaLive API={API} WS={WS} />

  return (
    <div style={{fontFamily:'Roboto, sans-serif', background:'#0F172A', color:'#fff', minHeight:'100vh', padding:'24px'}}>
      <h1 style={{color:'#16A34A'}}>Fantacalcio Sim (Pack Go-Live)</h1>
      {!token ? (
        <div style={{display:'flex', gap:8}}>
          <input placeholder="email" value={email} onChange={e=>setEmail(e.target.value)} />
          <input placeholder="password" type="password" value={password} onChange={e=>setPassword(e.target.value)} />
          <button onClick={register}>Registrati</button>
          <button onClick={login}>Login</button>
        </div>
      ): <div>Autenticato ✅</div>}
      <div style={{marginTop:16, display:'flex', gap:8}}>
        <button onClick={simulate}>Simula giornata 1</button>
        <button onClick={()=> setView('live')}>Apri Live (Campo 2D)</button>
      </div>
      <div style={{marginTop:24, background:'#111827', padding:12, borderRadius:8}}>
        <h2>Benvenuto</h2>
        <p>Simula la giornata e apri il live per vedere il campo 2D con giocatori e cronaca.</p>
      </div>
    </div>
  )
}
