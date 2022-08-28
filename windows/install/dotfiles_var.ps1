# Creates an environment variable for the dotfiles directory

param(
  [Parameter(Mandatory=$true)]
  [String]$Dotfiles
)

setx dotfiles $Dotfiles
