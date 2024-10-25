local M = {}

M.black = "#000000"
M.white = "#e6e6e6"
M.off_white = "#f5e9ce"
M.dark_grey = "#292929"
M.light_grey = "#cfcfcf"
M.tab_green = "#1c5e00"

local red = "#cc241d"
local green_1 = "#98971a"
local green_2 = "#b8bb26"
local yellow = "#fabd2f"
local purple = "#d3869b"
local blue_1 = "#386f73"
local blue_2 = "#83a598"
local offwhite = "#fbf1c7"
local scrollbar_grey = "#525252"

M.scheme = {
   scrollbar_thumb = scrollbar_grey,
   foreground = offwhite,

   ansi = {
      "black", -- Prompt symbols and highlights
      red, -- Prompt error indicator
      green_1, -- Prompt git background, unmodified
      yellow, -- Prompt git background, modified
      blue_1, -- Prompt directory background
      purple, -- Prompt git background, unpushed changes
      green_2, -- Git commit message text
      "yellow",
   },

   brights = {
      purple, -- Command argument text
      red, -- Error text
      green_1, -- Title and exit text
      yellow, -- Command text
      "yellow",
      "yellow",
      "yellow",
      offwhite, -- Prompt base directory text
   },

   tab_bar = {
      active_tab = {
         bg_color = M.tab_green,
         fg_color = M.off_white,
      },
      inactive_tab = {
         bg_color = M.dark_grey,
         fg_color = M.off_white,
      },
      new_tab = {
         bg_color = M.black,
         fg_color = M.black,
      },
      background = "rgba(0,0,0,0)",
      new_tab_hover = {
         bg_color = '#000000',
         fg_color = offwhite,
         italic = false,
       },
   }
}

return M
