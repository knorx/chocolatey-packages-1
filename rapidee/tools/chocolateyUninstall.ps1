$ErrorActionPreference = 'Stop';

$startMenu = [Environment]::GetFolderPath("CommonPrograms")
$startMenuLink = Join-Path -Path $startMenu -ChildPath "Rapid Environment Editor.lnk"
Remove-Item "$startMenuLink"
