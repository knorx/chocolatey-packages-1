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
  checksum        = 'bd80e2c4fd8dbfe9eed01b75ea3d307ca71020b6'
  checksumType    = 'sha1'
  checksum64      = '8d7e3196fca8ddc15a89b06dbbd6319b62294b77'
  checksumType64  = 'sha1'
}

Install-ChocolateyZipPackage @packageArgs

$executable = Join-Path -Path $installDir -ChildPath "rapidee.exe"

$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path -Path $startMenu -ChildPath "Rapid Environment Editor.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuLink" -TargetPath "$executable"

New-Item -Path ($executable + ".gui") -Type file -Force
