local g = vim.g

g.mapleader = " "

-- Disable unused builtin plugins
local unused_plugins = {
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "gzip",
   "zip",
   "zipPlugin",
   "tar",
   "tarPlugin",
   "vimball",
   "vimballPlugin",
   "rrhelper",
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "logipat",
   "spellfile_plugin",
   "matchit"
}

for _, plugin in pairs(unused_plugins) do
   g["loaded_" .. plugin] = 1
end

-- Reopen files with the cursor where it was last left
vim.cmd [[ autocmd BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- Theme
vim.cmd("autocmd VimEnter,ColorScheme * colorscheme gruvbox")

-- General transparency
vim.cmd("autocmd VimEnter,ColorScheme * hi Normal guibg=None")
vim.cmd("autocmd VimEnter,ColorScheme * hi Normal guibg=None")
vim.cmd("autocmd VimEnter,ColorScheme * hi SignColumn guibg=None")
vim.cmd("autocmd VimEnter,ColorScheme * hi LineNr guibg=None")

-- StatusLine and StatusLineNC guifg must differ for the vertical split to be transparent
vim.cmd("autocmd VimEnter,ColorScheme * hi clear StatusLine")
vim.cmd("autocmd VimEnter,ColorScheme * hi clear StatusLineNC")
vim.cmd("autocmd VimEnter,ColorScheme * hi StatusLine ctermbg=None ctermfg=None guifg=Grey guibg=None")
vim.cmd("autocmd VimEnter,ColorScheme * hi StatusLineNC ctermbg=None ctermfg=None guifg=None guibg=None")

-- Thin line window separators
vertical_split_fg = "#303030"
vim.cmd("set fillchars+=vert:│")
vim.cmd("autocmd VimEnter,ColorScheme * hi WinSeparator guibg=None guifg=" .. vertical_split_fg)
vim.cmd("autocmd VimEnter,ColorScheme * hi cursorlinenr guibg=None")
