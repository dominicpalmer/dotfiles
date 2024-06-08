local utils = require "lib.utils"

if _G.colourscheme == utils.dark_theme then
   vert_split_bg = utils.dark_theme_vsplit_bg
else
   vert_split_bg = utils.light_theme_vsplit_bg
end

-- Italic comments
vim.cmd("autocmd VimEnter,ColorScheme * hi Comment gui=italic")

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
vim.cmd("set fillchars+=vert:│")
vim.cmd("autocmd VimEnter,ColorScheme * hi WinSeparator guibg=None guifg=" .. vert_split_bg)
vim.cmd("autocmd VimEnter,ColorScheme * hi cursorlinenr guibg=None")
