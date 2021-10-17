-- lua/core/options.lua
-- Loads in and binds options defined in lua/common.lua to Neovim options

local opt = vim.opt
local base_options = require("core.utils").load_config().options

opt.tabstop = base_options.tabstop
opt.expandtab = base_options.expandtab
opt.shiftwidth = base_options.shiftwidth
opt.autoindent = base_options.autoindent
opt.smartindent = base_options.smartindent
opt.scrolloff = base_options.scrolloff
opt.sidescrolloff = base_options.sidescrolloff
opt.wrap = base_options.wrap
opt.number = base_options.number
opt.numberwidth = base_options.numberwidth
opt.cul = base_options.cursorline
opt.hidden = base_options.hidden
opt.swapfile = base_options.swapfile
opt.backupdir = base_options.backupdir
opt.undofile = base_options.undofile
opt.undodir = base_options.undodir
opt.exrc = base_options.exrc
opt.ignorecase = base_options.ignorecase
opt.smartcase = base_options.smartcase
opt.completeopt = base_options.completeopt
opt.colorcolumn = base_options.colorcolumn
opt.signcolumn = base_options.signcolumn
opt.mouse = base_options.mouse
opt.updatetime = base_options.updatetime
opt.timeoutlen = base_options.timeoutlen
opt.termguicolors = base_options.termguicolors
opt.shortmess = opt.shortmess + base_options.shortmess_startup
opt.shortmess = opt.shortmess + base_options.shortmess_completion
opt.wildmode = base_options.wildmode
opt.wildignore = opt.wildignore + base_options.wildignore_git
opt.wildignore = opt.wildignore + base_options.wildignore_node
opt.path = opt.path + base_options.path
opt.clipboard = base_options.clipboard
opt.showmode = base_options.showmode
opt.splitbelow = base_options.splitbelow
opt.splitright = base_options.splitbelow
opt.fillchars = { vert = base_options.fillchars_vert, eob = base_options.fillchars_eob }
opt.whichwrap = opt.whichwrap + base_options.whichwrap
