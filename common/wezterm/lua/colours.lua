local common = require "common"

local M = {}

M.dark = {
   scrollbar_thumb = common.custom_dark_grey,

   ansi = {
      "black", -- Prompt symbols and highlights
      "#c70014", -- Prompt error indicator
      "green", -- Prompt git background (unmodified)
      "orange", -- Prompt git background (modified)
      "#006de0", -- Prompt directory background
      "red",
      "yellow", -- Git commit message text
      "yellow"
   },

   brights = {
      "#4b8a32", -- Command argument text
      "#c70014", -- Error text
      "#0f873b", -- Title and exit text
      "orange", -- Command text
      "yellow",
      "yellow",
      "yellow",
      "#e8e8e8", -- Prompt base directory text
   },

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

M.light = {
   scrollbar_thumb = common.custom_light_grey,
   foreground = "black",
   cursor_bg = "black",
   cursor_fg = "white",

   ansi = {
      "black", -- Prompt symbols and highlights
      "maroon", -- Prompt error indicator
      "green", -- Prompt git background (unmodified)
      "#8abd99", -- Prompt git background (modified)
      "#83a8cc", -- Prompt directory background
      "yellow",
      "yellow",
      "yellow"
   },

   brights = {
      "fuchsia", -- Command argument text
      "maroon", -- Error text
      "green", -- Title and exit text
      "blue", -- Command text
      "yellow",
      "yellow",
      "yellow",
      "black", -- Prompt base directory text
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

return M
