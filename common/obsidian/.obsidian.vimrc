" ---- Settings

set scrolloff=8
set visualbell
set ignorecase
set smartcase
set timeoutlen=400
set whichwrap=<,>,h,l
set hlsearch
set clipboard=unnamed

" ---- Keybindings

let mapleader = " "

" Cursor, line and block movement
noremap f b
noremap F B
noremap H ^
noremap J }
noremap K {
noremap L $
noremap M J

"nnoremap \ V :m '>+1<CR>gv=gv<Esc>
"nnoremap / V :m '<-2<CR>gv=gv<Esc>
"vnoremap \ :m '>+1<CR>gv=gv
"vnoremap / :m '<-2<CR>gv=gv

"nnoremap z mz>>'z
"vnoremap z >gv
"nnoremap , mz<<'z
"vnoremap , <gv

" Search
noremap ; /
noremap : ?
"nnoremap g; viwy/<C-r>0
"vnoremap g; y/<C-r>0
"noremap y :
"nnoremap <Esc> :nohl<CR>

" Copy and paste
noremap t y
"nnoremap T y$
noremap r p
"vnoremap r P
noremap R P

" Text modification
"noremap x s
"noremap s "0x
"noremap S 0"0D
"noremap m r
noremap b <C-v>
"nnoremap ' ~h
noremap ' ~
"nnoremap <CR> o<Esc>
"nnoremap <S-CR> O<Esc>
"vnoremap u <Esc>u
noremap U <C-r>

" Inner shortcuts
"nnoremap c" ci"
"nnoremap c' ci'
"nnoremap c( 0f(ci(
"nnoremap c) 0f)ci)
"nnoremap c{ ci{
"nnoremap c} ci}
"nnoremap c[ 0f[ci[
"nnoremap c] 0f]ci]
"nnoremap ct cit
"nnoremap c< ci<
"nnoremap c> ci>

"nnoremap d" di"
"nnoremap d' di'
"nnoremap d( 0f(di(
"nnoremap d) 0f)di)
"nnoremap d{ di{
"nnoremap d} di}
"nnoremap d[ 0f[di[
"nnoremap d] 0f]di]
"nnoremap dt dit
"nnoremap d< di<
"nnoremap d> di>

"nnoremap v" vi"
"nnoremap v' vi'
"nnoremap v( 0f(vi(
"nnoremap v) 0f)vi)
"nnoremap v{ vi{
"nnoremap v} vi}
"nnoremap v[ 0f[vi[
"nnoremap v] 0f]vi]
"nnoremap v< vi<
"nnoremap v> vi>

"nnoremap t" yi"
"nnoremap t' yi'
"nnoremap t( mz0f(yi(`z
"nnoremap t) mz0f)yi)`z
"nnoremap t{ yi{
"nnoremap t} yi}
"nnoremap t[ mz0f[yi[`z
"nnoremap t] mz0f]yi]`z
"nnoremap t< yi<
"nnoremap t> yi>

" Write and close
"noremap <leader>w :w<CR>
"noremap <leader><leader>w :wa<CR>
"noremap <leader>q :q<CR>
"noremap <leader><leader>q :qa<CR>

" Code navigation and modification
"noremap gh gd

" Pageup/Pagedown
noremap <A-k> <C-b>
noremap <A-j> <C-f>

" Windows and tabs
"noremap <leader>h <C-w>h
"noremap <leader>j <C-w>j
"noremap <leader>k <C-w>k
"noremap <leader>l <C-w>l
"noremap <leader>v :vsplit<CR>
"noremap <leader>c :split<CR>

" Select all, copy, cut, save
"nnoremap <C-a> ggVG
"inoremap <C-a> <Esc>ggVG
noremap <C-c> y
noremap <C-x> x
"noremap <C-s> :w<CR>

" In normal mode, paste before with <C-v>. Good for pasting blocks from outside
" the editor, or pasting character wise within lines
noremap <C-v> P

" In insert mode, paste after with <C-v>. Good for pasting character wise from
" outside the editor at the end of existing lines
"inoremap <C-v> <C-o>gp

" Visual mode paste
"vnoremap <C-v> "_xP

" Undo with <C-z>
noremap <C-z> u
"xnoremap <C-z> u
"inoremap <C-z> <C-o>u

" Redo with <C-y>
noremap <C-y> <C-r>
