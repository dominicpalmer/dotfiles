-- Reload themes without restarting vim
-- If no theme name is given then reload the current theme
local function reload_theme(theme_name)
   local reload_plugin = require("lib").reload_plugin

   -- If theme name is empty or nil, then reload the current theme
   if theme_name == nil or theme_name == "" then
      theme_name = vim.g.theme
   end

   if not pcall(require, "colors.themes." .. theme_name) then
      print("No such theme ( " .. theme_name .. " )")
      return false
   end

   vim.g.theme = theme_name

   -- Reload the base16 theme and highlights
   require("colors").init(theme_name)

   if not reload_plugin {
      "plugins.config.bufferline",
      "plugins.config.statusline",
   } then
      print "Error: Not able to reload all plugins."
      return false
   end

   return true
end

return reload_theme
