# GreenMind — Smart Waste AI & Circular Telemetry

GreenMind is an intelligent waste classification and circular resource recovery platform that operates directly in the browser using edge-accelerated client-side machine learning and official Google OAuth 2.0 authentication.

---

## Key Features

- **Google OAuth 2.0 Sign-In & Sign-Up**: Full integration with official Google Identity Services (GIS), enabling 1-click authentication and account creation without manual form filling.
- **Dedicated User Portals & Data Isolation**: Each authenticated user gets their own sandboxed workspace and telemetry store (`greenmind_portal_dataset_<email>`), preventing data bleed across accounts.
- **Edge Computer Vision**: In-browser neural inference powered by MobileNet v2 classifies urban waste materials in real time without transmitting user images or camera feeds to external servers.
- **Carbon Mitigation Engine**: Dynamic calculations of mitigated CO₂e and avoided landfill lifespans based on real material density metrics.
- **In-Browser SQL & Analytics Studio**: Telemetry query engine with preset SQL filters, dynamic multi-chart dashboard, and Python EDA export capability (`greenmind_eda.ipynb`).
- **Robust Session Lifecycle**: Session restore upon page reload, 7-day token persistence, and secure logout with Google OAuth token revocation (`google.accounts.id.revoke`).

---

## Google Cloud Console OAuth 2.0 Setup

To enable your own production Google OAuth 2.0 Client ID for GreenMind:

### 1. Create / Select a Project in Google Cloud Console
1. Navigate to the [Google Cloud Console](https://console.cloud.google.com/).
2. Click the project dropdown at the top and select **New Project** (e.g., name it `GreenMind`).

### 2. Configure OAuth Consent Screen
1. In the sidebar, go to **APIs & Services > OAuth consent screen**.
2. Select User Type:
   - **External** (for any Google account user) or **Internal** (for Google Workspace organizations).
3. Fill in the App Information:
   - **App name**: `GreenMind`
   - **User support email**: Your email address
   - **Developer contact information**: Your email address
4. On the **Scopes** step, click **Add or Remove Scopes** and select:
   - `.../auth/userinfo.email`
   - `.../auth/userinfo.profile`
   - `openid`
5. On the **Test users** step (if in "Testing" publishing status), add the Google email addresses of anyone testing the application.

### 3. Create OAuth 2.0 Web Client ID
1. Navigate to **APIs & Services > Credentials**.
2. Click **+ CREATE CREDENTIALS** > **OAuth client ID**.
3. Select Application type: **Web application**.
4. Set Name: `GreenMind Web Client`.
5. Under **Authorized JavaScript origins**, click **+ ADD URI** and add:
   - `http://localhost:8080`
   - `http://127.0.0.1:8080`
   - `https://mayuresh-001.github.io`
6. Click **CREATE**.
7. Copy your generated **Client ID** (formatted like `xxxxxxxxxxxx-xxxxxxxxxxxxxxxx.apps.googleusercontent.com`).
   > **Note on Security**: Client-side OAuth 2.0 uses only the public Client ID. **Never** include or expose a Client Secret in client-side frontend code.

### 4. Connect Client ID to GreenMind
You can configure your Client ID in two ways:
- **Interactive UI**: On the GreenMind login screen, click **⚙️ OAuth Config** at the bottom right of the card, paste your Client ID, and click **Save & Initialize**.
- **Code Default**: In `index.html`, set `DEFAULT_CLIENT_ID` inside `GOOGLE_AUTH_CONFIG`:
  ```javascript
  const GOOGLE_AUTH_CONFIG = {
    DEFAULT_CLIENT_ID: 'YOUR_CLIENT_ID.apps.googleusercontent.com',
    ...
  };
  ```

---

## Local Development & Quick Start

### 1. Launch Local Web Server
Run the local HTTP server in the project directory:
```bash
python -m http.server 8080
```
Or double-click `start_greenmind.bat` on Windows.

### 2. Access the Application
Open your browser to:
```text
http://localhost:8080/index.html
```

### 3. Authentication & Testing
- Click **Continue directly through Google** (or **Sign up directly through Google**) to authenticate with your Google account.
- If testing locally without an active Google Cloud project, click **⚙️ OAuth Config** > **⚡ One-Click Auth Test** to verify the full end-to-end portal onboarding flow.

---

## File Structure

```text
├── index.html            # Main single-page application (UI, GIS OAuth, ML inference, SQL studio)
├── README.md             # Project documentation and OAuth setup instructions
├── start_greenmind.bat   # Windows one-click local server launcher
├── greenmind_eda.ipynb   # Jupyter notebook for offline telemetry and carbon impact analysis
└── screenshots/          # Architecture and UI preview assets
```
