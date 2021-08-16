" The number of columns Vim renders for a tab
set tabstop=4

" Populate rendered tabs with spaces
set expandtab

" Shift indentation width (e.g. via >>, <<)
set shiftwidth=4

" Apply the current line indentation to the next
set autoindent

" React to the React style React the React file
set smartindent

" Source additional configuration from opened directories, if available
set exrc

" Relative line numbers with current line also indicated
set relativenumber
set nu

" Turn off search highlighting immediately after finishing a search
set nohlsearch

" Keep buffers open in the background
set hidden

" No sound
set noerrorbells

" No word wrapping
set nowrap

" Case insensitive searching unless case is specified
set ignorecase
set smartcase

" No swapfiles
set noswapfile

" Store a backup in tmp on loading a file into a buffer
set backupdir=/tmp//

" Persist undo history in tmp. Neovim creates undodir if needed, Vim doesn't
set undodir=/tmp//
set undofile

" Incrementally highlight search results while typing
set incsearch

" Start scrolling 8/4 lines/columns before the end/side of the window
set scrolloff=8
set sidescrolloff=4

" Always open the insert mode completion menu, but don't autoselect an option
set completeopt=menuone,noinsert,noselect

" Add a marker at column 80
set colorcolumn=80

" Use a line gutter
set signcolumn=yes

" Allow the mouse to scroll and resize
set mouse=a

" Sets swapfile write frequency and cursor inactivity counter through the
" CursorHold autocommand event. Decreasing the time increases performance
set updatetime=50

" 24 bit colours
set termguicolors

" Don't forward messages to the insert completion menu
set shortmess+=c

" Tab completion to the longest matching word with a tab-able wildmenu
set wildmode=longest:full,list:full

" Instruct the wildmenu to ignore .git and node_modules
set wildignore+=**/.git/*
set wildignore+=/node_modules/

" Recursively search for files from the root directory
set path+=**

" Use the unnamed register by default
set clipboard=unnamedplus

" Don't show the mode on the command line
set noshowmode

" Plugins
call plug#begin('~/.vim/plugged')

" File tree
Plug 'preservim/nerdtree'

" Status line
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Tab line
Plug 'romgrk/barbar.nvim'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Intellisense and syntax higlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Undo history via undotree
Plug 'mbbill/undotree'

" Styling
Plug 'gruvbox-community/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

colorscheme gruvbox

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" No parentheses match highlighting
let loaded_matchparen = 1

" Delete trailing whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TEST
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

let mapleader = " "

" Re source init.vim with <leader>r
nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>

" Have <CR>/<leader><CR> add line breaks below/above the cursor in normal mode.
" The autocommands fix issues raised from remapping <CR>, e.g. selecting list
" options in cmd history/quickfix/location windows
nnoremap <CR> o<Esc>
nnoremap <leader><CR> O<Esc>
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" x to delete into the 0 register by default
noremap x "0x

" Delete forward by words in insert mode
inoremap <C-d> <C-o>dW

" Deletion backward by words adds additional undo break points
inoremap <C-w> <C-w><C-g>u

" Delete the current word, then allow repeats forward (*) or backward (#)
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN

" Y yanks cursor to EOL
nnoremap Y y$

" Change the current word, then allow repeats forward (*) or backward (#)
nnoremap c* *``cgn
nnoremap c# #``cgN

" Sensible redo
nnoremap U <C-r>

" In visual mode, prepend <leader> to paste without storing the overwriten text
xnoremap <leader>p "_xP

" Better navigation between line start and line end
nnoremap H ^
nnoremap ^ H
nnoremap L $
nnoremap $ L

" Copy with <C-c>
vnoremap <C-c> y

" Cut with <C-x>
vnoremap <C-x> x

" In normal and visual mode, paste before with <C-v>. Good for pasting blocks
" from outside the editor, or pasting character wise within lines
nnoremap <C-v> gP
vnoremap <C-v> "_xP

" In insert mode, paste after with <C-v>. Good for pasting character wise from
" outside the editor at the end of existing lines
inoremap <C-v> <C-o>gp

" Regain visual block mode with <C-q>
noremap <C-q> <C-v>

" Undo with <C-z>
noremap <C-z> u
inoremap <C-z> <C-o>u

" Select all with <C-a>
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" Sensible write and close, with autodeletion of trailing whitespace
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Maintain centered line focus when navigating search results
nnoremap n nzzzv
nnoremap N Nzzzv

" Maintain cursor position when joining lines
nnoremap J mzJ'z

" Additional undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Additional jump point insertions for relative line jumping beyond 5 lines
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Line and block shifting
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Indent recently pasted text
nnoremap <leader>< V`]<
nnoremap <leader>> V`]>

" Sensible window movement
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l

" FZF
nnoremap <silent> <C-p> :Files<CR>

" Gitgutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterChange guifg=#ff2222 ctermfg=Red

" Lightline status bar
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif | call lightline#update()

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Undotree
nnoremap <leader>u :UndotreeShow<CR>

" CoC - use <Tab>/<S-Tab> for navigating suggestion list
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
