# Configuración
$hostToPing = "8.8.8.8"  # Cambia esto si quieres otro host
$logDir = "C:\PingLogs"
$logFile = Join-Path $logDir ("ping_" + (Get-Date -Format "yyyy-MM-dd") + ".log")

# Crear carpeta de logs si no existe
if (!(Test-Path -Path $logDir)) {
    New-Item -Path $logDir -ItemType Directory -Force
}

# Fecha y hora actual, todo en un string compacto
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Ejecutar el ping
if (Test-Connection -ComputerName $hostToPing -Count 1 -Quiet) {
    $result = "EXITOSO"
} else {
    $result = "FALLO"
}


"${timestamp} - Ping ${result}" |Out-File -FilePath $logFile -Append -Encoding utf8
