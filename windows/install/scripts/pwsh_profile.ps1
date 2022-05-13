# Links PowerShell profile
$PowerShellConfig = "C:\Program Files\Powershell\7\Microsoft.Powershell_profile.ps1"
if (Get-Item -Path $PowerShellConfig -ErrorAction Ignore) {
  Remove-Item $PowerShellConfig
}
New-Item -ItemType SymbolicLink -Path "$PowerShellConfig" -Target "$Dotfiles\windows\pwsh\Microsoft.Powershell_profile.ps1"
