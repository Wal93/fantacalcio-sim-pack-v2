# Docker Desktop Fix Script per Windows
# Risolve i problemi comuni di connettività

Write-Host "Docker Desktop Fix Script" -ForegroundColor Cyan
Write-Host "=========================" -ForegroundColor Cyan

# Controlla se Docker Desktop è in esecuzione
function Test-DockerDesktop {
    try {
        docker version | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

# Riavvia Docker Desktop
function Restart-DockerDesktop {
    Write-Host "Riavviando Docker Desktop..." -ForegroundColor Yellow
    
    # Ferma Docker Desktop
    Stop-Process -Name "Docker Desktop" -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 5
    
    # Riavvia i servizi Docker
    Restart-Service -Name "com.docker.service" -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 3
    
    # Avvia Docker Desktop
    Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    
    Write-Host "Aspettando che Docker Desktop si avvii..." -ForegroundColor Yellow
    
    # Attende fino a 60 secondi che Docker sia disponibile
    $timeout = 60
    $elapsed = 0
    
    while (-not (Test-DockerDesktop) -and $elapsed -lt $timeout) {
        Start-Sleep -Seconds 2
        $elapsed += 2
        Write-Host "." -NoNewline -ForegroundColor Yellow
    }
    
    Write-Host ""
    
    if (Test-DockerDesktop) {
        Write-Host "Docker Desktop e ora disponibile!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Docker Desktop non risponde ancora. Riprova manualmente." -ForegroundColor Red
        return $false
    }
}

# Reset completo della rete Docker
function Reset-DockerNetwork {
    Write-Host "Reset rete Docker..." -ForegroundColor Yellow
    
    try {
        # Ferma tutti i container
        $containers = docker ps -aq 2>$null
        if ($containers) {
            docker stop $containers 2>$null
            docker rm $containers 2>$null
        }
        
        # Rimuove tutte le reti custom
        docker network prune -f
        
        # Rimuove volumi orfani
        docker volume prune -f
        
        Write-Host "Reset rete completato!" -ForegroundColor Green
    }
    catch {
        Write-Host "Errore durante il reset della rete: $_" -ForegroundColor Red
    }
}

# Pulizia cache Docker
function Clear-DockerCache {
    Write-Host "Pulizia cache Docker..." -ForegroundColor Yellow
    
    try {
        # System prune
        docker system prune -a -f --volumes
        
        # Builder cache
        docker builder prune -a -f
        
        Write-Host "Cache pulita!" -ForegroundColor Green
    }
    catch {
        Write-Host "Errore durante la pulizia: $_" -ForegroundColor Red
    }
}

# Menu principale
function Show-Menu {
    Write-Host ""
    Write-Host "Seleziona un'opzione:" -ForegroundColor Cyan
    Write-Host "1. Controlla stato Docker" -ForegroundColor White
    Write-Host "2. Riavvia Docker Desktop" -ForegroundColor White
    Write-Host "3. Reset rete Docker" -ForegroundColor White
    Write-Host "4. Pulizia cache Docker" -ForegroundColor White
    Write-Host "5. Fix completo (tutto insieme)" -ForegroundColor White
    Write-Host "6. Esci" -ForegroundColor White
    Write-Host ""
}

# Fix completo
function Complete-Fix {
    Write-Host "Eseguendo fix completo..." -ForegroundColor Cyan
    
    if (-not (Test-DockerDesktop)) {
        Restart-DockerDesktop
    }
    
    if (Test-DockerDesktop) {
        Reset-DockerNetwork
        Clear-DockerCache
        Write-Host "Fix completo terminato! Ora prova 'task up'" -ForegroundColor Green
    }
}

# Se chiamato con parametro -auto, esegue il fix completo automaticamente
if ($args -contains "-auto") {
    Complete-Fix
    exit
}

# Loop principale
do {
    Show-Menu
    $choice = Read-Host "Scelta"
    
    switch ($choice) {
        "1" {
            if (Test-DockerDesktop) {
                Write-Host "Docker Desktop funziona correttamente!" -ForegroundColor Green
                docker version
            } else {
                Write-Host "Docker Desktop non è disponibile!" -ForegroundColor Red
            }
        }
        "2" {
            Restart-DockerDesktop
        }
        "3" {
            if (Test-DockerDesktop) {
                Reset-DockerNetwork
            } else {
                Write-Host "Docker non è disponibile!" -ForegroundColor Red
            }
        }
        "4" {
            if (Test-DockerDesktop) {
                Clear-DockerCache
            } else {
                Write-Host "Docker non è disponibile!" -ForegroundColor Red
            }
        }
        "5" {
            Complete-Fix
        }
        "6" {
            Write-Host "Arrivederci!" -ForegroundColor Cyan
            break
        }
        default {
            Write-Host "Scelta non valida!" -ForegroundColor Red
        }
    }
    
    if ($choice -ne "6") {
        Write-Host ""
        Read-Host "Premi INVIO per continuare"
        Clear-Host
        Write-Host "Docker Desktop Fix Script" -ForegroundColor Cyan
        Write-Host "=========================" -ForegroundColor Cyan
    }
} while ($choice -ne "6")