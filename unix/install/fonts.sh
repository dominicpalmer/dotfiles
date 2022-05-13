FONTS=$HOME/.local/share/fonts
if [ ! -d "$FONTS" ]; then
  mkdir -p $FONTS
fi
cp $DOTFILES/common/fonts/*.* $FONTS
