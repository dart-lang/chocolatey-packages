$packageName = 'dart-sdk-dev'

$url = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.49.0/sdk/dartsdk-windows-ia32-release.zip'
$url64 = 'https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.49.0/sdk/dartsdk-windows-x64-release.zip'

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
  checksum       = '11883173b81cdc7998df217d986d5930f8e0188d765138424d4e6ebe2bb0135a'
  checksumType   = 'sha256'
  checksum64     = '80386de66d31f49bb223982d994ef29b4027bf20999c82922c9ecfefffadf94f'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
