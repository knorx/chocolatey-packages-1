$ErrorActionPreference = 'Stop';

$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = 'https://github.com/pxb1988/dex2jar/releases/download/2.0/dex-tools-2.0.zip'
$fileLocation   = Join-Path $toolsDir "$packageName-$packageVersion"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  checksum      = '032456b9db9e6059376611553aecf31f'
  checksumType  = 'md5'
}

Install-ChocolateyZipPackage @packageArgs

$batchFiles = Get-ChildItem $fileLocation -Include *.bat -Recurse
foreach($bf in $batchFiles) {
  Install-BinFile -Name $bf.BaseName -Path $bf
}
