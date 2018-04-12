$packageName = 'dart-sdk-dev'

$url = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.47.0/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.47.0/sdk/dartsdk-windows-x64-release.zip'

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
  checksum       = '9400d0f5db48316a3f6e87fb33c394a96c6a893e8189d838b2f74c4c1fe7e368'
  checksumType   = 'sha256'
  checksum64     = '3bee80b5aaca8a52de2a5dfb5144bc32be20e2b58c40ac524610b9bdf95b51f3'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
