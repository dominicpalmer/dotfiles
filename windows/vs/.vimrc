" ---- VSVim settings

" Start scrolling 8 lines before the end of the window
set scrolloff=8

" No sound
set visualbell

" Case insensitive searching unless case is specified
set ignorecase
set smartcase

" Timeout length for remaps to complete
set timeoutlen=400

" Wrap to the previous/next line with h/l or left arrow/right arrow
set whichwrap=<,>,h,l

" Search highlighting
set hlsearch

" Use the unnamed register by default
set clipboard=unnamed


" ---- VSVim keybindings

let mapleader = " "

" Yank (take), paste (resolve), replace (place) and till (yet)
noremap t y
nnoremap T y$
noremap y t
noremap Y T
nnoremap r p | :vsc Edit.FormatDocument<CR>
vnoremap r P | :vsc Edit.FormatDocument<CR>
nnoremap ]r ]p | :vsc Edit.FormatDocument<CR>
vnoremap ]r "_x]P | :vsc Edit.FormatDocument<CR>
noremap R P | :vsc Edit.FormatDocument<CR>
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
nnoremap X 0"0D
vnoremap <BS> "0x
vnoremap <CR> "0x
nnoremap <BS> X

" Better indentation
nnoremap > mz>>'z
vnoremap > >gv
nnoremap < mz<<'z
vnoremap < <gv

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

" Have <CR>/<leader><CR> add line breaks below/above the cursor in normal mode
nnoremap <CR> o<Esc>
nnoremap <leader><CR> O<Esc>

" Indent recently pasted text
nnoremap <leader>> V`]>
nnoremap <leader>< V`]<

" Sensible redo: VSVim forces VS to use the Vim undo stack, so this works as-is
nnoremap U <C-r>

" Additional undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Line and block shifting
vnoremap ( :vsc Edit.MoveSelectedLinesDown<CR>
vnoremap ) :vsc Edit.MoveSelectedLinesUp<CR>

" Code navigation
noremap gp :vsc Edit.PeekDefinition<CR>
noremap go :vsc Edit.GoToDefinition<CR>
noremap gi :vsc Edit.GoToImplementation<CR>
noremap gu :vsc Edit.FindAllReferences<CR>
noremap <leader>f :vsc Edit.FindInFiles<CR>
noremap <leader>o :vsc Edit.GoToAll<CR>
nnoremap <leader>; :

" Comment selection (requires the 'Hot Commands' extension)
nnoremap <leader>/ :vsc Edit.ToggleComment<CR>
vnoremap <leader>/ :vsc Edit.ToggleComment<CR> | <Esc><CR>

" Code editing
noremap <leader>n :vsc File.NewFile<CR>
noremap <leader>r :vsc Refactor.Rename<CR>
noremap gh :vsc Edit.Replace<CR>
noremap <leader>gh :vsc Edit.ReplaceInFiles<CR>

" Editor windows, tabs, panels
noremap gj :vsc View.SolutionExplorer<CR>
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
noremap <leader>v :vsplit<CR>
noremap <leader>c :split<CR>
noremap <leader>p :vsc Window.PinTab<CR>
noremap <leader>1 :vsc Window.GoToUnpinnedTab1<CR>
noremap <leader>2 :vsc Window.GoToUnpinnedTab2<CR>
noremap <leader>3 :vsc Window.GoToUnpinnedTab3<CR>
noremap <leader>4 :vsc Window.GoToUnpinnedTab4<CR>
noremap <leader>5 :vsc Window.GoToUnpinnedTab5<CR>
noremap <leader>6 :vsc Window.GoToUnpinnedTab6<CR>
noremap <leader>7 :vsc Window.GoToUnpinnedTab7<CR>
noremap <leader>8 :vsc Window.GoToUnpinnedTab8<CR>
noremap <leader>9 :vsc Window.GoToUnpinnedTab9<CR>

" Forward, back
noremap <M-i> :vsc View.NavigateForward<CR>
noremap <M-u> :vsc View.NavigateBackward<CR>

" Use Visual Studio page up and page down
nnoremap <M-j> :vsc Edit.PageDown<CR>
vnoremap <M-j> :vsc Edit.PageDownExtend<CR>
nnoremap <M-k> :vsc Edit.PageUp<CR>
vnoremap <M-k> :vsc Edit.PageUpExtend<CR>

" Navigate errors
noremap <leader>u :vsc View.NextError<CR>
noremap <leader>i :vsc View.PreviousError<CR>

" Reload configuration
noremap <leader><leader>r :so ~\.vimrc<CR>

:echo ".vimrc loaded successfully"
