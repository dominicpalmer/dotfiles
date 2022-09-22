# Adds application startup shortcuts to PATH

# If the bin directory already exists, remove it
$BinRoot = "$HOME\root\bin"
if (Get-Item -Path $BinRoot -ErrorAction Ignore) {
  Remove-Item $BinRoot -Recurse
}

# Recreate the bin directory
New-Item -ItemType Directory -Path $BinRoot

# Add bin directory to PATH
$PathRegistry = "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
$Path = (Get-ItemProperty -Path $PathRegistry -Name path).path

if (!($Path -split ";" -contains $BinRoot)) {
  $Path = "$Path;$BinRoot"
  Set-ItemProperty -Path $PathRegistry -Name path -Value $Path
}

# Symbolic link shortcuts from dotfiles
$Files = Get-ChildItem "$Dotfiles\windows\bin"
foreach ($File in $Files) {
  $FileName = $File.Name
  New-Item -ItemType SymbolicLink -Path "$BinRoot\$FileName" -Target $File
}

# Add installation scripts to PATH
$InstallScriptsRoot = "$Dotfiles\windows\install"
if (!($Path -split ";" -contains $InstallScriptsRoot)) {
  $Path = "$Path;$InstallScriptsRoot"
  Set-ItemProperty -Path $PathRegistry -Name path -Value $Path
}
