local wezterm = require "wezterm"
local utils = require "utils"
local config = require "config"

wezterm.on("ct_wezterm_tmux", utils.ct_wezterm_tmux)
wezterm.on("ct_wezterm_tmux_nvim", utils.ct_wezterm_tmux_nvim)
wezterm.on("format-tab-title", utils.format_tab_title)

if package.config:sub(1, 1) == '/' then
  return config.platform.unix.linux
else
  return config.platform.windows
end
