@echo off
title GreenMind - Smart Waste AI
cd /d "%~dp0"

echo ========================================================
echo            GreenMind - Smart Waste AI
echo ========================================================
echo.
echo Starting local server on http://localhost:8080 ...
echo (Keep this command window open while using the app)
echo.

:: Wait 1.5 seconds so Python binds port 8080 before launching the browser
start "" cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:8080"

python -m http.server 8080
if %errorlevel% neq 0 (
    echo.
    echo Python server exited or failed. Trying Node.js serve...
    npx -y serve -p 8080 .
)

pause
