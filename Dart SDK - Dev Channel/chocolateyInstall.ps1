$packageName = 'dart-sdk-dev'

$url = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.48.0/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.48.0/sdk/dartsdk-windows-x64-release.zip'

$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dart-sdk-dev"

Install-ChocolateyPath "$installDir\bin"
Install-ChocolateyPath "${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"
$env:Path = "$($env:Path);$installDir\bin;${env:USERPROFILE}\AppData\Roaming\Pub\Cache\bin"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}

$packageArgs = @{
  packageName    = $packageName
  url            = $url
  url64bit       = $url64
  unzipLocation  = $unzipLocation
  checksum       = 'd3837220dc6e2e0aa2858240e7435d204eb56dd9b4345000ab552faa8e2aeb48'
  checksumType   = 'sha256'
  checksum64     = 'b3d2e3f2622ec14264412fb8ad2d30ca80e83a57c7a79db5e99548e357354232'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
