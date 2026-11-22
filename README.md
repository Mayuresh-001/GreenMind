# GreenMind — Smart Waste AI

GreenMind is an intelligent waste classification and circular resource recovery platform that operates directly in the browser using client-side machine learning.

---

## Highlights

- **Edge Computer Vision**: In-browser neural inference classifies waste materials in real time.
- **Ecological Impact Metrics**: Dynamic calculations of mitigated CO2e and estimated avoided landfill mass.
- **Telemetry & Attribute Sensing**: Real-time simulated sensor feed tracking mass, volume, moisture, recyclability index, contamination likelihood, and sorting confidence.
- **Personalized Accounts & Data Isolation**: User workspaces with dedicated telemetry records and historical data persistence.
- **Data Export & Exploration**: Telemetry filtering, CSV data export, and an included Jupyter notebook for offline data analysis.

---

## File Structure

- `index.html`: Main single-page application containing UI, inference logic, and analytics studio.
- `start_greenmind.bat`: One-click local server launcher for Windows.
- `greenmind_eda.ipynb`: Jupyter notebook providing telemetry analytics and exploratory data routines.
- `screenshots/`: Visual overview of the onboarding gateway and analytics dashboard.

---

## Getting Started

### Local Setup

1. Run the local server via Python:
   ```bash
   python -m http.server 8080
   ```
   Or double-click `start_greenmind.bat` on Windows.

2. Open your web browser to:
   ```text
   http://localhost:8080/index.html
   ```

3. Sign in using your preferred profile to access your personalized telemetry dashboard.
