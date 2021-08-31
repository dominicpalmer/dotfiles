-- lua/core/general.lua
-- Contains general configuration to be loaded at startup (autocommands, etc.)

local g = vim.g

g.mapleader = " "

-- Disable unused built-in plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

-- Don't show the statusline on certain windows
vim.cmd [[ autocmd BufEnter,BufWinEnter,FileType,WinEnter * lua require("core.utils").hide_statusline() ]]

-- Reopen files with the cursor where it was last left
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

-- Don't show any numbers inside terminals
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
