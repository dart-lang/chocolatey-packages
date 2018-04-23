$unzipLocation = Get-BinRoot
$installDir = Join-Path $unzipLocation "dart-sdks"

if (test-path $installDir) {
	Remove-Item $installDir -Recurse -Force
}
