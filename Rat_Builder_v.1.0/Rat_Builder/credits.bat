@echo off
mode 80, 30
title Rat Builder credits - Fnoka
chcp 65001 >nul
cd files
:start
cls
echo.
echo.
echo.

:: Effet de défilement pour le texte
ping localhost -n 2 >nul
echo [34m                      █████▒ ███▄    █  ▒█████   ██ ▄█▀ ▄▄▄      [0m
ping localhost -n 1 >nul
echo [94m                    ▓██   ▒  ██ ▀█   █ ▒██▒  ██▒ ██▄█▒ ▒████▄    [0m
ping localhost -n 1 >nul
echo [36m                    ▒████ ░ ▓██  ▀█ ██▒▒██░  ██▒▓███▄░ ▒██  ▀█▄  [0m
ping localhost -n 1 >nul
echo [96m                    ░▓█▒  ░ ▓██▒  ▐▌██▒▒██   ██░▓██ █▄ ░██▄▄▄▄██ [0m
ping localhost -n 1 >nul
echo [96m                    ░▒█░    ▒██░   ▓██░░ ████▓▒░▒██▒ █▄ ▓█   ▓██▒[0m
ping localhost -n 1 >nul
echo [96m 		     ▒ ░    ░ ▒░   ▒ ▒ ░ ▒░▒░▒░ ▒ ▒▒ ▓▒ ▒▒   ▓▒█░[0m
ping localhost -n 1 >nul
echo [96m 		       ░      ░ ░░   ░ ▒░  ░ ▒ ▒░ ░ ░▒ ▒░  ▒   ▒▒ ░[0m
ping localhost -n 1 >nul
echo [96m 		      ░ ░       ░   ░ ░ ░ ░ ░ ▒  ░ ░░ ░   ░   ▒   [0m
ping localhost -n 1 >nul
echo [96m 		                       ░     ░ ░  ░  ░         ░  ░ [0m
ping localhost -n 1 >nul

echo.
echo [93mIf you download this anywhere but not from https://github.com/Fnoka it's probably infected[0m
echo [93mThanks to use my Rat Builder ![0m
echo [93mDev by Fnoka[0m
echo [93mVersion : Beta 1.0[0m
echo [93mRelease date : July 2025[0m
echo.

:: Menu de sélection
:input
ping localhost -n 1 >nul
echo         [90;1m╚═╦═════»[0m  [92m[Get back to main][0m   [95m[1][0m
echo|set /p=".          [90;1m╚══>[0m"
choice /c 1 >nul
if /I "%errorlevel%" EQU "1" (
  echo [92mLoading...[0m
  start main.bat
  exit
) else (
  echo [91mInvalid choice. Please try again.[0m
  goto input
)