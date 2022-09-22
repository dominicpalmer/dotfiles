# Links Wezterm config

$WeztermConfigItems = @(
  "C:\Program Files\WezTerm\wezterm.lua",
  "C:\Program Files\WezTerm\lua"
)

foreach ($Item in $WeztermConfigItems) {
  # Delete existing configuration if it exists
  if (Get-Item -Path $Item -ErrorAction Ignore) {
    Remove-Item $Item
  }

  # Momentarily re-copy and re-delete dotfiles configuration, to prevent authorisation errors
  $DotfilesItem = "$Dotfiles\common\wezterm\$ItemName" + $Item.Split('\')[-1]
  Copy-Item -Path $DotfilesItem -Destination $Item
  Remove-Item $Item

  # Then create the Symlink
  New-Item -ItemType SymbolicLink -Path $Item -Target $DotfilesItem
}

# Add Wezterm binary directory to PATH
$PathRegistry = "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
$Path = (Get-ItemProperty -Path $PathRegistry -Name path).path

$BinaryPath = "C:\Program Files\WezTerm"
if (!($Path -split ";" -contains $BinaryPath)) {
  $Path = "$Path;$BinaryPath"
  Set-ItemProperty -Path $PathRegistry -Name path -Value $Path
}
