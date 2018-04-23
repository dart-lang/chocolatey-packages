$packageName = 'dart-sdk'

$url = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.2/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.24.2/sdk/dartsdk-windows-x64-release.zip'

$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dart-sdk"

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
  checksum       = '26b73442d8a910431ac9efdc38421ab6e743a556d830536f86c0a77902f17e5d'
  checksumType   = 'sha256'
  checksum64     = '513ce6d59caeed8444ccacf6021fa5e60e2b6c7a37dae80a693f6d90f14b5caa'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
