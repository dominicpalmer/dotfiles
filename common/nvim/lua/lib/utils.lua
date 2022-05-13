local M = {}

M.light_theme = "vscode"
M.dark_theme = "gruvbox"

M.map = function(mode, lhs, rhs, opt)
   local options = { noremap = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end
   vim.keymap.set(mode, lhs, rhs, opt)
end

M.hide_statusline = function()
   local shown = {}
   local hidden = {}
   local api = vim.api
   local buftype = api.nvim_buf_get_option(0, "ft")

   if vim.tbl_contains(shown, buftype) then
      api.nvim_set_option("laststatus", 2)
      return
   end

   if vim.tbl_contains(hidden, buftype) then
      api.nvim_set_option("laststatus", 0)
      return
   else
      api.nvim_set_option("laststatus", 2)
   end
end

M.change_theme = function()
   -- Open the style module init file
   local file = vim.fn.stdpath "config" .. "/lua/style/init.lua"
   local fdr = assert(vim.loop.fs_open(file, "r", 438))
   local stat = assert(vim.loop.fs_fstat(fdr))
   local data = assert(vim.loop.fs_read(fdr, stat.size, 0))

   -- Change the theme
   if _G.colourscheme == M.dark_theme then
      current_theme = M.dark_theme
      _G.colourscheme = M.light_theme
   else
      current_theme = M.light_theme
      _G.colourscheme = M.dark_theme
   end

   local find = "colourscheme = .?" .. current_theme .. ".?"
   local replace = 'colourscheme = "' .. _G.colourscheme .. '"'
   local content = string.gsub(data, find, replace)

   -- Write the new theme to the file
   local fdw = assert(vim.loop.fs_open(file, "w", 438))
   local stat = assert(vim.loop.fs_fstat(fdw))
   assert(vim.loop.fs_write(fdw, content, 0))
   assert(vim.loop.fs_close(fdw))

   require("lib.reload").reload()
end

return M
