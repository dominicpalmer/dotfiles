# Creates symbolic links for PowerShell profile scripts

$Item = "C:\Program Files\Powershell\7\Microsoft.Powershell_profile.ps1"

# Delete any existing profile
if (Get-Item -Path $Item -ErrorAction Ignore) {
  Remove-Item $Item
}

# Momentarily re-copy and re-delete the profile, to prevent authorisation errors
$DotfilesItem = "$Dotfiles\windows\pwsh\$ItemName" + $Item.Split('\')[-1]
Copy-Item -Path $DotfilesItem -Destination $Item
Remove-Item $Item

# Then create the Symlink
New-Item -ItemType SymbolicLink -Path $Item -Target $DotfilesItem
