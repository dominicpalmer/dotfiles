local present, packer = pcall(require, "plugins.packerInit")
if not present then
   return false
end

local use = packer.use

-- Plugins are ordered according to startup time
return packer.startup(function()
   local plugin_status = require("core.utils").load_config().plugin_status

   use {
      "nvim-lua/plenary.nvim",
   }

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   use {
      "NvChad/nvim-base16.lua",
      after = "packer.nvim",
      config = function()
         require("colors").init()
      end,
   }

   use {
      "kyazdani42/nvim-web-devicons",
      after = "nvim-base16.lua",
      config = function()
         require "plugins.config.icons"
      end,
   }

   use {
      "famiu/feline.nvim",
      disable = not plugin_status.feline,
      after = "nvim-web-devicons",
      config = function()
         require "plugins.config.statusline"
      end,
   }

   use {
      "akinsho/bufferline.nvim",
      disable = not plugin_status.bufferline,
      after = "nvim-web-devicons",
      config = function()
         require "plugins.config.bufferline"
      end,
      setup = function()
         require("core.remaps").bufferline()
      end,
   }

   use {
      "lukas-reineke/indent-blankline.nvim",
      disable = not plugin_status.blankline,
      event = "BufRead",
      config = function()
         require("plugins.config.others").blankline()
      end,
   }

   use {
      "norcalli/nvim-colorizer.lua",
      disable = not plugin_status.colorizer,
      event = "BufRead",
      config = function()
         require("plugins.config.others").colorizer()
      end,
   }

   use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
         require "plugins.config.treesitter"
      end,
   }

   -- Git sign integration
   use {
      "lewis6991/gitsigns.nvim",
      disable = not plugin_status.gitsigns,
      opt = true,
      config = function()
         require "plugins.config.gitsigns"
      end,
      setup = function()
         require("core.utils").packer_lazy_load "gitsigns.nvim"
      end,
   }

   -- Smooth scrolling
   use {
      "karb94/neoscroll.nvim",
      disable = not plugin_status.neoscroll,
      opt = true,
      config = function()
         require("plugins.config.others").neoscroll()
      end,
      setup = function()
         require("core.utils").packer_lazy_load "neoscroll.nvim"
      end,
   }

   -- LSP integration
   use {
      "kabouzeid/nvim-lspinstall",
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "nvim-lspinstall"

         -- Reload the current file so that lsp initialises
         vim.defer_fn(function()
            vim.cmd "silent! e %"
         end, 0)
      end,
   }

   use {
      "neovim/nvim-lspconfig",
      after = "nvim-lspinstall",
      config = function()
         require "plugins.config.lspconfig"
      end,
   }

   use {
      "ray-x/lsp_signature.nvim",
      disable = not plugin_status.lspsignature,
      after = "nvim-lspconfig",
      config = function()
         require("plugins.config.others").signature()
      end,
   }

   use {
      "andymass/vim-matchup",
      disable = not plugin_status.vim_matchup,
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "vim-matchup"
      end,
   }

   -- Load cmp and luasnip functionality in insert mode only
   use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
         require "plugins.config.cmp"
      end,
   }

   use {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("plugins.config.others").luasnip()
      end,
   }

   use {
      "saadparwaiz1/cmp_luasnip",
      after = "LuaSnip",
   }

   use {
      "hrsh7th/cmp-nvim-lua",
      after = "cmp_luasnip",
   }

   use {
      "hrsh7th/cmp-nvim-lsp",
      after = "cmp-nvim-lua",
   }

   use {
      "hrsh7th/cmp-buffer",
      after = "cmp-nvim-lsp",
   }

   use {
      "rafamadriz/friendly-snippets",
      after = "cmp-buffer",
   }

   use {
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = function()
         require("plugins.config.others").autopairs()
      end,
   }

   use {
      "sbdchd/neoformat",
      disable = not plugin_status.neoformat,
      cmd = "Neoformat",
      setup = function()
         require("core.remaps").neoformat()
      end,
   }

   use {
      "terrortylor/nvim-comment",
      disable = not plugin_status.comment,
      cmd = "CommentToggle",
      config = function()
         require("plugins.config.others").comment()
      end,
      setup = function()
         require("core.remaps").comment()
      end,
   }

   use {
      "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function()
         require "plugins.config.nvimtree"
      end,
      setup = function()
         require("core.remaps").nvimtree()
      end,
   }

   use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = {
         {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
         },
         {
            "nvim-telescope/telescope-media-files.nvim",
            disable = not plugin_status.telescope_media,
            setup = function()
               require("core.remaps").telescope_media()
            end,
         },
      },
      config = function()
         require "plugins.config.telescope"
      end,
      setup = function()
         require("core.remaps").telescope()
      end,
   }

   use {
      "Pocco81/TrueZen.nvim",
      disable = not plugin_status.truezen,
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "plugins.config.zenmode"
      end,
      setup = function()
         require("core.remaps").truezen()
      end,
   }

   use {
      "tpope/vim-fugitive",
      disable = not plugin_status.vim_fugitive,
      cmd = {
         "Git",
         "Gdiff",
         "Gdiffsplit",
         "Gvdiffsplit",
         "Gwrite",
         "Gw",
      },
      setup = function()
         require("core.remaps").vim_fugitive()
      end,
   }
end)
