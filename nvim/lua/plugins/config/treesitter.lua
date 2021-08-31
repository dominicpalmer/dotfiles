local present, ts_config = pcall(require, "nvim-treesitter.config")
if not present then
   return
end

ts_config.setup {
   ensure_installed = {
      "lua",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}
