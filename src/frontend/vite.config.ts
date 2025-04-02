// frontend/vite.config.ts
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";
import { VitePWA } from "vite-plugin-pwa";
import { resolve } from 'path';

export default defineConfig({
  root: './', // Explicitly set the root directory
  build: {
    outDir: 'dist', // Specify output directory
    emptyOutDir: true, // Clear the output directory before building
  },
  plugins: [
    react(),
    VitePWA({
      registerType: "autoUpdate",
      workbox: {
        globPatterns: ["**/*.{js,css,html,png,svg,ico,txt,json,ts}"],
      },
      manifest: {
        name: "PWA Education App",
        short_name: "PWA App",
        description: "An offline-ready PWA for teachers & students",
        theme_color: "#ffffff",
        icons: [
          {
            src: "/icon-192x192.png",
            sizes: "192x192",
            type: "image/png",
          },
          {
            src: "/icon-512x512.png",
            sizes: "512x512",
            type: "image/png",
          },
        ],
      },
      devOptions: {
        enabled: true, // Ensures PWA runs in development
        type: "module",
      },
    }),
  ],
});