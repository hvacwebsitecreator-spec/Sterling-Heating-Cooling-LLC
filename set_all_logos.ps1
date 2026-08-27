$path = "C:\Users\vedpa\OneDrive\Desktop\MONEY 2\index.html"
$text = Get-Content -Raw -Path $path

# Replace the header logo block from the broken data URI to the approved PNG
$headerStart = $text.IndexOf('<img class="logo" src="data:image/')
if ($headerStart -ge 0) {
  $brandStart = $text.IndexOf('<div class="brand">', $headerStart)
  if ($brandStart -gt $headerStart) {
    $replace = '<img class="logo" src="sterling-logo.png" alt="Sterling Heating and Cooling logo" />'
    $text = $text.Substring(0, $headerStart) + $replace + $text.Substring($brandStart)
  }
}

# Replace every remaining embedded data:image tag with the same supplied logo
$pattern = 'data:image/'
$pos = 0
while ($true) {
  $start = $text.IndexOf('<img', $pos)
  if ($start -lt 0) { break }
  $src = $text.IndexOf('src="data:image/', $start)
  if ($src -lt 0) { break }
  $end = $text.IndexOf('"', $src + 11)
  if ($end -lt 0) { break }
  $imageTagStart = $text.IndexOf('<img', $start)
  $imgEnd = $text.IndexOf('>', $src)
  if ($imgEnd -lt 0) { break }
  $text = $text.Substring(0, $imageTagStart) + '<img src="sterling-logo.png" alt="Sterling Heating and Cooling logo" />' + $text.Substring($imgEnd + 1)
  $pos = $imageTagStart + 1
}

Set-Content -Path $path -Value $text -Encoding UTF8
Write-Output 'all logos set to sterling-logo.png'
