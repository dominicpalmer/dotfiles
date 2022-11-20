ln -sf $DOTFILES/common/wezterm $HOME/.config/wezterm
ln -sf $DOTFILES/common/nvim $HOME/.config/nvim
ln -sf $DOTFILES/unix/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/unix/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/unix/tmux/tmux_change_theme.sh $HOME/tmux_change_theme.sh

AUTOSTART=$HOME/.config/autostart-scripts
if [ ! -d "$AUTOSTART" ]; then
  mkdir -p $AUTOSTART
fi
ln -sf $DOTFILES/unix/keyboard/xmodmaps.sh $HOME/.config/autostart-scripts/xmodmaps.sh
