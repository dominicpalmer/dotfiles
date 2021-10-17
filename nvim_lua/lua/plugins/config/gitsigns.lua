local present, gitsigns = pcall(require, "gitsigns")
if not present then
   return
end

gitsigns.setup {
   keymaps = {
      -- Default keymap options
      buffer = true,
      noremap = true,
      ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
   },
   numhl = false,

   sign_priority = 5,
   signs = {
      add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
      change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
      changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
      delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
      topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
   },

   status_formatter = nil, -- Use default
   watch_index = {
      interval = 100,
   },
}