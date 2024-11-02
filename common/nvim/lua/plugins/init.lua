local fn = vim.fn
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim if not already installed
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "folke/lazy.nvim" },
  { "morhetz/gruvbox" }
})

-- Set colorscheme after lazy.nvim loads plugins
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    -- vim.cmd("colorscheme gruvbox")
    -- Optionally load your style.lua for transparency settings
    -- local style_path = fn.stdpath("config") .. "/lua/style/init.lua"
    -- dofile(style_path)
  end,
})
