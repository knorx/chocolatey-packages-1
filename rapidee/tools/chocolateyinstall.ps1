$packageName = "rapidee"
$installDir = Join-Path -Path $env:ChocolateyInstall -ChildPath "lib\$packagename\tools"
$url = "http://www.rapidee.com/download/RapidEE.zip"
$url64 = "http://www.rapidee.com/download/RapidEEx64.zip"
$executable = Join-Path -Path $installDir -ChildPath "rapidee.exe"

Install-ChocolateyZipPackage -packageName $packageName -url $url -url64bit $url64 -UnzipLocation $installDir 

$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path -Path $startMenu -ChildPath "Rapid Environment Editor.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuLink" -TargetPath "$executable"

New-Item -Path ($executable + ".gui") -Type file -Force -ErrorAction SilentlyContinue
