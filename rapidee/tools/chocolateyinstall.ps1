$ErrorActionPreference = 'Stop';

$packageName = $env:chocolateyPackageName
$installDir = Split-Path $script:MyInvocation.MyCommand.Path
$url = "http://www.rapidee.com/download/RapidEE.zip"
$url64 = "http://www.rapidee.com/download/RapidEEx64.zip"

$packageArgs = @{
  packageName     = $packageName
  unzipLocation   = $installDir
  url             = $url
  url64           = $url64
  checksum        = 'd7c8ca2c9e4623edb48f4c0828677cb8a4d586a7'
  checksumType    = 'sha1' 
  checksum64      = 'c48fd3dedf81b2091c7dcbcb9bbe23307bb05961'
  checksumType64  = 'sha1' 
}

Install-ChocolateyZipPackage @packageArgs

$executable = Join-Path -Path $installDir -ChildPath "rapidee.exe"

$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path -Path $startMenu -ChildPath "Rapid Environment Editor.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuLink" -TargetPath "$executable"

New-Item -Path ($executable + ".gui") -Type file -Force
