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

return packer.startup(function()
   use { "wbthomason/packer.nvim" }
   use { "kyazdani42/nvim-web-devicons" }
   use { "Mofiqul/vscode.nvim" }
   use { "morhetz/gruvbox" }
   use { "nvim-lua/plenary.nvim" }
   use { "hrsh7th/cmp-nvim-lsp" }
   use { "hrsh7th/cmp-buffer" }
   use { "hrsh7th/cmp-path" }
   use { "hrsh7th/cmp-cmdline" }
   use { "hrsh7th/nvim-cmp" }

   use {
      "lukas-reineke/virt-column.nvim",
      config = function()
         require("virt-column").setup {}
      end
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
      "airblade/vim-gitgutter",
      config = function()
         require "plugins.config.gitgutter"
      end
   }

   use {
      "liuchengxu/vim-clap",
      config = function()
         require "plugins.config.clap"
      end
   }

   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
         require "plugins.config.treesitter"
      end
   }

   use {
      "neovim/nvim-lspconfig",
      config = function()
         require "plugins.config.lspconfig"
      end
   }

   use {
      "williamboman/nvim-lsp-installer",
      config = function()
         require "plugins.config.lspinstaller"
      end
   }

   if packer_bootstrap then
      require("packer").sync()
   end
end)
