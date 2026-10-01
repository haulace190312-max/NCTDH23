@echo off
title Khoi Dong Ung Dung Cong Viec Lam Sinh Vien (EduJob)
echo ========================================================
echo   Dang khoi dong Backend API (Port 5000) & Frontend (Port 3000)...
echo ========================================================

:: Tự động phát hiện đường dẫn Node.js nếu chưa có trong PATH
where node >nul 2>&1
if %errorlevel% neq 0 (
    if exist "C:\Users\Admin\nodejs" set "PATH=%PATH%;C:\Users\Admin\nodejs"
    if exist "%USERPROFILE%\nodejs" set "PATH=%PATH%;%USERPROFILE%\nodejs"
    if exist "%ProgramFiles%\nodejs" set "PATH=%PATH%;%ProgramFiles%\nodejs"
    if exist "%LocalAppData%\Programs\nodejs" set "PATH=%PATH%;%LocalAppData%\Programs\nodejs"
)

:: Tự động lấy địa chỉ IP Mạng nội bộ / Wi-Fi linh hoạt
for /f "tokens=*" %%i in ('powershell -Command "(Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike '169.254*' -and $_.IPAddress -notlike '127.0.0.1' } | Select-Object -First 1).IPAddress"') do set LOCAL_IP=%%i

echo.
echo Launching Backend Server...
start "Backend API (Port 5000)" cmd /k "cd backend && npm start"

echo.
echo Launching Frontend Vite App...
start "Frontend Vite (Port 3000)" cmd /k "cd frontend && npm run dev"

echo.
echo ========================================================
echo   UNG DUNG DANG CHAY DONG THOI TAI CAC DIEM:
echo.
echo   [1] Tren may nay (Local PC):
echo       - Frontend UI:     http://localhost:3000
echo       - Single-Port UI:  http://localhost:5000
echo.
echo   [2] Tren dien thoai / may khac (Cung Wi-Fi / LAN):
echo       - Frontend UI:     http://%LOCAL_IP%:3000
echo       - Single-Port UI:  http://%LOCAL_IP%:5000
echo.
echo   - API Health Check:    http://%LOCAL_IP%:5000/api/health
echo ========================================================
pause
