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

# Neovim: Vimscript configuration
NVIM=$HOME/.config/nvim
if [ -d $NVIM ]; then
  rm -r $NVIM
fi
ln -s $DOTFILES/nvim $NVIM

# Neovim: Lua configuration as an alternative
NVIM_LUA=$HOME/.config/nvim_lua
if [ -d $NVIM_LUA ]; then
  rm -r $NVIM_LUA
fi
ln -s $DOTFILES/nvim_lua $NVIM_LUA

# xmodmaps
STARTUP=$HOME/.config/autostart-scripts/xmodmaps.sh
if [ -f "$STARTUP" ]; then
  rm $STARTUP
fi
ln -s $DOTFILES/keyboard/xmodmaps.sh $STARTUP

# Fonts
cp $DOTFILES/fonts/*.* $HOME/.local/share/fonts
