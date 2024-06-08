# Update to point at Windows dotfiles path
Dotfiles=/mnt/c/<path_to_dotfiles>

ln -sf $Dotfiles/unix/zsh/.zshrc $HOME/.zshrc
ln -sf $Dotfiles/unix/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $Dotfiles/unix/tmux/tmux_change_theme.sh $HOME/tmux_change_theme.sh
ln -sf $Dotfiles/archive/nvim $HOME/.config/nvim
