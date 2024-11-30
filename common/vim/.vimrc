" Clear existing maps on load
mapclear

" -------------------------- Settings
set scrolloff=8
set visualbell
set ignorecase
set smartcase
set timeoutlen=400
set whichwrap=<,>,h,l
set clipboard=unnamed
set hlsearch

" -------------------------- Keybindings
let mapleader = " "

" Movement
noremap f b
noremap F B
noremap H ^
noremap J }
noremap K {
noremap L $
noremap M J
nnoremap \ V :m '>+1<CR>gv=gv<Esc>
vnoremap \ :m '>+1<CR>gv=gv
nnoremap / V :m '<-2<CR>gv=gv<Esc>
vnoremap / :m '<-2<CR>gv=gv
nnoremap z mz>>'z
vnoremap z >gv
nnoremap , mz<<'z
vnoremap , <gv

" Search
noremap ; /
noremap : ?
nnoremap g; viwy/<C-r>0
vnoremap g; y/<C-r>0
noremap @ :
nnoremap <Esc> :nohl<CR>
nnoremap v; v/

" Text modification
noremap t y
nnoremap T y$
nnoremap r p
vnoremap r P
noremap R P
noremap x s
noremap s "0x
noremap S "0D
noremap m r
noremap b <C-v>
nnoremap ' ~h
vnoremap ' ~
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>
vnoremap u <Esc>u
noremap U <C-r>

" g commands
noremap gh gd

" Alt commands
noremap <M-j> <C-f>
noremap <M-k> <C-b>
noremap <M-u> <C-o>
noremap <M-i> <C-i>

" Leader commands
noremap <leader>w :w<CR>
noremap <leader><leader>w :wa<CR>
noremap <leader>q :q<CR>
noremap <leader><leader>q :qa<CR>

noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
noremap <leader>v :vsplit<CR>
noremap <leader>c :split<CR>

" Other commands
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

" Visual mode paste
vnoremap <C-v> "_xP

" Undo with <C-z>
nnoremap <C-z> u
xnoremap <C-z> u
inoremap <C-z> <C-o>u

" Redo with <C-y>
noremap <C-y> <C-r>

" Inner shortcuts
nnoremap c" ci"
nnoremap c' ci'
nnoremap c( 0f(ci(
nnoremap c) 0f)ci)
nnoremap c{ ci{
nnoremap c} ci}
nnoremap c[ 0f[ci[
nnoremap c] 0f]ci]
nnoremap ct cit
nnoremap c< ci<
nnoremap c> ci>

nnoremap d" di"
nnoremap d' di'
nnoremap d( 0f(di(
nnoremap d) 0f)di)
nnoremap d{ di{
nnoremap d} di}
nnoremap d[ 0f[di[
nnoremap d] 0f]di]
nnoremap dt dit
nnoremap d< di<
nnoremap d> di>

nnoremap v" vi"
nnoremap v' vi'
nnoremap v( 0f(vi(
nnoremap v) 0f)vi)
nnoremap v{ vi{
nnoremap v} vi}
nnoremap v[ 0f[vi[
nnoremap v] 0f]vi]
nnoremap v< vi<
nnoremap v> vi>

nnoremap t" yi"
nnoremap t' yi'
nnoremap t( mz0f(yi(`z
nnoremap t) mz0f)yi)`z
nnoremap t{ yi{
nnoremap t} yi}
nnoremap t[ mz0f[yi[`z
nnoremap t] mz0f]yi]`z
nnoremap t< yi<
nnoremap t> yi>

" Clear search highlights on load
:nohl
