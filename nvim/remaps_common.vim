" Remaps shared by Neovim and VSCodeVim

" Yank (take), paste (resolve), replace (place) and till (yet)
noremap t y
noremap T y$
noremap y t
noremap Y T
nnoremap r p
xnoremap r "_xP
nnoremap ]r ]p
xnoremap ]r "_x]P
noremap R P
noremap p r
noremap P R

" Home row navigation between line start and line end
noremap H ^
noremap ^ H
noremap L $
noremap $ L

" Home row navigation between paragraphs
noremap J }
noremap K {

" Page up, page down
noremap } <C-f>
noremap { <C-b>

" J (join) to M (merge), with fixed cursor position from normal mode
xnoremap M J
nnoremap M mzJ'z

" Bracket matching
noremap Q %

" x to delete into the 0 register. Used for deleting inbetween copy and paste
noremap x "0x

" Clear line content
nnoremap X "00D

" Delete selection content
vnoremap <CR> d

" Regain normal mode backspace
nnoremap <BS> X

" Better indentation
nnoremap > mz>>'z
vnoremap > >gv
nnoremap < mz<<'z
vnoremap < <gv

" Delete forward by words in insert mode
inoremap <C-d> <C-o>dW

" Copy with <C-c>
vnoremap <C-c> y

" Cut with <C-x>
vnoremap <C-x> x

" In normal mode, paste before with <C-v>. Good for pasting blocks from outside
" the editor, or pasting character wise within lines
nnoremap <C-v> gP

" In insert mode, paste after with <C-v>. Good for pasting character wise from
" outside the editor at the end of existing lines
inoremap <C-v> <C-o>gp

" Select all with <C-a>
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" Write with <C-s>
noremap <C-s> :w<CR>

" Regain visual block mode with <C-q>
noremap <C-q> <C-v>

" Repeat word deletion forwards or backwards
nnoremap d* *``dgn
nnoremap d# *``dgN

" Repeat word changes forwards or backwards
nnoremap c* *``cgn
nnoremap c# #``cgN

" Sensible write and close
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Navigate through the autocompletion list with <C-j> and <C-k>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "k"
