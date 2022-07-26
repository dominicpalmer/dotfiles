# Links alacritty.yml

$AlacrittyConfigRoot = "$HOME\AppData\Roaming\alacritty\"
if (Get-Item -Path $AlacrittyConfigRoot -ErrorAction Ignore) {
  Remove-Item $AlacrittyConfigRoot -Recurse
}

New-Item -ItemType Directory -Path $AlacrittyConfigRoot
New-Item -ItemType SymbolicLink -Path "$AlacrittyConfigRoot\alacritty.yml" -Target "$Dotfiles\windows\alacritty\alacritty.yml"
