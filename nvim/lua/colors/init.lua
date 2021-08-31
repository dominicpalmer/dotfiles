local M = {}

-- Loads the requested theme, or defaults to that defined in common.ui.theme
M.init = function(theme)
   if not theme then
      theme = require("core.utils").load_config().ui.theme
   end

   -- Set the global theme
   vim.g.theme = theme

   local present, base16 = pcall(require, "base16")

   if present then
      -- First load the base16 theme
      base16(base16.themes(theme), true)

      -- Unload to force reload
      package.loaded["colors.highlights" or false] = nil

      -- Then load the highlights
      require "colors.highlights"
   else
      return false
   end
end

-- Returns a table of colors for the requested theme
M.get = function(theme)
   if not theme then
      theme = vim.g.theme
   end

   return require("colors.themes." .. theme)
end

return M
