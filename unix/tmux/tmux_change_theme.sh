#!/bin/bash

if [[ $(tmux show-environment | grep THEME) == 'THEME=dark' ]]; then
  tmux set -g status-right "#{?client_prefix, ⌨ , } #[fg=#000000] #(whoami)@#h:#S"
  tmux set -g message-style "bg=default fg=#000000"
  tmux setenv THEME light
else
  tmux set -g status-right "#{?client_prefix, ⌨ , } #[fg=#ebdbb2] #(whoami)@#h:#S"
  tmux set -g message-style "bg=default fg=#ebdbb2"
  tmux setenv THEME dark
fi
