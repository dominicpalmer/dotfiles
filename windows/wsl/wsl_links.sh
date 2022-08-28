# Creates symbolic links in WSl that link up to dotfiles in Windows at /mnt/c

DOTFILES=/mnt/c/$1

ln -sf $DOTFILES/common/nvim $HOME/.config/nvim
ln -sf $DOTFILES/common/nvim_vimscript $HOME/.config/nvim_vimscript
ln -sf $DOTFILES/unix/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/unix/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/unix/tmux/tmux_change_theme.sh $HOME/tmux_change_theme.sh
