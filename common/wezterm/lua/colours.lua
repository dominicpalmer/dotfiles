local common = require "common"

local M = {}

M.light = {
   foreground = "black",
   cursor_bg = "black",
   cursor_fg = "white",
   scrollbar_thumb = common.custom_light_grey,

   ansi = {
      "black", -- Prompt highlights
      "maroon", -- Prompt error indicator
      "fuchsia",
      "#8abd99", -- Prompt git directory background
      "#83a8cc", -- Prompt base directory background
      "yellow",
      "purple",
      "aqua"
   },

   brights = {
      "fuchsia",
      "maroon", -- Error text
      "green", -- Title and exit text
      "blue", -- Command text
      "yellow",
      "purple",
      "aqua",
      "black", -- Prompt text
   },

   tab_bar = {
      background = common.custom_white,
      active_tab = {
         bg_color = common.custom_tab_green,
         fg_color = common.custom_off_white,
      },
      inactive_tab = {
         bg_color = common.custom_dark_grey,
         fg_color = common.custom_off_white,
      },
      new_tab = {
         bg_color = common.custom_white,
         fg_color = common.custom_white,
      },
   }
}

M.dark = {
   scrollbar_thumb = common.custom_light_grey,

   tab_bar = {
      background = common.custom_black,
      active_tab = {
         bg_color = common.custom_tab_green,
         fg_color = common.custom_off_white,
      },
      inactive_tab = {
         bg_color = common.custom_dark_grey,
         fg_color = common.custom_off_white,
      },
      new_tab = {
         bg_color = common.custom_black,
         fg_color = common.custom_black,
      }
   }
}

return M
