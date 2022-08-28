# Links Wezterm config

# If configuration already exists, remove it and recreate
$WeztermConfig = "C:\Program Files\WezTerm\wezterm.lua"
if (Get-Item -Path $WeztermConfig -ErrorAction Ignore) {
  Remove-Item $WeztermConfig
}

New-Item -ItemType SymbolicLink -Path $WeztermConfig -Target "$Dotfiles\common\wezterm\wezterm.lua"

$WezTermDir = "C:\Program Files\WezTerm\lua"
if (Get-Item -Path $WezTermDir -ErrorAction Ignore) {
  Remove-Item $WezTermDir
}

New-Item -ItemType SymbolicLink -Path $WezTermDir -Target "$Dotfiles\common\wezterm\lua"

# Add Wezterm binary directory to PATH
$BinaryPath = "C:\Program Files\WezTerm"
$Path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path).path
if (!($Path -clike $BinaryPath)) {
  $Path = "$Path;$BinaryPath"
  Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $Path
}
