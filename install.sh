DOTFILES=$HOME/dotfiles

ln -sf $DOTFILES/alacritty $HOME/.config/alacritty
ln -sf $DOTFILES/nvim $HOME/.config/nvim
ln -sf $DOTFILES/nvim_lua $HOME/.config/nvim_lua
ln -sf $DOTFILES/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/tmux/.tmux.conf $HOME/.tmux.conf

AUTOSTART=$HOME/.config/autostart-scripts
if [ ! -d "$AUTOSTART" ]; then
  mkdir -p $AUTOSTART
fi
ln -sf $DOTFILES/keyboard/xmodmaps.sh $HOME/.config/autostart-scripts/xmodmaps.sh

FONTS=$HOME/.local/share/fonts
if [ ! -d "$FONTS" ]; then
  mkdir -p $FONTS
fi
cp $DOTFILES/fonts/*.* $FONTS
