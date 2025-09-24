# Script PowerShell per semplificare l'uso di Task
# Uso: .\run.ps1 <comando task>
# Esempi: .\run.ps1 up
#         .\run.ps1 restart-clean
#         .\run.ps1 status

param(
    [string]$Command = "help"
)

# Aggiunge Task al PATH se necessario
$taskPath = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Task.Task_Microsoft.Winget.Source_8wekyb3d8bbwe"
if ($env:PATH -notlike "*$taskPath*") {
    $env:PATH += ";$taskPath"
}

# Esegue il comando task
if ($args.Count -gt 0) {
    task $Command $args
} else {
    task $Command
}