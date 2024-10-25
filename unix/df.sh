ln -sf $dotfiles/common/wezterm $HOME/.config/wezterm
ln -sf $dotfiles/common/nvim $HOME/.config/nvim
ln -sf $dotfiles/unix/zsh/.zshrc $HOME/.zshrc
ln -sf $dotfiles/unix/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $dotfiles/unix/tmux/tmux_change_theme.sh $HOME/tmux_change_theme.sh

AUTOSTART=$HOME/.config/autostart-scripts
if [ ! -d "$AUTOSTART" ]; then
  mkdir -p $AUTOSTART
fi
ln -sf $dotfiles/unix/keyboard/xmodmaps.sh $HOME/.config/autostart-scripts/xmodmaps.sh
