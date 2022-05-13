sudo apt update
sudo apt install git zsh tree tmux vim curl build-essentials
sudo apt-get install ripgrep

# Neovim
curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o ~/nvim.appimage
~/nvim.appimage --appimage-extract

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# nvm (can use latest version instead of 0.39.1)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Node
source ~/.bashrc
nvm install node

# Create symbolic links in WSl that link up to dotfiles in Windows at /mnt/c
DOTFILES=/mnt/c/Users/Dom/root/cs/projects/dotfiles

ln -sf $DOTFILES/unix/nvim $HOME/.config/nvim
ln -sf $DOTFILES/unix/nvim_vimscript $HOME/.config/nvim_vimscript
ln -sf $DOTFILES/unix/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/unix/tmux/.tmux.conf $HOME/.tmux.conf
ln -sf $DOTFILES/unix/tmux/tmux_change_theme.sh $HOME/tmux_change_theme.sh
