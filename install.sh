DOTFILES=$HOME/dotfiles

ALACRITTY=$HOME/.config/alacritty/alacritty.yml
if [ -f "$ALACRITTY" ]; then
  rm $ALACRITTY
fi
ln -s $DOTFILES/alacritty/alacritty.yml $ALACRITTY

ZSH=$HOME/.zshrc
if [ -f "$ZSH" ]; then
  rm $ZSH
fi
ln -s $DOTFILES/zsh/.zshrc $ZSH

TMUX=$HOME/.tmux.conf
if [ -f "$TMUX" ]; then
  rm $TMUX
fi
ln -s $DOTFILES/tmux/.tmux.conf $TMUX

NVIM=$HOME/.config/nvim/init.vim
if [ -f "$NVIM" ]; then
  rm $NVIM
fi
ln -s $DOTFILES/nvim/init.vim $NVIM

FIREFOX=$HOME/.mozilla/firefox/lihj9rkg.default-release/chrome/userChrome.css
if [ -f "$FIREFOX" ]; then
  rm $FIREFOX
fi
ln -s $DOTFILES/firefox/userChrome.css $FIREFOX

mv $DOTFILES/fonts/*.ttf $HOME/.local/share/fonts