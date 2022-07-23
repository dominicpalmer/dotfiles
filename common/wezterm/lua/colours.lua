local common = require "common"

local M = {}

local gb_red = "#cc241d"
local gb_green_1 = "#98971a"
local gb_green_2 = "#b8bb26"
local gb_yellow = "#fabd2f"
local gb_purple = "#d3869b"
local gb_blue_1 = "#458588"
local gb_blue_2 = "#83a598"
local gb_offwhite = "#fbf1c7"

M.dark = {
   scrollbar_thumb = common.custom_dark_grey,

   ansi = {
      "black", -- Prompt symbols and highlights
      gb_red, -- Prompt error indicator
      gb_green_1, -- Prompt git background, unmodified
      gb_yellow, -- Prompt git background, modified
      gb_blue_1, -- Prompt directory background
      gb_purple, -- Prompt git background, unpushed changes
      gb_green_2, -- Git commit message text
      "yellow",
   },

   brights = {
      gb_purple, -- Command argument text
      gb_red, -- Error text
      gb_green_1, -- Title and exit text
      gb_yellow, -- Command text
      "yellow",
      "yellow",
      "yellow",
      gb_offwhite, -- Prompt base directory text
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
      "#8abd99", -- Prompt git background, unmodified
      gb_yellow, -- Prompt git background, modified
      gb_blue_2, -- Prompt directory background
      gb_purple, -- Prompt git background, unpushed changes
      "green", -- Git commit message text
      "yellow",
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
