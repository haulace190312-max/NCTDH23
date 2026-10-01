@echo off
title Cai dat Du an Cong Viec Lam Sinh Vien (EduJob)
echo ========================================================
echo   Dang cai dat thu vien phu thuoc cho Backend va Frontend...
echo ========================================================

:: Tự động phát hiện và thêm đường dẫn Node.js vào PATH nếu chưa có
where node >nul 2>&1
if %errorlevel% neq 0 (
    if exist "C:\Users\Admin\nodejs" set "PATH=%PATH%;C:\Users\Admin\nodejs"
    if exist "%USERPROFILE%\nodejs" set "PATH=%PATH%;%USERPROFILE%\nodejs"
    if exist "%ProgramFiles%\nodejs" set "PATH=%PATH%;%ProgramFiles%\nodejs"
    if exist "%LocalAppData%\Programs\nodejs" set "PATH=%PATH%;%LocalAppData%\Programs\nodejs"
)

echo.
echo [1/2] Cai dat thu vien Backend...
cd backend
call npm install
if %errorlevel% neq 0 (
    echo [LOI] Khong the cai dat package cho backend.
    pause
    exit /b %errorlevel%
)

echo.
echo [2/2] Cai dat thu vien Frontend...
cd ..\frontend
call npm install
call npm run build
if %errorlevel% neq 0 (
    echo [LOI] Khong the cai dat hoac build package cho frontend.
    pause
    exit /b %errorlevel%
)

cd ..
echo.
echo ========================================================
echo   CAI DAT HOAN TAT THANH CONG!
echo   Chay 'start.bat' de khoi dong ung dung.
echo ========================================================
pause
