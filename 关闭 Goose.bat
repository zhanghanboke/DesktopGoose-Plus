@echo off
chcp 936 >nul 2>nul
taskkill /f /im goosedesktop.exe >nul 2>nul
if errorlevel 1 (
  echo Goose is not running.
) else (
  echo Goose closed.
)
timeout /t 2 >nul
