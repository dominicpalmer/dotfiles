local nvimtree = require "nvim-tree"
local utils = require "lib.utils"
local map = utils.map

map("n", "<leader>d", ":NvimTreeToggle<CR>")

if _G.colourscheme == utils.dark_theme then
   vert_split_bg = utils.dark_theme_vsplit_bg
else
   vert_split_bg = utils.light_theme_vsplit_bg
end

local function single_click_edit(node)
   vim.cmd [[ execute "normal! \<LeftMouse>" ]]
   local lib = require'nvim-tree.lib'
   local node = lib.get_node_at_cursor()
   if not node then return end
   local actions = require "nvim-tree.actions"
   actions.on_keypress("edit")
end

nvimtree.setup {
      hijack_netrw = true,
      open_on_setup_file = true,
      view = {
         width = 50,
         height = 30,
         hide_root_folder = true,
         mappings = {
            list = {
               { key = "<LeftRelease>", action= "single_click_edit" },
            }
         }
   },
}

-- Transparency
vim.cmd("autocmd VimEnter,ColorScheme * hi NvimTreeNormal guibg=None guifg=None")
vim.cmd("autocmd VimEnter,ColorScheme * hi NvimTreeVertSplit guibg=None guifg=" .. vert_split_bg)

-- guifg must differ between the two, so that the statusline doesn't display carets
vim.cmd("autocmd VimEnter,ColorScheme * hi NvimTreeStatusLine guibg=None guifg=Grey")
vim.cmd("autocmd VimEnter,ColorScheme * hi NvimTreeStatusLineNC guibg=None guifg=None")

-- Automatically close nvimtree when it's the last window
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
