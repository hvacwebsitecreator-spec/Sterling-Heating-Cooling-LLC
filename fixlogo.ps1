$path = "C:\Users\vedpa\OneDrive\Desktop\MONEY 2\index.html"
$text = Get-Content -Path $path -Raw

$header = @'
<a href="#home" style="display:flex;align-items:center">
<img class="logo" src="sterling-logo.png" alt="Sterling Heating and Cooling logo" />
<div class="brand"><b>STERLING</b><span><i class="r">HEATING</i> <i class="b">&amp; COOLING</i> SERVICES</span></div>
</a>
'@

$text = [regex]::Replace($text, '(?s)<a href="#home" style="display:flex;align-items:center">.*?</a>', $header, 1)
$text = [regex]::Replace($text, '<img[^>]*src="data:image/[^"]+"[^>]*>', '')
Set-Content -Path $path -Value $text -Encoding UTF8
Write-Output 'cleaned'
