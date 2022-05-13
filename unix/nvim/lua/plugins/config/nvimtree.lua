local utils = require "lib.utils"
local map = utils.map

local nvimtree = require "nvim-tree"

local function single_click_edit(node)
   vim.cmd [[ execute "normal! \<LeftMouse>" ]]
   local lib = require'nvim-tree.lib'
   local node = lib.get_node_at_cursor()
   if not node then return end
   local actions = require "nvim-tree.actions"
   actions.on_keypress("edit")
end

map("n", "<leader>d", ":NvimTreeToggle<CR>")

nvimtree.setup {
      hijack_netrw = true,
      open_on_setup_file = true,
      view = {
         width = 50,
         height = 30,
         hide_root_folder = true,
         mappings = {
            list = {
               -- { key = "<LeftRelease>", action= "single_click_edit" },
            }
         }
   },
}

-- Automatically close nvimtree when it's the last window
-- vim.cmd [[ autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif ]]

-- vim.cmd [[ hi NvimTreeStatusLine guibg=nvim_treebg guifg=nvim_treebg ]]
-- vim.cmd [[ hi NvimTreeStatusLineNC guibg=nvim_treebg guifg=nvim_treebg ]]
vim.cmd [[ hi NvimTreeStatusLineNC ctermbg=black ctermfg=black ]]
vim.cmd [[ hi NvimTreeStatusLine ctermbg=black ctermfg=black ]]

vim.cmd [[ highlight NvimTreeVertSplit guibg=none guifg=#ebdbb2 ]]
vim.cmd [[ highlight NvimTreeVertSplit guibg=none ]]
