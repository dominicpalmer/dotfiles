$NeovimConfig = "$HOME\AppData\Local\nvim"
if (Get-Item -Path $NeovimConfig -ErrorAction Ignore) {
  Remove-Item $NeovimConfig
}
New-Item -ItemType SymbolicLink -Path $NeovimConfig -Target "$Dotfiles\common\nvim"
