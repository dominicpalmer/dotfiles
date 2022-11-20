# Adds application startup shortcuts to PATH

# Remove bin directory if it exists, then create anew
$BinRoot = "C:\bin"
if (Get-Item -Path $BinRoot -ErrorAction Ignore) {
  Remove-Item $BinRoot -Recurse
}
New-Item -ItemType Directory -Path $BinRoot

# Add bin directory to PATH
$PathRegistry = "Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment"
$Path = (Get-ItemProperty -Path $PathRegistry -Name path).path
if (!($Path -split ";" -contains $BinRoot)) {
  $Path = "$Path;$BinRoot"
  Set-ItemProperty -Path $PathRegistry -Name path -Value $Path
}

# Symbolic link shortcuts from dotfiles
$Files = Get-ChildItem "$Dotfiles\windows\bin" -Exclude template | Get-ChildItem -Filter *.cmd -Recurse
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
