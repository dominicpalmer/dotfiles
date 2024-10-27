local opt = vim.opt

-- The number of columns to render for a tab
opt.tabstop = 8

-- Populate rendered tabs with spaces
opt.expandtab = true

-- Indentation width
opt.shiftwidth = 2

-- Apply the prior line indentation to the current
opt.autoindent = true

-- Allow indentation to react to the syntax and style of the text in the buffer
opt.smartindent = true

-- Start scrolling 8/4 lines/columns before the end/side of the window
opt.scrolloff = 8
opt.sidescrolloff = 4

-- No line wrapping
opt.wrap = false

-- Show line numbers
opt.number = true
opt.cul = true
opt.numberwidth = 2

-- Keep buffers open in the background
opt.hidden = true

-- No swapfiles
opt.swapfile = false

-- Store a backup in tmp on loading a file into a buffer
opt.backupdir = "/tmp//"

-- Persist undo history in tmp. Neovim creates undodir if needed, Vim doesn't
opt.undofile = true
opt.undodir = "/tmp//"

-- Source any Neovim config found in opened directories
opt.exrc = true

-- Case insensitive searching unless case is specified
opt.ignorecase = true
opt.smartcase = true

-- Open the insert mode completion menu, but don't autoselect an option
opt.completeopt = {
   "menuone",
   "noinsert",
   "noselect"
}

-- Column marker
opt.colorcolumn = "100"

-- Line gutter
opt.signcolumn = "yes"

-- Enable the mouse
opt.mouse = "a"

-- Sets swapfile write frequency and cursor inactivity counter through the
-- CursorHold autocommand event. Decreasing the time increases performance
opt.updatetime = 50

-- Timeout length for remaps to complete
opt.timeoutlen = 1000

-- 24-bit colour
opt.termguicolors = true

-- No Neovim startup message, and don't forward messages to the completion menu
opt.shortmess = opt.shortmess + "sI"
opt.shortmess = opt.shortmess + "c"

-- Tab complete the longest matching word and use a tabable wildmenu
opt.wildmode = {
   "longest:full",
   "list:full"
}

-- Have the wildmenu ignore .git and node_modules
opt.wildignore = opt.wildignore + "**/.git/*"
opt.wildignore = opt.wildignore + "/node_modules/"

-- Recursively search for files from the root directory
opt.path = opt.path + "**"

-- Use the unnamed register by default
opt.clipboard = "unnamedplus"

-- Don't show the mode on the command line
opt.showmode = false

-- Open splits below and right of the calling window
opt.splitbelow = true
opt.splitright = true

-- Remove pipe split separators trailing tildes
opt.fillchars = {
   vert = " ",
   eob = " "
}

-- Wrap to the previous/next line with h/l or left arrow/right arrow
opt.whichwrap = opt.whichwrap + "<>hl"

-- Global statusline
opt.laststatus = 3
