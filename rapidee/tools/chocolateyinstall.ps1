$packageName = "rapidee"
$installDir = Join-Path -Path $env:ChocolateyInstall -ChildPath "lib\$packagename\tools"
$url = "http://www.rapidee.com/download/RapidEE.zip"
$url64 = "http://www.rapidee.com/download/RapidEEx64.zip"
$executable = Join-Path -Path $installDir -ChildPath "RapidEE.exe"

Install-ChocolateyZipPackage -packageName $packageName -url $url -url64bit $url64 -UnzipLocation $installDir 
New-Item -Path ($executable + ".gui") -Force -ErrorAction SilentlyContinue

$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path -Path $startMenu -childPath "Rapid Environment Editor.lnk"
try { Install-ChocolateyShortcut -shortcutFilePath  "$startMenuLink" -targetPath "$executable" } finally {} #don't die on shortcut creation

