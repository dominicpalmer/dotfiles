-- lua/core/remaps.lua
-- Loads in and binds keys defined in lua/common.lua to commands
-- All remaps are non-recursive by default

local utils = require "core.utils"
local map = utils.map

local common = utils.load_config()
local base_remaps = common.remaps
local plugin_remaps = common.remaps.plugin

local cmd = vim.cmd

local M = {}

-- Base remaps
M.base = function()
   local function heretical_remaps()
      local heretical = base_remaps.heretical

      -- Remaps that change default behaviour
      map("", heretical.yank, "y")
      map("", heretical.yank_to_eol, "y$")
      map("", heretical.till, "t")
      map("", heretical.till_backward, "T")
      map("n", heretical.paste_after, "p")
      map("x", heretical.paste_after, "\"_xP")
      map("n", heretical.paste_reindented, "]p")
      map("x", heretical.paste_reindented, "\"_x]P")
      map("", heretical.paste_before, "P")
      map("", heretical.replace, "r")
      map("", heretical.replace_mode, "R")
      map("", heretical.soft_bol, "^")
      map("", heretical.soft_eol, "$")
      map("", heretical.screen_top, "H")
      map("", heretical.screen_bottom, "L")
      map("", heretical.paragraph_forward, "}")
      map("", heretical.paragraph_backward, "{")
      map("", heretical.page_up, "<C-f>")
      map("", heretical.page_down, "<C-b>")
      map("x", heretical.join_lines, "J")
      map("n", heretical.join_lines, "mzJ`z")
      map("", heretical.match_bracket, "%")
      map("", heretical.delete_wout_yank, "\"0x")
      map("n", heretical.normal_clear_wout_yank, "0D")
      map("v", heretical.visual_clear_selection_content, ":s/^**.*/<CR> | :nohl<CR> | hk")
      map("v", heretical.delete_selection_content, "d")
      map("", heretical.normal_mode_backspace, "X")
      map("n", heretical.indent, "mz>>`z")
      map("v", heretical.indent, ">gv")
      map("n", heretical.deindent, "mz<<`z")
      map("v", heretical.deindent, "<gv")
      map("i", heretical.delete_word_forward, "<C-o>dW")
      map("i", heretical.delete_word_backward, "<C-w><C-g>u")
      map("n", heretical.quick_redo, "U")
   end

   local function compatabile_remaps()
      local compatible = base_remaps.compatible

      -- Remaps that improve compatibility with external tooling
      map("v", compatible.compatible_copy, "y")
      map("v", compatible.compatible_cut, "x")
      map("n", compatible.compatible_paste, "gP")
      map("i", compatible.compatible_paste, "<C-o>gp")
      map("v", compatible.compatible_paste, "\"_xP")
      map("n", compatible.compatible_select_all, "ggVG")
      map("i", compatible.compatible_select_all, "<Esc>ggVG")
      map("", compatible.compatible_save, ":w<CR>")
      map("n", compatible.compatible_undo, "u")
      map("x", compatible.compatible_undo, "u")
      map("i", compatible.compatible_undo, "<C-o>u")
      map("", compatible.compatible_redo, "<C-r>")
      map("", compatible.visual_block_mode, "<C-v>")
   end

   local function additional_remaps()
      local additional = base_remaps.additional

      -- Remaps that add composite functionality through simpler keybinds
      map("n", additional.repeat_word_delete_forward, "*``dgn")
      map("n", additional.repeat_word_delete_backward, "*``dgN")
      map("n", additional.repeat_word_change_forward, "*``cgn")
      map("n", additional.repeat_word_change_backward, "*``cgN")
      map("n", additional.quick_write, ":w<CR>")
      map("n", additional.quick_close, ":q<CR>")
      map("n", additional.line_break_below, "o<Esc>")
      map("n", additional.indent_recent_paste, "V`]>")
      map("n", additional.deindent_recent_paste, "V`]<")
      map("n", additional.deindent_recent_paste, "V`]<")
      map("v", additional.shift_block_down, ":m '>+1<CR>gv=gv")
      map("v", additional.shift_block_up, ":m '<-2<CR>gv=gv")
      map("n", additional.call_nohl, ":nohl<CR>")
      map("i", additional.undo_break_comma, ",<C-g>u")
      map("i", additional.undo_break_dot, ".<C-g>u")
      map("i", additional.undo_break_bang, "!<C-g>u")
      map("i", additional.undo_break_question, "?<C-g>u")
      map(
         "n",
         additional.down_w_jump_insertion,
         "(v:count > 5 ? \"m`\" . v:count : \"\") . 'j'",
         { expr = true }
      )
      map(
         "n",
         additional.up_w_jump_insertion,
         "(v:count > 5 ? \"m`\" . v:count : \"\") . 'k'",
         { expr = true }
      )
   end

   local function env_remaps()
      local env = base_remaps.env

      -- Remaps that alter window, buffer and environment behaviour
      map("n", env.quick_command_mode, ":", { silent = true })
      map("", env.window_right, "<C-w>h")
      map("", env.window_down, "<C-w>j")
      map("", env.window_up, "<C-w>k")
      map("", env.window_left, "<C-w>l")
      map("n", env.window_split_vertical, ":vsplit<CR>")
      map("n", env.window_split_horizontal, ":split<CR>")
      map("n", env.quick_quit_all, ":qa<CR>")
      map("i", env.menu_next, "<C-n>")
      map("i", env.menu_next, 'pumvisible() ? "\\<C-n>" : "\\j"', { expr = true })
      map("i", env.menu_prev, "<C-p>")
      map("i", env.menu_prev, 'pumvisible() ? "\\<C-p>" : "\\k"', { expr = true })
      map("n", env.load_unnamed_buffer, ":enew<CR>", { silent = true })
      map("n", env.unload_buffer, ":bp<bar>sp<bar>bn<bar>bd<CR>")
      map("n", env.reload_config, ":lua require('lib').reload_config()<CR>")
      map("n", env.toggle_theme, ":lua require('lib').toggle_theme(" ..
                                    "require('core.utils').load_config()" ..
                                    ".ui.theme_toggler.theme_list)<CR>",
                                    { silent = true }
      )
   end

   -- Miscellaneous remaps and commands
   local function misc_remaps()
      -- Packer isn't loaded at startup, so add commands to do so aposteriori
      cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
      cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
      cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
      cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
      cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
      cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
   end

   heretical_remaps()
   compatabile_remaps()
   additional_remaps()
   env_remaps()
   misc_remaps()
end

-- Plugin remaps
M.bufferline = function()
   local bufferline = plugin_remaps.bufferline

   map("n", bufferline.buffer_1, ":BufferLineGoToBuffer 1<CR>")
   map("n", bufferline.buffer_2, ":BufferLineGoToBuffer 2<CR>")
   map("n", bufferline.buffer_3, ":BufferLineGoToBuffer 3<CR>")
   map("n", bufferline.buffer_4, ":BufferLineGoToBuffer 4<CR>")
   map("n", bufferline.buffer_5, ":BufferLineGoToBuffer 5<CR>")
   map("n", bufferline.buffer_6, ":BufferLineGoToBuffer 6<CR>")
   map("n", bufferline.buffer_7, ":BufferLineGoToBuffer 7<CR>")
   map("n", bufferline.buffer_8, ":BufferLineGoToBuffer 8<CR>")
   map("n", bufferline.buffer_9, ":BufferLineGoToBuffer 9<CR>")
   map("n", bufferline.next_buffer, ":BufferLineCycleNext<CR>")
   map("n", bufferline.prev_buffer, ":BufferLineCyclePrev<CR>")
end

M.comment = function()
   local comment = plugin_remaps.comment

   map("n", comment, ":CommentToggle<CR>")
   map("v", comment, ":CommentToggle<CR>")
end

M.nvimtree = function()
   local nvimtree = plugin_remaps.nvimtree

   map("n", nvimtree.toggle, ":NvimTreeToggle<CR>")
end

M.neoformat = function()
   local neoformat = plugin_remaps.neoformat

   map("n", neoformat.format, ":Neoformat<CR>")
end

M.telescope = function()
   local telescope = plugin_remaps.telescope

   map("n", telescope.find_files, ":Telescope find_files<CR>")
   map("n", telescope.buffers, ":Telescope buffers<CR>")
end

M.telescope_media = function()
   local telescope_media = plugin_remaps.telescope_media

   map("n", telescope_media.media_files, ":Telescope media_files<CR>")
end

M.truezen = function()
   local truezen = plugin_remaps.truezen

   map("n", truezen.ataraxis_mode, ":TZAtaraxis<CR>")
   map("n", truezen.focus_mode, ":TZFocus<CR>")
   map("n", truezen.minimalistic_mode, ":TZMinimalist<CR>")
end

M.vim_fugitive = function()
   local m = plugin_remaps.vim_fugitive

   map("n", m.git, ":Git<CR>")
   map("n", m.git_blame, ":Git blame<CR>")
   map("n", m.diff_get_2, ":diffget //2<CR>")
   map("n", m.diff_get_3, ":diffget //3<CR>")
end

return M
