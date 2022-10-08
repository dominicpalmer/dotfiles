local wezterm = require "wezterm"
local common = require "common"
local theme = require "theme"
local utils = require "utils"
local keys = require "keys"

local M = {}

local shared = {
   all = {
      font = wezterm.font("UbuntuMono Nerd Font"),
      font_size = 11,

      window_padding = {left = 2, right = 0, top = 2, bottom = 0},
      window_close_confirmation = "NeverPrompt",
      initial_cols = 220,
      initial_rows = 65,

      window_background_image = theme.default_bg_img,
      window_background_image_hsb = theme.default_bg_hsb,

      automatically_reload_config = true,
      audible_bell = "Disabled",
      check_for_updates = false,
   },

   unix = {
      leader = {key=".", mods="CTRL"},
      keys = keys.platform.unix,
      enable_tab_bar = false,

      -- Use builtin colour schemes when on unix, and no custom defined colours
      color_scheme = theme.default_theme,
   },
}

M.platform = {
   windows = {
      default_prog = {"pwsh", "-NoLogo"},

      leader = {key="n", mods="CTRL"},
      keys = keys.platform.windows,
      enable_tab_bar = true,

      -- Use custom defined colors when on Windows, and no builtin color schemes
      colors = theme.default_colours,

      enable_scroll_bar = true,
      use_fancy_tab_bar = false,
      tab_bar_at_bottom = true,
      tab_max_width = 50,
      window_frame = {
         font = wezterm.font("UbuntuMono Nerd Font"),
         font_size = 11.0,
         active_titlebar_bg = common.custom_white,
         inactive_titlebar_bg = common.custom_white,
      },
   },

   unix = {
      wsl = {
         default_prog = {"bash.exe", "-c", "tmux attach -t tmux || tmux new-session -s tmux -c ~"},

         enable_scroll_bar = false,
      },

      linux = {
         default_prog = {"tmux attach -t tmux || tmux new-session -s tmux -c ~"},

         enable_scroll_bar = false,
      },
   }
}

local all_platform_maps = {M.platform.windows, M.platform.unix.wsl, M.platform.unix.linux}
for _, map in ipairs(all_platform_maps) do
   utils.add_to_map(map, shared.all)
end

local unix_platform_maps = {M.platform.unix.wsl, M.platform.unix.linux}
for _, map in ipairs(unix_platform_maps) do
   utils.add_to_map(map, shared.unix)
end

return M
