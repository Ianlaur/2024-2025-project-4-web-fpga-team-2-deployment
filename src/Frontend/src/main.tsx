import React from 'react'
import { createRoot } from 'react-dom/client'
import App from './App'
import './index.css'

createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)

if ("serviceWorker" in navigator) {
  navigator.serviceWorker.register("/service-worker.ts").then(() => {
    console.log("Service Worker Registered");
  });
}