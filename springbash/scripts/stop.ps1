# stop.ps1
Write-Host "Arrêt de l'application Spring Boot..."

# Cherche les processus Java correspondant à Spring Boot
$processes = Get-Process java -ErrorAction SilentlyContinue

if ($processes) {
    $processes | ForEach-Object {
        Stop-Process -Id $_.Id -Force
        Write-Host "Processus Java avec PID $($_.Id) arrêté."
    }
} else {
    Write-Host "Aucun processus Java actif trouvé."
}