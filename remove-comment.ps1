$files = Get-ChildItem . -Exclude remove-comment.ps1 -Recurse
foreach($f in $files) {
  gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f
}
