# deploy.ps1
Write-Host "Compilation du projet Spring Boot..."
mvn clean package -DskipTests

Write-Host "Déploiement de la nouvelle version..."

if (!(Test-Path "logs")) {
    New-Item -ItemType Directory -Path "logs"
}

Start-Process "java" "-jar target\*.jar" `
    -RedirectStandardOutput "logs\deploy.log" `
    -RedirectStandardError "logs\deploy_err.log" `
    -NoNewWindow

Write-Host "Nouvelle version déployée. Vérifiez logs\deploy.log et logs\deploy_err.log."