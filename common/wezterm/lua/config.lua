local wezterm = require "wezterm"
local colours = require "colours"
local utils = require "utils"
local keys = require "keys"

local M = {}

local shared = {
   font = wezterm.font("Cascadia Code"),
   font_size = 10,

   -- When scrollbar is enabled, 'right' defines its width
   window_padding = {left = 2, right = '2cell', top = 2, bottom = 0},
   window_close_confirmation = "NeverPrompt",
   initial_cols = 220,
   initial_rows = 65,

   window_background_opacity = 0.91,

   automatically_reload_config = true,
   audible_bell = "Disabled",
   check_for_updates = false,
}

M.platform = {
   windows = {
      default_prog = {"pwsh.exe", "-NoLogo"},

      -- No tmux on Windows, so can use <C-n> directly
      leader = {key="n", mods="CTRL"},
      keys = keys.platform.windows,
      enable_tab_bar = true,

      -- Use custom colors on Windows, instead of a builtin colour scheme
      colors = colours.scheme,

      enable_scroll_bar = true,
      use_fancy_tab_bar = false,
      tab_bar_at_bottom = true,
      tab_max_width = 50,
      window_frame = {
         font = wezterm.font("Cascadia Code"),
         font_size = 11.0,
         active_titlebar_bg = colours.white,
         inactive_titlebar_bg = colours.white,
      },

      -- Set to true when targeting a VDI
      -- prefer_egl = true
   },

   linux = {
      default_prog = {"tmux attach -t tmux || tmux new-session -s tmux -c ~"},

      -- <C-n> is reserved by tmux
      leader = {key=".", mods="CTRL"},
      keys = keys.platform.linux,
      enable_tab_bar = false,
      enable_scroll_bar = false,

      -- Use a builtin colour scheme on Linux
      color_scheme = "Gruvbox Dark",
   },
}

local all_platform_maps = {M.platform.windows, M.platform.linux}
for _, map in ipairs(all_platform_maps) do
   utils.add_to_map(map, shared)
end

return M
