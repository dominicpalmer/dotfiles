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

-- Don't show any line numbers inside terminals
vim.cmd("autocmd TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal")
