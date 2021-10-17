-- Lua based Neovim configuration
-- This configuration is my personal fork of https://github.com/NvChad/NvChad

-- Options and remaps are defined in lua/common.lua then bound in lua/core
-- Plugin configurations are in lua/plugins/config

-- Dependencies:
--   Node.js for language servers
--   ripgrep for fuzzy finding with telescope.nvim

-- Install:
--   nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

local ok, err = pcall(require, "core")
if not ok then
   error("Error loading Neovim configuration" .. "\n" .. err)
end
