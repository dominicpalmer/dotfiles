" The number of columns Vim renders for a tab
set tabstop=4

" Populate rendered tabs with spaces
set expandtab

" Shift indentation width (e.g. via >>, <<)
set shiftwidth=4

" Apply the current line indentation to the next
set autoindent

" Allow indentation to react to the syntax and style of the text in the buffer
set smartindent

" Start scrolling 8/4 lines/columns before the end/side of the window
set scrolloff=8
set sidescrolloff=4

" No line wrapping
set nowrap

" Show line numbers and highlight the line under cursor
set number
set cursorline
set numberwidth=2

" Keep buffers open in the background
set hidden

" No sound
set noerrorbells

" No swapfiles
set noswapfile

" Store a backup in tmp on loading a file into a buffer
set backupdir=/tmp//

" Persist undo history in tmp. Neovim creates undodir if needed, Vim doesn't
set undodir=/tmp//
set undofile

" Source additional configuration from opened directories, if available
set exrc

" Case insensitive searching unless case is specified
set ignorecase
set smartcase

" open the insert mode completion menu, but don't autoselect an option
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

" Timeout length for remaps to complete
set timeoutlen=400

" 24 bit colours
set termguicolors

" No Neovim startup message, and don't forward messages to the completion menu
set shortmess+=sI
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

" Open splits below and right of the calling window
set splitbelow
set splitright

" Better split separators
set fillchars+=vert:\ |
set fillchars+=stlnc:_
set fillchars+=stl:_

" Remove trailing tildes in buffers
set fillchars+=eob:\ |

" Wrap to the previous/next line with h/l or left arrow/right arrow
set whichwrap+="<>hl"
