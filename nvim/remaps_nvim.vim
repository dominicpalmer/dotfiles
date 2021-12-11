" Dedicated Neovim remaps

let mapleader = " "

" Have <CR>/<leader><CR> add line breaks below/above the cursor in normal mode.
" The autocommands fix issues raised from remapping <CR>
nnoremap <CR> o<Esc>
nnoremap <leader><CR> O<Esc>
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Deletion backward by words adds additional undo break points
inoremap <C-w> <C-w><C-g>u

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
nnoremap <silent> <leader>; :

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
cnoremap <expr> <C-h> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <C-j> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <C-k> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <C-l> wildmenumode() ? " \<bs>\<C-r>" : "\<right>"

" Open an unnamed buffer
nnoremap <silent> <leader>n :enew<CR>

" Unload the focused buffer
nnoremap <leader>f :bp<bar>sp<bar>bn<bar>bd<CR>

" Reload configuration
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>
