# Ejercicio 1: Saludo personalizado
do {
    $nombre = (Read-Host "¿Cómo te llamas?").Trim()
    if ([string]::IsNullOrWhiteSpace($nombre)) {
        Write-Host "El nombre no puede estar vacío. Intentá de nuevo." -ForegroundColor Yellow
    }
} while ([string]::IsNullOrWhiteSpace($nombre))

Write-Host "¡Hola $nombre!" -ForegroundColor Green
