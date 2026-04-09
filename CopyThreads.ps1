#Simple script to copy the custom threads to the most recent Fusion 360 directory.

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$FileDir = Join-Path $ScriptDir 'PGConduitThreads.xml'

$FusionDir = Join-Path $env:LOCALAPPDATA 'Autodesk\webdeploy\production\'

#Find the most recent version of Fusion360
$LatestSubdir = Get-ChildItem -Path $FusionDir -Directory -ErrorAction Stop |
                Sort-Object LastWriteTime -Descending |
                Select-Object -First 1


$ThreadPath = Join-Path $LatestSubdir.FullName 'Fusion\Server\Fusion\Configuration\ThreadData'

Copy-Item -Path $FileDir -Destination $ThreadPath -Force