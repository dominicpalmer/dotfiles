# Creates a .vscodevimrc symbolic link for VSCodeVim

$VSCodeVimRC = "$HOME/.vscodevimrc"
if (Get-Item -Path $VSCodeVimRC -ErrorAction Ignore) {
  Remove-Item $VSCodeVimRC
}

New-Item -ItemType SymbolicLink -Path $VSCodeVimRC -Target "$Dotfiles\common\vscode\.vscodevimrc"
