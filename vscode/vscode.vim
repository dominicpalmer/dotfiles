" Vim emulation in VSCode via the vscodevim extension supports use of .vimrc
" and .vim configuration files. Only remaps are currently supported, so this
" file is an additional Vim mapping layer over the default vscodevim bindings

" Yank (take), paste (resolve), replace (place) and till (yet)
noremap t y
noremap T y$
noremap y t
noremap Y T
nnoremap r p
xnoremap r "_xP
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
noremap { <C-f>
noremap } <C-b>

" Replace J (join) with M (merge)
noremap M J

" Bracket matching
noremap Q %

" Search for the word under the cursor
noremap ! *

" x to delete into the 0 register. Used for deleting inbetween copy and paste
noremap x "0x

" Copy with <C-c>
vnoremap <C-c> y

" Cut with <C-x>
vnoremap <C-x> x

" In normal mode, paste before with <C-v>. Good for pasting blocks from outside
" the editor, or pasting character wise within lines. vscodevim doesn't appear
" to make use of the black hole register, so use the unnamed register instead
nnoremap <C-v> gP

" In insert mode, paste after with <C-v>. Good for pasting character wise from
" outside the editor at the end of existing lines
inoremap <C-v> <C-o>gp

" Regain visual block mode with <C-q>
noremap <C-q> <C-v>

" Delete line content
nnoremap X 0D

" Delete selection content
vnoremap <CR> d

" Regain normal mode backspace
nnoremap <BS> X

" Delete forward by words in insert mode
inoremap <C-d> <C-o>dW

" Delete the current word, then allow repeats forward (*) or backward (#)
nnoremap d* *``dgn
nnoremap d# #``dgN

" Change the current word, then allow repeats forward (*) or backward (#)
nnoremap c* *``cgn
nnoremap c# #``cgN

" Select all with <C-a>
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" Write with <C-s>
noremap <C-s> :w<CR>

" Sensible write and close
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :q!<CR>

" Maintain centered line focus when navigating search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Maintain cursor position when joining lines
nnoremap M mzJ'z

" Better indentation
nnoremap > mz>>'z
nnoremap < mz<<'z
vnoremap > >gv
vnoremap < <gv

" Navigate through the autocompletion list with <C-j> and <C-k>
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Turn off search higlighting
nnoremap <leader>/ :nohl<CR>

" EasyMotion jump to anywhere
noremap <leader>e <leader><leader><leader>j
