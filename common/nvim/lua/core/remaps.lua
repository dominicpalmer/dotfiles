local map = function(mode, lhs, rhs, opt)
   local options = { noremap = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end
   vim.keymap.set(mode, lhs, rhs, opt)
end

-- Movement
map("", "f", "b")
map("", "F", "B")
map("", "H", "^")
map("", "J", "}")
map("", "K", "{")
map("", "L", "$")
map("", "M", "J")
map("", "\\", ":m '>+1<CR>gv=gv")
map("", "/", ":m '<-2<CR>gv=gv")
map("n", "z", "mz>>`z")
map("v", "z", ">gv")
map("n", ",", "mz<<`z")
map("v", ",", "<gv")

-- Search
map("", ";", "/")
map("", ":", "?")
map("n", "g;", "viwy/<C-r>0")
map("v", "g;", "y/<C-r>0")
map("", "@", ":")
map("n", "<Esc>", ":nohl<CR>")
map("n", "v;", "v/")

-- Text Modification
map("", "t", "y")
map("n", "T", "y$")
map("n", "r", "p")
map("v", "r", "P")
map("", "R", "P")
map("", "x", "s")
map("", "s", "\"0x")
map("", "S", "\"0D")
map("", "m", "r")
map("", "b", "<C-v>")
map("n", "'", "~h")
map("v", "'", "~")
map("n", "<CR>", "o<Esc>")
map("n", "<S-CR>", "O<Esc>")
map("v", "u", "<Esc>u")
map("", "U", "<C-r>")

-- g commands
map("", "gd", "gj")

-- Alt commands
map("", "<M-j>", "<C-f>")
map("", "<M-k>", "<C-b>")
map("", "<M-u>", "<C-o>")
map("", "<M-i>", "<C-i>")

-- Leader commands
map("", "<leader>w", ":w<CR>")
map("", "<leader>q", ":q<CR>")
map("", "<leader><leader>w", ":wa<CR>")
map("", "<leader><leader>q", ":qa<CR>")
map("n", "<leader><leader>q", ":qa<CR>")
map("n", "<leader>n", ":enew<CR>", { silent = true })
map("n", "<leader>f", ":bp<bar>sp<bar>bn<bar>bd<CR>")

map("", "<leader>h", "<C-w>h")
map("", "<leader>j", "<C-w>j")
map("", "<leader>k", "<C-w>k")
map("", "<leader>l", "<C-w>l")
map("n", "<leader>v", ":vsplit<CR>")
map("n", "<leader>c", ":split<CR>")

-- Other commands
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

-- Additional undo break points
map("i", ",", ",<C-g>u")
map("i", ".", ".<C-g>u")
map("i", "!", "!<C-g>u")
map("i", "?", "?<C-g>u")

-- Additional jump list insertions for relative line jumping beyond 5 lines
map("n", "j", "(v:count > 5 ? \"m`\" . v:count : \"\") . 'j'", { expr = true })
map("n", "k", "(v:count > 5 ? \"m`\" . v:count : \"\") . 'k'", { expr = true })
