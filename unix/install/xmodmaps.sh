AUTOSTART=$HOME/.config/autostart-scripts
if [ ! -d "$AUTOSTART" ]; then
  mkdir -p $AUTOSTART
fi
ln -sf $DOTFILES/unix/keyboard/xmodmaps.sh $HOME/.config/autostart-scripts/xmodmaps.sh
