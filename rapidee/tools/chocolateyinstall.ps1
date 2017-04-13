$ErrorActionPreference = 'Stop'

$packageName = $env:chocolateyPackageName
$installDir = Split-Path $script:MyInvocation.MyCommand.Path
$url = "https://www.rapidee.com/download/archive/932/RapidEE.zip"
$url64 = "https://www.rapidee.com/download/archive/932/RapidEEx64.zip"

$packageArgs = @{
  packageName     = $packageName
  unzipLocation   = $installDir
  url             = $url
  url64           = $url64
  checksum        = '2177a821de91a9f527127adecf224e89ffac1b08'
  checksumType    = 'sha1'
  checksum64      = '96ec7bfc45079708cd24ecce96af5cde8ac74e0e'
  checksumType64  = 'sha1'
}

Install-ChocolateyZipPackage @packageArgs

$executable = Join-Path -Path $installDir -ChildPath "rapidee.exe"

$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path -Path $startMenu -ChildPath "Rapid Environment Editor.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuLink" -TargetPath "$executable"

New-Item -Path ($executable + ".gui") -Type file -Force
