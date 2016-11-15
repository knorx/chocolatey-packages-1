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
  checksum        = '32635e309b705f02a7117bc5105b148f4233a504'
  checksumType    = 'sha1' 
  checksum64      = '197f2c970aeeb983a68a7844832b2784a10d8e64'
  checksumType64  = 'sha1' 
}

Install-ChocolateyZipPackage @packageArgs

$executable = Join-Path -Path $installDir -ChildPath "rapidee.exe"

$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path -Path $startMenu -ChildPath "Rapid Environment Editor.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuLink" -TargetPath "$executable"

New-Item -Path ($executable + ".gui") -Type file -Force
