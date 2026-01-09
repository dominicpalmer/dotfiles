local wezterm = require "wezterm"

local M = {}

M.gui_startup = function(cmd)
   local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
   window:gui_window():maximize()
end

M.format_tab_title = function(tab, tabs, panes, config, hover, max_width)
   local pane = tab.active_pane
   local process_name = string.gsub(pane.title or "", "(.*[/\\])(.*)", "%2")
   local idx = tab.tab_index + 1
   local title_name = process_name

   -- If the active pane isn't the Claude pane (e.g. splits), look through all panes
   -- in the tab and prefer the pane running 'claude' for the cwd/title.
   local claude_pane = nil
   if process_name == "claude" then
      claude_pane = pane
   else
      for _, p in ipairs(tab.panes) do
         local pn = string.gsub(p.title or "", "(.*[/\\])(.*)", "%2")
         if pn == "claude" then
            claude_pane = p
            break
         end
      end
   end

   if claude_pane ~= nil then
      local cwd_raw = claude_pane.current_working_dir
      local cwd = ""
      if cwd_raw ~= nil then
         cwd = tostring(cwd_raw):gsub("^file://", "")
         cwd = cwd:gsub("[/\\]+$", "")
         local bn = string.match(cwd, "[^/\\]+$")
         if bn ~= nil and bn ~= "" then
            title_name = bn
         else
            title_name = process_name
         end
      end
   end

   local title = tostring(idx) .. " " .. title_name

   return wezterm.truncate_right(title, max_width)
end

M.add_to_map = function(map, addition)
   for k, v in pairs(addition) do
      map[k] = v
   end
end

return M
