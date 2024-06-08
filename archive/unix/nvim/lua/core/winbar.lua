local utils = require("lib.utils")

vim.cmd("autocmd VimEnter,ColorScheme * hi WinBarActive guibg=#ffffff guifg=#000000")
vim.cmd("autocmd VimEnter,ColorScheme * hi WinBarInactive guibg=#000000 guifg=#ffffff")

vim.api.nvim_create_autocmd({
   'BufEnter',
   'CursorMoved',
   'BufWinEnter',
   'WinEnter',
   'BufFilePost',
   'InsertEnter',
   'BufWritePost',
   'FocusLost',
   }, {
      callback = utils.get_winbar(true)
   }
)

vim.api.nvim_create_autocmd({
      'WinLeave'
   }, {
      callback = utils.get_winbar(false, "NvimTree")
   }
)
