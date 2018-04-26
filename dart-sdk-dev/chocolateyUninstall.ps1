$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dart-sdk-dev"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
