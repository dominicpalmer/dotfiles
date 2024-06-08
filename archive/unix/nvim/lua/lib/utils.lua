local M = {}

M.light_theme = "vscode"
M.dark_theme = "gruvbox"

M.dark_theme_vsplit_bg = "#303030"
M.light_theme_vsplit_bg = "#a1a1a1"

M.map = function(mode, lhs, rhs, opt)
   local options = { noremap = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end
   vim.keymap.set(mode, lhs, rhs, opt)
end

M.change_theme = function()
   -- Open the style module init file
   local file = vim.fn.stdpath "config" .. "/lua/style/init.lua"
   local fdr = assert(vim.loop.fs_open(file, "r", 438))
   local stat = assert(vim.loop.fs_fstat(fdr))
   local data = assert(vim.loop.fs_read(fdr, stat.size, 0))

   -- Change the theme
   if _G.colourscheme == M.dark_theme then
      new_background = "light"
      new_theme = M.light_theme
   else
      new_background = "dark"
      new_theme = M.dark_theme
   end

   local find = "background = .?" .. vim.o.background .. ".?"
   local replace = 'background = "' .. new_background .. '"'
   local updated_bg = string.gsub(data, find, replace)

   local find = "colourscheme = .?" .. _G.colourscheme .. ".?"
   local replace = 'colourscheme = "' .. new_theme .. '"'
   local updated_theme = string.gsub(updated_bg, find, replace)

   -- Write the new theme to the file
   local fdw = assert(vim.loop.fs_open(file, "w", 438))
   local stat = assert(vim.loop.fs_fstat(fdw))
   assert(vim.loop.fs_write(fdw, updated_theme, 0))
   assert(vim.loop.fs_close(fdw))

   require("lib.reload").reload()
end

local winbar_filetype_exclude = {
   '',
   'NvimTree',
   'TelescopePrompt',
   'fzf',
   'help',
   'neoterm',
   'packer',
}

M.get_winbar = function(focused, old_buf)
   return function()
      if not focused and vim.bo.filetype == "NvimTree" and old_buf ~= "NvimTree" then
         pcall(vim.api.nvim_set_option_value, 'winbar', '%#WinBarActive# %f %m%*', { scope = 'local' })
         return
      end

      if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
         vim.opt_local.winbar = ''
      else
         if focused then
            pcall(vim.api.nvim_set_option_value, 'winbar', '%#WinBarActive# %f %m%*', { scope = 'local' })
         else
            pcall(vim.api.nvim_set_option_value, 'winbar', '%#WinBarInactive# %f %m%*', { scope = 'local' })
         end
      end
   end
end

return M
