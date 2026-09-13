/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          primary: "#0D9488",        // Emerald Medical Teal
          "primary-hover": "#0F766E",
          "primary-light": "#CCFBF1",
          "primary-dark": "#042F2E",
          secondary: "#F59E0B",      // Warm Honey Gold
          "secondary-hover": "#D97706",
          "secondary-light": "#FEF3C7",
        },
        kms: {
          green: "#10B981",          // Gizi Baik / Normal
          yellow: "#F59E0B",         // Berisiko / Underweight
          red: "#EF4444",            // Stunting / Gizi Buruk
          blue: "#3B82F6",           // Overweight Risk
        }
      },
      fontFamily: {
        sans: ["'Plus Jakarta Sans'", "sans-serif"],
      },
    },
  },
  plugins: [],
}
