ln -sf $dotfiles/common/wezterm $HOME/.config/wezterm
ln -sf $dotfiles/common/nvim $HOME/.config/nvim
ln -sf $dotfiles/linux/zsh/.zshrc $HOME/.zshrc
ln -sf $dotfiles/linux/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $dotfiles/linux/tmux/tmux_change_theme.sh $HOME/tmux_change_theme.sh

AUTOSTART=$HOME/.config/autostart-scripts
if [ ! -d "$AUTOSTART" ]; then
  mkdir -p $AUTOSTART
fi
ln -sf $dotfiles/linux/keyboard/xmodmaps.sh $HOME/.config/autostart-scripts/xmodmaps.sh
