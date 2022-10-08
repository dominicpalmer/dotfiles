# Creates a .ideavimrc symbolic link for JetBrains Rider IdeaVim

$IdeaVimRC = "$HOME/.ideavimrc"
if (Get-Item -Path $IdeaVimRC -ErrorAction Ignore) {
  Remove-Item $IdeaVimRC
}

New-Item -ItemType SymbolicLink -Path $IdeaVimRC -Target "$Dotfiles\windows\jetbrains\.ideavimrc"
