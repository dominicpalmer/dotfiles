DOTFILES=$HOME/dotfiles

# Alacritty
ALACRITTY=$HOME/.config/alacritty/alacritty.yml
if [ -f "$ALACRITTY" ]; then
  rm $ALACRITTY
fi
ln -s $DOTFILES/alacritty/alacritty.yml $ALACRITTY

# Zsh
ZSH=$HOME/.zshrc
if [ -f "$ZSH" ]; then
  rm $ZSH
fi
ln -s $DOTFILES/zsh/.zshrc $ZSH

# Tmux
TMUX=$HOME/.tmux.conf
if [ -f "$TMUX" ]; then
  rm $TMUX
fi
ln -s $DOTFILES/tmux/.tmux.conf $TMUX

# Neovim: Lua based configuration
NVIM=$HOME/.config/nvim
if [ -d $NVIM ]; then
  rm -r $NVIM
fi
ln -s $DOTFILES/nvim $NVIM

# Neovim: Vimscript based configuration
NVIM_VIMSCRIPT=$HOME/.config/nvim_vimscript
if [ -d $NVIM_VIMSCRIPT ]; then
  rm -r $NVIM_VIMSCRIPT
fi
ln -s $DOTFILES/nvim_vimscript $NVIM_VIMSCRIPT

# xmodmaps
STARTUP=$HOME/.config/autostart/xmodmaps.sh
if [ -f "$STARTUP" ]; then
  rm $STARTUP
fi
ln -s $DOTFILES/keyboard/xmodmaps.sh $STARTUP

# Fonts
cp $DOTFILES/fonts/*.* $HOME/.local/share/fonts
