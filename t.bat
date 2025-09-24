@echo off
REM Batch script per Windows per usare Task senza problemi di PATH

REM Aggiunge Task al PATH se non è già presente
echo %PATH% | findstr /i "Task.Task_Microsoft.Winget.Source_8wekyb3d8bbwe" >nul
if errorlevel 1 (
    set "PATH=%PATH%;%LOCALAPPDATA%\Microsoft\WinGet\Packages\Task.Task_Microsoft.Winget.Source_8wekyb3d8bbwe"
)

REM Esegue il comando task con tutti i parametri passati
task %*