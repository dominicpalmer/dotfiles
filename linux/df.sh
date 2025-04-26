ln -sf $dotfiles/common/wezterm $HOME/.config/wezterm
ln -sf $dotfiles/common/nvim $HOME/.config/nvim
ln -sf $dotfiles/linux/zsh/.zshrc $HOME/.zshrc
ln -sf $dotfiles/linux/tmux/.tmux.conf $HOME/.tmux.conf

AUTOSTART=$HOME/.config/autostart-scripts
if [ ! -d "$AUTOSTART" ]; then
  mkdir -p $AUTOSTART
fi
