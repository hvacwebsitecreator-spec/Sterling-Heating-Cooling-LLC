$path = "C:\Users\vedpa\OneDrive\Desktop\MONEY 2\index.html"
$txt = Get-Content -Raw -Path $path
$pattern = '(?s)<a href="#home" style="display:flex;align-items:center">.*?</a>'
$replace = '<a href="#home" style="display:flex;align-items:center"><img class="logo" src="sterling-logo.png" alt="Sterling Heating and Cooling logo" /><div class="brand"><b>STERLING</b><span><i class="r">HEATING</i> <i class="b">&amp; COOLING</i> SERVICES</span></div></a>'
$txt = [regex]::Replace($txt, $pattern, $replace, 1)
$txt = [regex]::Replace($txt, '<img[^>]*src="data:image/[^"]+"[^>]*>', '')
Set-Content -Path $path -Value $txt -Encoding UTF8
Write-Output 'header restored'
