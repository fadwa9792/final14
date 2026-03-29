# archive_logs.ps1
Write-Host "Archivage des logs..."

$date = Get-Date -Format "yyyyMMdd"
$archiveName = "logs_$date.zip"

if (!(Test-Path "logs")) {
    Write-Host "Aucun dossier logs trouvé."
    exit
}

Compress-Archive -Path "logs/*" -DestinationPath $archiveName -Force

Write-Host "Logs archivés dans $archiveName"