# run.ps1
Write-Host "Lancement de l'application Spring Boot..."

if (!(Test-Path "logs")) {
    New-Item -ItemType Directory -Path "logs"
}

Start-Process "mvn" "spring-boot:run" `
    -RedirectStandardOutput "logs\server.log" `
    -RedirectStandardError "logs\server_err.log" `
    -NoNewWindow

Write-Host "Application lancée. Vérifiez logs\server.log et logs\server_err.log."