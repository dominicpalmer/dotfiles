ln -sf $Dotfiles/common/wezterm $HOME/.config/wezterm
ln -sf $Dotfiles/common/nvim $HOME/.config/nvim
ln -sf $Dotfiles/unix/zsh/.zshrc $HOME/.zshrc
ln -sf $Dotfiles/unix/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $Dotfiles/unix/tmux/tmux_change_theme.sh $HOME/tmux_change_theme.sh

AUTOSTART=$HOME/.config/autostart-scripts
if [ ! -d "$AUTOSTART" ]; then
  mkdir -p $AUTOSTART
fi
ln -sf $Dotfiles/unix/keyboard/xmodmaps.sh $HOME/.config/autostart-scripts/xmodmaps.sh
