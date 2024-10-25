local wezterm = require "wezterm"
local utils = require "utils"
local config = require "config"

wezterm.on("format-tab-title", utils.format_tab_title)
wezterm.on('gui-startup', utils.gui_startup)

if package.config:sub(1, 1) == '/' then
   return config.platform.linux
else
   return config.platform.windows
end
