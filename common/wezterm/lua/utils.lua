local wezterm = require "wezterm"

local M = {}

M.gui_startup = function(cmd)
   local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
   window:gui_window():maximize()
end

M.format_tab_title = function(tab, tabs, panes, config, hover, max_width)
   local pane = tab.active_pane
   local process_name = string.gsub(pane.title, "(.*[/\\])(.*)", "%2")
   local title = " " .. tab.tab_index + 1 .. " " .. process_name .. " "
   return wezterm.truncate_right(title, max_width)
end

M.add_to_map = function(map, addition)
   for k, v in pairs(addition) do
      map[k] = v
   end
end

return M
