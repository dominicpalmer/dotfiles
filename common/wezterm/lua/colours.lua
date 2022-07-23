local common = require "common"

local M = {}

local gb_red = "#cc241d"
local gb_green = "#98971a"
local gb_yellow = "#fabd2f"
local gb_purple = "#d3869b"
local gb_blue = "#458588"
local gb_offwhite_1 = "#fbf1c7"

M.dark = {
   scrollbar_thumb = common.custom_dark_grey,

   ansi = {
      "black", -- Prompt symbols and highlights (black)
      gb_red, -- Prompt error indicator (red)
      gb_green, -- Prompt git background, unmodified (green)
      gb_yellow, -- Prompt git background, modified (yellow)
      gb_blue, -- Prompt directory background (blue)
      gb_purple, -- Prompt git background, unpushed changes (purple)
      "yellow", -- Git commit message text (yellow)
      "yellow",
   },

   brights = {
      gb_purple, -- Command argument text
      gb_red, -- Error text (red)
      gb_green, -- Title and exit text (green)
      gb_yellow, -- Command text (yellow)
      "yellow",
      "yellow",
      "yellow",
      gb_offwhite_1, -- Prompt base directory text (white)
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
