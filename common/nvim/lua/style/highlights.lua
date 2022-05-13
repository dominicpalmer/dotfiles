-- Italic comments
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi Comment gui=italic ]]

-- Transparency
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi Normal guibg=None ]]
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi Normal guibg=None ]]
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi SignColumn guibg=None ]]
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi LineNr guibg=None ]]
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi WinSeparator guifg=None ]]
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi WinSeparator guibg=None ]]

-- Thin line window separators
vim.cmd [[ autocmd VimEnter,ColorScheme * :set fillchars+=vert:│ ]]
vim.cmd [[ autocmd VimEnter,ColorScheme * :hi cursorlinenr guibg=None ]]
