local lualine = require "lualine"
local utils = require "lib.utils"

if _G.colourscheme == utils.dark_theme then
   default_fg = "#ababab"
else
   default_fg = "#123456"
end

local sections = {
      lualine_a = {},
      lualine_b = {
         'branch',
         {
            'diff',
            colored = false
         },
         {
            'diagnostics',
            colored = false
         },
      },
      lualine_c = {},
      lualine_x = {
         'encoding',
         {
            'fileformat',
            symbols = {
               unix = 'LF',
               dos = 'CRLF',
               mac = 'LF',
            }
         },
         {
            'filetype',
            icons_enabled = false,
         }
      },
      lualine_y = {'progress'},
      lualine_z = {'location'},
}

local common_colours = {
   fg = default_fg,
   bg = nil
}

local common_section_format = {
   a = common_colours, b = common_colours, c = common_colours,
   x = common_colours, y = common_colours, z = common_colours,
}

local theme = {
   normal = common_section_format,
   visual = common_section_format,
   insert = common_section_format,
   replace = common_section_format,
   command = common_section_format,
   inactive = common_section_format,
}

lualine.setup {
   options = {
      theme = theme,
      disabled_filetypes = { "NvimTree" },
      section_separators = { left = "", right = "" },
      component_separators = { left = "", right = "" },
   },

   extensions = {
      "nvim-tree"
   },

   sections = sections,
   inactive_sections = sections,
}
