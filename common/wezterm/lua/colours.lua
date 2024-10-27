local M = {}

local jet_black = "#000000"
local off_white = "#f5e9ce"
local active_tab_green = "#1c5e00"
local inactive_tab_grey = "#292929"
local scrollbar_grey = "#525252"
local prompt_directory_blue = "#386f73"
local git_and_title_and_exit_green = "#98971a"
local git_commit_green = "#b8bb26"
local error_red = "#cc241d"
local command_text_yellow = "#fabd2f"
local command_arg_yellow = "yellow"
local command_flag_purple = "#d3869b"
local off_white = "#fbf1c7"
local unknown_pink = "#ff0099"

M.scheme = {
   scrollbar_thumb = scrollbar_grey,
   foreground = off_white,

   ansi = {
      jet_black, -- Prompt symbols and highlights
      error_red, -- Prompt error indicator
      git_and_title_and_exit_green, -- Prompt git background, unmodified
      command_text_yellow, -- Prompt git background, modified
      prompt_directory_blue, -- Prompt directory background
      command_flag_purple, -- Prompt git background, unpushed changes
      git_commit_green, -- Git commit message text
      command_arg_yellow, -- Command argument text
   },

   brights = {
      command_flag_purple, -- Command flag text
      error_red, -- Error text
      git_and_title_and_exit_green, -- Title and exit text
      command_text_yellow, -- Command text
      unknown_pink,
      unknown_pink,
      unknown_pink,
      off_white, -- Prompt base directory text
   },

   tab_bar = {
      background = "rgba(0,0,0,0)",
      active_tab = {
         bg_color = active_tab_green,
         fg_color = off_white,
      },
      inactive_tab = {
         bg_color = inactive_tab_grey,
         fg_color = off_white,
      },
      new_tab = {
         bg_color = jet_black,
         fg_color = jet_black,
      },
      new_tab_hover = {
         bg_color = jet_black,
         fg_color = off_white,
         italic = false,
       },
   }
}

return M
