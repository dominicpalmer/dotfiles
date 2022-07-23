local wezterm = require "wezterm"
local theme = require "theme"

local M = {}

M.ct_wezterm = function(window, pane)
   local overrides = window:get_config_overrides() or {}

   if next(overrides) then
      overrides = {}
   else
      overrides.color_scheme = theme.alternate_theme
      overrides.colors = theme.alternate_colours
      overrides.window_background_image = theme.alternate_bg_img
      overrides.window_background_image_hsb = theme.alternate_bg_hsb
   end

   window:set_config_overrides(overrides)
end

M.ct_tmux = function(window, pane)
   os.execute("bash -c ~/tmux_change_theme.sh")
end

M.ct_nvim = function(window, pane)
   window:perform_action(wezterm.action{SendKey={key="t", mods="CTRL"}}, pane)
end

M.ct_wezterm_tmux = function(window, pane)
   M.ct_wezterm(window, pane)
   M.ct_tmux(window, pane)
end

M.ct_wezterm_tmux_nvim = function(window, pane)
   M.ct_wezterm(window, pane)
   M.ct_tmux(window, pane)
   M.ct_nvim(window, pane)
end

M.format_tab_title = function(tab, tabs, panes, config, hover, max_width)
   local pane = tab.active_pane
   local process_name = string.gsub(pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
   local title = pane.pane_id + 1 .. " " .. process_name
   return {{Text = " " .. title .. " "}}
end

M.add_to_map = function(map, addition)
   for k, v in pairs(addition) do
      map[k] = v
   end
end

return M