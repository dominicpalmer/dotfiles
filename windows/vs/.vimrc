" ---- VSVim Settings

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
noremap T y$
noremap y t
noremap Y T
nnoremap r p | :vsc Edit.FormatDocument<CR>
xnoremap r "_xP | :vsc Edit.FormatDocument<CR>
nnoremap ]r ]p | :vsc Edit.FormatDocument<CR>
xnoremap ]r "_x]P | :vsc Edit.FormatDocument<CR>
noremap R P | :vsc Edit.FormatDocument<CR>
noremap p r
noremap P R

" Swap find and search
noremap f /
noremap F ?
noremap / f
noremap ? F

" Home row navigation between line start and line end
noremap H ^
noremap ^ H
noremap L $
noremap $ L

" Home row navigation between paragraphs
noremap J }
noremap K {

" Use Visual Studio page up and page down
nnoremap <M-j> :vsc Edit.PageDown<CR>
vnoremap <M-j> :vsc Edit.PageDownExtend<CR>
nnoremap <M-k> :vsc Edit.PageUp<CR>
vnoremap <M-k> :vsc Edit.PageUpExtend<CR>

" J (join) to M (merge)
xnoremap M J
nnoremap M J

" Bracket matching
noremap Q %

" x to delete into the 0 register. Used for deleting inbetween copy and paste
noremap x "0x

" Clear line content
nnoremap X 0"0D

" Regain normal mode backspace
noremap <BS> X

" Delete selection content
vnoremap <CR> d

" Better indentation
nnoremap > mz>>'z
vnoremap > >gv
nnoremap < mz<<'z
vnoremap < <gv

" Regain visual block mode with S
noremap S <C-v>

" Turn off search highlighting
nnoremap <Esc> :nohl<CR>

" Repeat word deletion forwards or backwards
nnoremap d* *``dgn
nnoremap d# *``dgN

" Repeat word changes forwards or backwards
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
noremap ) :vsc Edit.MoveSelectedLinesDown<CR>
noremap ( :vsc Edit.MoveSelectedLinesUp<CR>

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

" Open an unnamed buffer
noremap <leader>n :vsc File.NewFile<CR>

" Reload configuration
nnoremap <leader><leader>r :so ~\.vimrc<CR>

" Goto definition, references, implementation
noremap gp :vsc Edit.PeekDefinition<CR>
noremap go :vsc Edit.GoToDefinition<CR>
noremap gi :vsc Edit.GoToImplementation<CR>
noremap gu :vsc Edit.FindAllReferences<CR>

" Navigate errors
noremap <leader>i :vsc View.NextError<CR>
noremap <leader>y :vsc View.PreviousError<CR>

" Open fuzzy finder
noremap <leader>o :vsc Edit.GoToAll<CR>

" Open solution explorer
noremap <leader>d :vsc View.SolutionExplorer<CR>

" Pin tab
noremap <leader>p :vsc Window.PinTab<CR>

" Rename object
noremap <leader>r :vsc Refactor.Rename<CR>

" Find and replace
noremap gh :vsc Edit.Replace<CR>
noremap <leader>gh :vsc Edit.ReplaceInFiles<CR>

" Comment selection (requires the 'Hot Commands' extension)
noremap <leader>/ :vsc Edit.ToggleComment<CR> | <Esc><CR>

" Select tabs by index
noremap <leader>1 :vsc Window.GoToUnpinnedTab1<CR>
noremap <leader>2 :vsc Window.GoToUnpinnedTab2<CR>
noremap <leader>3 :vsc Window.GoToUnpinnedTab3<CR>
noremap <leader>4 :vsc Window.GoToUnpinnedTab4<CR>
noremap <leader>5 :vsc Window.GoToUnpinnedTab5<CR>
noremap <leader>6 :vsc Window.GoToUnpinnedTab6<CR>
noremap <leader>7 :vsc Window.GoToUnpinnedTab7<CR>
noremap <leader>8 :vsc Window.GoToUnpinnedTab8<CR>
noremap <leader>9 :vsc Window.GoToUnpinnedTab9<CR>

:echo ".vimrc loaded successfully"
