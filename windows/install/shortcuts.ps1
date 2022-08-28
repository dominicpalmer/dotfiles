# Adds application startup shortcuts to PATH

# If a C:\Bin directory already exists, remove it
$BinRoot = "C:\Bin"
if (Get-Item -Path $BinRoot -ErrorAction Ignore) {
  Remove-Item $BinRoot -Recurse
}

# Recreate C:\Bin
New-Item -ItemType Directory -Path $BinRoot

# Add C:\Bin to PATH
$Path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path).path
$Path = "$Path;C:\Bin"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $Path

# Symbolic link shortcuts from dotfiles into C:\Bin
$Files = Get-ChildItem "$Dotfiles\windows\bin"
foreach ($File in $Files) {
  $FileName = $File.BaseName + ".cmd"
  New-Item -ItemType SymbolicLink -Path "$BinRoot\$FileName" -Target $File
}

# Add installation scripts to PATH
$Path = "$Path;$Dotfiles\windows\install\scripts"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $Path
