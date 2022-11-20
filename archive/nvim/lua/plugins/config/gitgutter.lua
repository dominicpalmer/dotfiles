local utils = require "lib.utils"
local map = utils.map

vim.api.nvim_exec([[ let g:gitgutter_map_keys = 0 ]], false)

vim.cmd("autocmd VimEnter,ColorScheme * hi GitGutterAdd guibg=None guifg=#009900 ctermfg=2")
vim.cmd("autocmd VimEnter,ColorScheme * hi GitGutterChange guibg=None guifg=#bbbb00 ctermfg=3")
vim.cmd("autocmd VimEnter,ColorScheme * hi GitGutterDelete guibg=None guifg=#ff2222 ctermfg=1")
