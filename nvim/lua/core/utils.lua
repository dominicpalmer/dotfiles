-- lua/utils.lua
-- Helper methods for core configuration

local M = {}

-- Loads configuration
M.load_config = function(reload)
   if _G._CONFIG_CONTENTS ~= nil and not (reload or false) then
      return _G._CONFIG_CONTENTS
   end

   -- Unload loaded modules if a force reload is requested
   local config_name = "common"
   if reload then
      package.loaded[config_name or false] = nil
   end

   _G._CONFIG_CONTENTS = require(config_name)

   return _G._CONFIG_CONTENTS
end

-- Neovim remap wrapper
M.map = function(mode, keys, cmd, opt)
   -- Default to using non-recursive mapping unless otherwise specified
   local options = { noremap = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   local valid_modes = {
      [""] = true,
      ["n"] = true,
      ["v"] = true,
      ["s"] = true,
      ["x"] = true,
      ["o"] = true,
      ["!"] = true,
      ["i"] = true,
      ["l"] = true,
      ["c"] = true,
      ["t"] = true,
   }

   local function map_wrapper(mode, lhs, rhs, options)
      if type(lhs) == "table" then
         for _, key in ipairs(lhs) do
            map_wrapper(mode, key, rhs, options)
         end
      else
         if type(mode) == "table" then
            for _, m in ipairs(mode) do
               map_wrapper(m, lhs, rhs, options)
            end
         else
            if valid_modes[mode] and lhs and rhs then
               vim.api.nvim_set_keymap(mode, lhs, rhs, options)
            else
               mode, lhs, rhs = mode or "", lhs or "", rhs or ""
               print("Cannot set mapping [ mode = '" .. mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
            end
         end
      end
   end

   map_wrapper(mode, keys, cmd, options)
end

-- Plugin lazy loader
M.packer_lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, timer)
   end
end

-- Hides or shows the statusline for certain windows
M.hide_statusline = function()
   local shown = require("core.utils").load_config().ui.plugin.statusline.shown
   local hidden = require("core.utils").load_config().ui.plugin.statusline.hidden
   local api = vim.api
   local buftype = api.nvim_buf_get_option("%", "ft")

   -- Prioritise the shown list over the hidden list
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

return M
