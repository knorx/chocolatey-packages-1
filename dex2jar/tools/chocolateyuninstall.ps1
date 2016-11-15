$ErrorActionPreference = 'Stop';

$chocoBin = Join-Path $env:ChocolateyInstall  'bin'

$shimFiles = Get-ChildItem $chocoBin -Include d2j*.exe -Recurse
foreach($sf in $shimFiles) {
  Uninstall-BinFile -Name $sf.Name
}
