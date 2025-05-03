#!/usr/bin/env powershell


if ("$env:OS" -ne "Windows_NT") {
    Write-Output "running a powershell script on a non-NT system is impressive, but sadly this MSVC instance doesn't support that"
    exit 1
}
# Root of Visual Developer Studio Common files.
# local variable
Set-Variable -Name VSCommonDir -Value "${PSScriptRoot}\..\..\Common"

# Root of Visual Developer Studio installed files.
$env:MSDevDir = "${PSScriptRoot}\..\..\Common\MSDev98"

# Root of Visual C++ installed files.
$env:MSVCDir = "${PSScriptRoot}\..\"

Write-Output "Setting environment for using Microsoft Visual C++ tools."

$env:PATH = "$env:MSDevDir\BIN;$env:MSVCDir\BIN;$VSCommonDir\TOOLS\WinNT;$VSCommonDir\TOOLS;$env:Path"

$env:INCLUDE = "$env:MSVCDir\ATL\INCLUDE;$env:MSVCDir\INCLUDE;$env:MSVCDir\MFC\INCLUDE;$env:INCLUDE"
$env:LIB = "$env:MSVCDir\LIB;$env:MSVCDir\MFC\LIB;$env:lib"
