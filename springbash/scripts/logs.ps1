# logs.ps1
Write-Host "Affichage des 30 dernières lignes de logs :"

if (Test-Path "logs\server.log") {
    Get-Content "logs\server.log" -Tail 30
} else {
    Write-Host "Le fichier logs\server.log n'existe pas. Lancez d'abord run.ps1."
}

if (Test-Path "logs\server_err.log") {
    Write-Host "`nDernières erreurs (server_err.log) :"
    Get-Content "logs\server_err.log" -Tail 30
}