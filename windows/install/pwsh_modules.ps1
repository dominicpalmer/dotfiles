# Installs PowerShell modules, including of oh-my-posh V2

# -Force to ensure latest version
Install-Module PSReadLine -Force
Install-Module posh-git -Force

# If a version of oh-my-posh is already installed, remove it
Push-Location "C:\Program Files\Powershell\7\Modules"
$OhMyPoshRoot = "oh-my-posh"
if (Get-Item -Path $OhMyPoshRoot -ErrorAction Ignore) {
  Remove-Item $OhMyPoshRoot -Recurse -Force
}

# By placing oh-my-posh V2 source in the Modules directory, it becomes usable
git clone https://github.com/JanDeDobbeleer/oh-my-posh2
Rename-Item "oh-my-posh2" "oh-my-posh"
Push-Location $PSScriptRoot
