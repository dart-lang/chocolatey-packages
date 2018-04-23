$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dart-sdk"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
