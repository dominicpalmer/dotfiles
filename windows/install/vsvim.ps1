# Creates a .vimrc symbolic link for Visual Studio VSVim

$VSVimRC = "$HOME/.vimrc"
if (Get-Item -Path $VSVimRC -ErrorAction Ignore) {
  Remove-Item $VSVimRC
}

New-Item -ItemType SymbolicLink -Path $VSVimRC -Target "$Dotfiles\windows\vs\.vimrc"