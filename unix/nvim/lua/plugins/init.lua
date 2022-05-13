local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
packer_bootstrap = fn.system({
   "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
   install_path
})
end

local present, packer = pcall(require, "packer")
local use = packer.use

return require("packer").startup(function()
   use {
      "wbthomason/packer.nvim",
   }

   use {
      "kyazdani42/nvim-web-devicons",
   }

   use {
      "akinsho/bufferline.nvim",
      tag = "*",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require "plugins.config.bufferline"
      end
   }

   use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require "plugins.config.nvimtree"
      end
   }

   use {
      "nvim-lualine/lualine.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require "plugins.config.lualine"
      end
   }

   use {
      "nvim-lua/plenary.nvim",
   }

   use {
      "Mofiqul/vscode.nvim",
   }

   use {
      "morhetz/gruvbox",
   }

   if packer_bootstrap then
      require("packer").sync()
   end
end)
