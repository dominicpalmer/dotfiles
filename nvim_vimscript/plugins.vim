call plug#begin('~/.vim/plugged')

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Intellisense and syntax higlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'RRethy/vim-illuminate'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Undo history
Plug 'mbbill/undotree'

" File tree
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'preservim/nerdtree'

" Status line
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Tab line
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Scrollbar
Plug 'dstein64/nvim-scrollview'

" Styling
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Comments
Plug 'tpope/vim-commentary'

" Easymotion
Plug 'easymotion/vim-easymotion'

" Improvements to searching
Plug 'haya14busa/vim-asterisk'
Plug 'qxxxb/vim-searchhi'

call plug#end()

" FZF - layout
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, { 'options': [
    \ '--layout=reverse',
    \ '--info=inline',
    \ '--preview',
    \ 'cat {}'] },
    \ <bang>0)
nnoremap <silent> <leader>o :Files<CR>
let g:fzf_layout = { 'window': { 'height': 0.75, 'width': 0.7 } }

" FZF - close faster
aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <C-c>
aug END

" Lightline - enable.tabline = 0 allows use of barbar
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ 'enable': {
    \   'tabline': 0
    \ }
    \ }
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

" " Start NERDTree. If a file is specified, move the cursor to its window
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in")
"     \ | wincmd p | endif | call lightline#update()

" " Close the tab if NERDTree is the only window remaining in it
" autocmd BufEnter * if winnr('$') == 1
"     \ && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" " If another buffer tries to replace NERDTree, put it in the other window
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+'
"     \ && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1
"     \ | let buf=bufnr() | buffer# | execute "normal! \<C-W>w"
"     \ | execute 'buffer'.buf | endif

" " Open the existing NERDTree on each new tab
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" " Toggle NERDTree
" nnoremap <silent> <leader>s :NERDTreeToggle <Bar> if &filetype ==# 'nerdtree'
"     \ <Bar> wincmd p <Bar> endif<CR>

" " Remove the NERDTree help menu
" let NERDTreeMinimalUI=1

" " Open NERDTree directories with a single click
" let NERDTreeMouseMode=2

" nvim-tree
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 1
noremap <silent> <leader>s :NvimTreeToggle<CR>

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

" CoC - navigate diagnostic errors
nmap <leader>i <Plug>(coc-diagnostic-next)
nmap <leader>y <Plug>(coc-diagnostic-previous)
nnoremap <leader>d :CocList diagnostics<CR>

" CoC - reopen the autocompletion menu
inoremap <silent><expr> <c-space> coc#refresh()

" Commentary
nmap <leader>/ gcc
vmap <leader>/ gc

" EasyMotion
nmap <leader>e <Plug>(easymotion-bd-w)

" barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'both'
let bufferline.animation = v:false
let bufferline.maximum_padding = 1
let bufferline.icon_pinned = '車'
let bufferline.insert_at_end = v:true

nnoremap <silent> <leader>p :BufferPin<CR>
nnoremap <silent> <leader>1  :BufferGoto 1<CR>
nnoremap <silent> <leader>2  :BufferGoto 2<CR>
nnoremap <silent> <leader>3  :BufferGoto 3<CR>
nnoremap <silent> <leader>4  :BufferGoto 4<CR>
nnoremap <silent> <leader>5  :BufferGoto 5<CR>
nnoremap <silent> <leader>6  :BufferGoto 6<CR>
nnoremap <silent> <leader>7  :BufferGoto 7<CR>
nnoremap <silent> <leader>8  :BufferGoto 8<CR>
nnoremap <silent> <leader>9  :BufferGoto 9<CR>

" vim-asterisk and searchhi - changes to * and #:
" 1. Emphasise highlighting of the current search
" 2. Always use partial and smartcase matching via the 'g' prefix
" 3. Always ignore the first search jump on enter via the 'z' prefix
" 4. Keep cursor position when navigating search matches from normal mode
map * <Plug>(asterisk-gz*)<Plug>(searchhi-update)
map g* <Plug>(asterisk-gz*)<Plug>(searchhi-update)
map z* <Plug>(asterisk-gz*)<Plug>(searchhi-update)
map gz* <Plug>(asterisk-gz*)<Plug>(searchhi-update)

map # <Plug>(asterisk-gz#)<Plug>(searchhi-update)
map g# <Plug>(asterisk-gz#)<Plug>(searchhi-update)
map z# <Plug>(asterisk-gz#)<Plug>(searchhi-update)
map gz# <Plug>(asterisk-gz#)<Plug>(searchhi-update)

let g:asterisk#keeppos = 1

nmap <silent> <Esc> <Plug>(searchhi-clear-all)

" nvim-scrollview
let scrollview_column = 1
