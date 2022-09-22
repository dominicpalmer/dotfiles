local utils = require "lib.utils"
local map = utils.map

local M = {}

M.bind = function()
   local function heretical_remaps()
      -- Yank (take), paste (resolve), replace (place) and till (yet)
      map("", "t", "y")
      map("", "T", "y$")
      map("", "y", "t")
      map("", "Y", "T")
      map("n", "r", "p")
      map("x", "r", "\"_xP")
      map("n", "]r", "]p")
      map("x", "]r", "\"_x]P")
      map("", "R", "P")
      map("", "p", "r")
      map("", "P", "R")

      -- Swap find and search
      map("", "f", "/")
      map("", "F", "?")
      map("", "/", "f")
      map("", "?", "F")

      -- Home row navigation between line start and line end
      map("", "H", "^")
      map("", "L", "$")
      map("", "^", "H")
      map("", "$", "L")

      -- Home row navigation between paragraphs
      map("", "J", "}")
      map("", "K", "{")

      -- Page up, page down
      map("", "<M-j>", "<C-f>")
      map("", "<M-k>", "<C-b>")

      -- J (join) to M (merge), with fixed cursor position from normal mode
      map("x", "M", "J")
      map("n", "M", "mzJ`z")

      -- Bracket matching
      map("", "Q", "%")

      -- Delete into 0 register, clear line, delete selection
      map("", "x", "\"0x")
      map("n", "X", "0D")
      map("v", "X", ":s/^**.*/<CR> | :nohl<CR> | hk")
      map("v", "<CR>", "d")

      -- Insert newline without exiting normal mode
      map("n", "<CR>", "o<Esc>")

      -- Sensible indentation
      map("n", ">", "mz>>`z")
      map("v", ">", ">gv")
      map("n", "<", "mz<<`z")
      map("v", "<", "<gv")

      -- Sensible redo
      map("n", "U", "<C-r>")
   end

   local function compatible_remaps()
      map("v", "<C-c>", "y")
      map("v", "<C-x>", "x")
      map("n", "<C-v>", "gP")
      map("i", "<C-v>", "<C-o>gp")
      map("v", "<C-v>", "\"_xP")
      map("n", "<C-a>", "ggVG")
      map("i", "<C-a>", "<Esc>ggVG")
      map("", "<C-s>", ":w<CR>")
      map("n", "<C-z>", "u")
      map("x", "<C-z>", "u")
      map("i", "<C-z>", "<C-o>u")
      map("", "<C-y>", "<C-r>")

      -- Regain visual block mode
      map("", "S", "<C-v>")
   end

   local function environment_remaps()
      -- Command mode
      map("n", "<leader>;", ":")

      -- Window movement
      map("", "<leader>h", "<C-w>h")
      map("", "<leader>j", "<C-w>j")
      map("", "<leader>k", "<C-w>k")
      map("", "<leader>l", "<C-w>l")

      -- Window splits
      map("n", "<leader>v", ":vsplit<CR>")
      map("n", "<leader>c", ":split<CR>")

      -- Write, quit, force quit, new buffer, close buffer
      map("n", "<leader>w", ":w<CR>")
      map("n", "<leader>q", ":q<CR>")
      map("n", "<leader><leader>q", ":qa<CR>")
      map("n", "<leader>n", ":enew<CR>", { silent = true })
      map("n", "<leader>f", ":bp<bar>sp<bar>bn<bar>bd<CR>")

      -- Reload configuration, change theme
      map("n", "<leader>r", ":lua require('lib.reload').reload()<CR>")
      map("n", "<leader>t", ":lua require('lib.utils').change_theme()<CR>")
      map("n", "<C-t>", ":lua require('lib.utils').change_theme()<CR>")
   end

   local function additional_remaps()
      -- Repeat word deletion forwards or backwards
      map("n", "d*", "*``dgn")
      map("n", "d#", "*``dgN")

      -- Repeat word changes forwards or backwards
      map("n", "c*", "*``cgn")
      map("n", "c#", "*``cgN")

      -- Indent the most recently pasted text
      map("n", "<leader><", "V`]>")
      map("n", "<leader>>", "V`]<")
      map("n", "<leader>>", "V`]<")

      -- Line and block shifting
      map("v", ")", ":m '>+1<CR>gv=gv")
      map("v", "(", ":m '<-2<CR>gv=gv")

      -- Turn off highlighting
      map("n", "<Esc>", ":nohl<CR>")

      -- Additional undo break points
      map("i", ",", ",<C-g>u")
      map("i", ".", ".<C-g>u")
      map("i", "!", "!<C-g>u")
      map("i", "?", "?<C-g>u")

      -- Additional jump list insertions for relative line jumping beyond 5 lines
      map("n", "j", "(v:count > 5 ? \"m`\" . v:count : \"\") . 'j'", { expr = true })
      map("n", "k", "(v:count > 5 ? \"m`\" . v:count : \"\") . 'k'", { expr = true })
   end

   heretical_remaps()
   compatible_remaps()
   environment_remaps()
   additional_remaps()
end

return M
