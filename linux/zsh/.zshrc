alias vim=nvim

export Dotfiles="$HOME/dotfiles"
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

# FZF
export FZF_BASE="$HOME/.fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--border --tabstop=4"

# nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# Theme (https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
ZSH_THEME="muse"

# Case sensitive completion
CASE_SENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up
DISABLE_MAGIC_FUNCTIONS="true"

# History time stamp format
HIST_STAMPS="dd/mm/yyyy"

# Standard plugins can be found in $ZSH/plugins/
plugins=(
  vi-mode
  z
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
  git
)

# Improve vi-mode responsiveness
KEYTIMEOUT=1

# vi-mode line cursor when in insert mode
VI_MODE_SET_CURSOR=true

# Get vi-mode working with smart history navigation
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down

# Turns off file underlines from zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
  export GIT_EDITOR="vim"
  VIM="vim"
else
  export EDITOR="nvim"
  export GIT_EDITOR="nvim"
  VIM="vim"
fi

source $ZSH/oh-my-zsh.sh
