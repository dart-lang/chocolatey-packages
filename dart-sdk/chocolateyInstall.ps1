$packageName = 'dart-sdk'

$url64 = 'https://storage.googleapis.com/dart-archive/channels/$channel$/release/$version$/sdk/dartsdk-windows-x64-release.zip'

$unzipLocation = Get-ToolsLocation
$installDir = Join-Path $unzipLocation "dart-sdk"

Install-ChocolateyPath "$installDir\bin"
Install-ChocolateyPath "${env:USERPROFILE}\AppData\Local\Pub\Cache\bin"
$env:Path = "$($env:Path);$installDir\bin;${env:USERPROFILE}\AppData\Local\Pub\Cache\bin"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}

$packageArgs = @{
  packageName    = $packageName
  url64bit       = $url64
  unzipLocation  = $unzipLocation
  checksum64     = '$checksum64$'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
