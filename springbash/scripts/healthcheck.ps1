# healthcheck.ps1
Write-Host "Vérification de l'état du service Spring Boot..."

try {
    $response = Invoke-RestMethod -Uri "http://localhost:8085/actuator/health" -UseBasicParsing
    Write-Host "Réponse Health :"
    $response | ConvertTo-Json
} catch {
    Write-Host "Le service n'est pas accessible : $_"
}