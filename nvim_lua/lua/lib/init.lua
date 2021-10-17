local M = {}

-- Edit user config file, based on the assumption it exists in the config as
-- theme = "theme name"
-- 1st arg as current theme, 2nd as new theme
M.change_theme = require "lib.change_theme"

-- Clear command line from lua
M.clear_cmdline = function()
   vim.defer_fn(function()
      vim.cmd "echo"
   end, 0)
end

-- Wrapper to use vim.api.nvim_echo
-- Table of {string, highlight}, e.g echo({{"Hello", "Title"}, {"World"}})
M.echo = function(opts)
   if opts == nil or type(opts) ~= "table" then
      return
   end
   vim.api.nvim_echo(opts, false, {})
end

-- 1st arg - r or w
-- 2nd arg - file path
-- 3rd arg - content if 1st arg is w
-- Return file data on read, nothing on write
M.file = function(mode, filepath, content)
   local data
   local fd = assert(vim.loop.fs_open(filepath, mode, 438))
   local stat = assert(vim.loop.fs_fstat(fd))
   if stat.type ~= "file" then
      data = false
   else
      if mode == "r" then
         data = assert(vim.loop.fs_read(fd, stat.size, 0))
      else
         assert(vim.loop.fs_write(fd, content, 0))
         data = true
      end
   end
   assert(vim.loop.fs_close(fd))

   return data
end

-- Return a table of available themes
M.list_themes = function(return_type)
   local themes = {}

   -- Folder where theme files are stored
   local themes_folder = vim.fn.stdpath "config" .. "/lua/colors/themes"

   -- List all the contents of the folder and filter out files with .lua extension, then append to themes table
   local fd = vim.loop.fs_scandir(themes_folder)
   if fd then
      while true do
         local name, typ = vim.loop.fs_scandir_next(fd)
         if name == nil then
            break
         end
         if typ ~= "directory" and string.find(name, ".lua$") then
            -- Return the table values as keys if specified
            if return_type == "keys_as_value" then
               themes[vim.fn.fnamemodify(name, ":r")] = true
            else
               table.insert(themes, vim.fn.fnamemodify(name, ":r"))
            end
         end
      end
   end

   return themes
end

-- Reload configuration without exiting
M.reload_config = require "lib.reload_config"

-- Reload a plugin (will try to reload even if not loaded)
-- Can take a string or list (table)
-- Returns true or false
M.reload_plugin = function(plugins)
   local status = true
   local function _reload_plugin(plugin)
      local loaded = package.loaded[plugin]
      if loaded then
         package.loaded[plugin] = nil
      end
      local ok, err = pcall(require, plugin)
      if not ok then
         print("Error: Cannot load " .. plugin .. " plugin!\n" .. err .. "\n")
         status = false
      end
   end

   if type(plugins) == "string" then
      _reload_plugin(plugins)
   elseif type(plugins) == "table" then
      for _, plugin in ipairs(plugins) do
         _reload_plugin(plugin)
      end
   end
   return status
end

-- Reload themes without restarting vim
M.reload_theme = require "lib.reload_theme"

-- Toggle between 2 themes
M.toggle_theme = require "lib.toggle_theme"

return M
