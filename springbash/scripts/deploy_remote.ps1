# deploy_remote.ps1
param(
    [string]$user = "user",
    [string]$server = "serveur",
    [string]$remotePath = "/opt/apps/"
)

Write-Host "Déploiement du JAR vers $user@$server:$remotePath ..."

$jar = Get-ChildItem "target/*.jar" | Select-Object -First 1
if (-not $jar) {
    Write-Host "Aucun fichier JAR trouvé dans target/. Compilez le projet d'abord."
    exit
}

scp $jar.FullName "$user@$server:$remotePath"

Write-Host "Déploiement terminé."