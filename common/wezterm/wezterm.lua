local wezterm = require "wezterm"
local utils = require "utils"
local config = require "config"

wezterm.on("format-tab-title", utils.format_tab_title)
wezterm.on("ct_wezterm", utils.platform.windows.ct_wezterm)
wezterm.on("ct_wezterm_tmux", utils.platform.unix.ct_wezterm_tmux)
wezterm.on("ct_wezterm_tmux_nvim", utils.platform.unix.ct_wezterm_tmux_nvim)
wezterm.on('gui-startup', utils.gui_startup)

if package.config:sub(1, 1) == '/' then
   return config.platform.unix.linux
else
   return config.platform.windows
end
