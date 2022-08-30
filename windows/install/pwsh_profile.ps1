# Creates symbolic links for PowerShell profile scripts

$ProfilePath = "C:\Program Files\Powershell\7\Microsoft.Powershell_profile.ps1"
if (Get-Item -Path $ProfilePath -ErrorAction Ignore) {
  Remove-Item $ProfilePath
}

New-Item -ItemType SymbolicLink -Path "$ProfilePath" -Target "$Dotfiles\windows\pwsh\Microsoft.Powershell_profile.ps1"
