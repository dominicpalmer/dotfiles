local bufferline = require "bufferline"
local utils = require "lib.utils"
local map = utils.map

map("n", "<leader>p", ":BufferLineTogglePin<CR>")
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
map("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
map("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
map("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
map("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
map("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")
map("n", "<leader><Tab>", ":BufferLineCycleNext<CR>")
map("n", "<leader><S-Tab>", ":BufferLineCyclePrev<CR>")

if _G.colourscheme == utils.dark_theme then
   bg = { gui = "bold", guibg = "Grey" }
   fg = { gui = "bold", guifg = "Grey"  }
   modified_selected = { gui = "bold", guifg = "LightGreen", guibg = "Grey" }
   modified = { gui = "bold", guifg = "Green"  }
else
   bg = { gui = "bold", guifg = "White", guibg = "Green" }
   fg = { gui = "bold", guifg = "White" }
   modified_selected = { gui = "bold", guifg = "White", guibg = "Green" }
   modified = { gui = "bold", guifg = "Green" }
end

bufferline.setup {
   options = {
      mode = "buffers",
      themable = true,
      numbers = "ordinal",
      numbers = function(opts)
         return string.format("%s", opts.ordinal)
      end,

      left_mouse_command = "buffer %d",
      right_mouse_command = nil,
      close_command = "bdelete! %d",
      middle_mouse_command = "bdelete! %d",

      indicator_icon = ' ',
      buffer_close_icon = 'x',
      modified_icon = '●',
      close_icon = 'x',
      left_trunc_marker = '|',
      right_trunc_marker = '-',

      max_name_length = 16,
      max_prefix_length = 13,
      tab_size = 18,

      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
         return "("..count..")"
      end,
      -- offsets = {{ filetype = "NvimTree", text = "", text_align = "left" }},

      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,

      show_tab_indicators = true,
      persist_buffer_sort = true,
      separator_style = { "|", "|" },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      sort_by = 'insert_at_end',

      groups = {
         items = {
            require('bufferline.groups').builtin.pinned:with({ icon = "" }),
         }
      }
   },

   highlights = {
      buffer_selected = bg,
      indicator_selected = bg,
      close_button_selected = bg,
      numbers_selected = bg,
      modified_selected = modified_selected,

      modified = modified,
      modified_visible = modified,
   }
}
