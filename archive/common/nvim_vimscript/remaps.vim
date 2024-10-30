let mapleader = " "

" Yank (take), paste (resolve), replace (place) and till (yet)
noremap t y
nnoremap T y$
noremap y t
noremap Y T
nnoremap r p
vnoremap r P
nnoremap ]r ]p
vnoremap ]r "_x]P
noremap R P
noremap p r
noremap P R

" J (join) to M (merge)
noremap M J

" Swap find and search
noremap f /
noremap F ?
noremap / f
noremap ? F

" Line and paragraph navigation
noremap J }
noremap K {
noremap H ^
noremap ^ H
noremap L $
noremap $ L
noremap Q %

" 0 register deletion and line clearing, and normal mode backspace
noremap x "0x
nnoremap X "00D
vnoremap <BS> "0x
vnoremap <CR> "0x
nnoremap <BS> X

" Better indentation
nnoremap > mz>>'z
vnoremap > >gv
nnoremap < mz<<'z
vnoremap < <gv

" Select all, copy, cut, save
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-c> y
vnoremap <C-x> x
noremap <C-s> :w<CR>

" In normal mode, paste before with <C-v>. Good for pasting blocks from outside
" the editor, or pasting character wise within lines
nnoremap <C-v> gP

" In insert mode, paste after with <C-v>. Good for pasting character wise from
" outside the editor at the end of existing lines
inoremap <C-v> <C-o>gp

" Regain visual block mode with S
noremap S <C-v>

" Turn off search highlighting
nnoremap <Esc> :nohl<CR>

" Undo immediately, without needing an extra escape out of visual mode
vnoremap u <Esc>u

" Repeat word deletion or changes, forwards or backwards
nnoremap d* *``dgn
nnoremap d# *``dgN
nnoremap c* *``cgn
nnoremap c# #``cgN

" Sensible write and close
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><leader>q :qa<CR>

" Page up, page down
noremap <M-j> <C-f>
noremap <M-k> <C-b>

" Have <CR>/<leader><CR> add line breaks below/above the cursor in normal mode.
" The autocommands fix issues raised from remapping <CR>
nnoremap <CR> o<Esc>
nnoremap <leader><CR> O<Esc>
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Clear selection content in visual mode
vnoremap X :s/^**.*/<CR> \| :nohl<CR> \| hk

" Indent recently pasted text
nnoremap <leader>> V`]>
nnoremap <leader>< V`]<

" Sensible redo
nnoremap U <C-r>

" Visual mode paste
vnoremap <C-v> "_xP

" Undo with <C-z>
nnoremap <C-z> u
xnoremap <C-z> u
inoremap <C-z> <C-o>u

" Redo with <C-y>
noremap <C-y> <C-r>

" Additional undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Additional jump list insertions for relative line jumping beyond 5 lines
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

" Line and block shifting
vnoremap ) :m '>+1<CR>gv=gv
vnoremap ( :m '<-2<CR>gv=gv

" Command mode
nnoremap <leader>; :

" Sensible window movement
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" Window splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>c :split<CR>

" Wildmenu navigation
set wildcharm=<C-r>
cnoremap <expr> <M-h> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <M-j> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <M-k> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <M-l> wildmenumode() ? " \<bs>\<C-r>" : "\<right>"

" More autocompletion navigation with <M-j> and <M-k>
inoremap <expr> <M-j> pumvisible() ? "\<C-n>" : "j"
inoremap <expr> <M-k> pumvisible() ? "\<C-p>" : "k"

" Open an unnamed buffer
nnoremap <silent> <leader>n :enew<CR>

" Unload the focused buffer
nnoremap <leader>f :bp<bar>sp<bar>bn<bar>bd<CR>

" Reload configuration
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>
