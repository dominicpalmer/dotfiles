# Install PowerShell modules
Install-Module PSReadLine -Force
Install-Module posh-git -Force

Push-Location "C:\Program Files\Powershell\7\Modules"
$OhMyPoshRoot = "oh-my-posh"
if (Get-Item -Path $OhMyPoshRoot -ErrorAction Ignore) {
  Remove-Item $OhMyPoshRoot -Recurse -Force
}

git clone https://github.com/JanDeDobbeleer/oh-my-posh2
Rename-Item "oh-my-posh2" "oh-my-posh"
Push-Location $PSScriptRoot
