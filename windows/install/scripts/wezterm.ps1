$WezTermConfig = "C:\Program Files\WezTerm\wezterm.lua"
if (Get-Item -Path $WezTermConfig -ErrorAction Ignore) {
  Remove-Item $WezTermConfig
}
New-Item -ItemType SymbolicLink -Path $WezTermConfig -Target "$Dotfiles\common\wezterm\wezterm.lua"

$WezTermDir = "C:\Program Files\WezTerm\lua"
if (Get-Item -Path $WezTermDir -ErrorAction Ignore) {
  Remove-Item $WezTermDir
}
New-Item -ItemType SymbolicLink -Path $WezTermDir -Target "$Dotfiles\common\wezterm\lua"

# Adds WezTerm binary directory to PATH
$BinaryPath = "C:\Program Files\WezTerm"
$Path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path).path
if (!($Path -clike $BinaryPath)) {
  $Path = "$Path;$BinaryPath"
  Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $Path
}
