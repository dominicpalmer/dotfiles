-- lua/common.lua
-- Reusable data wrappers around common settings, remaps and configurations

local M = {}
M.options, M.remaps, M.ui, M.plugin_status  = {}, {}, {}, {}

-- Base options
M.options = {
   -- The number of columns Vim renders for a tab
   tabstop = 8,

   -- Populate rendered tabs with spaces
   expandtab = true,

   -- Shift indentation width (e.g. via >>, <<)
   shiftwidth = 2,

   -- Apply the current line indentation to the next
   autoindent = true,

   -- Allow indentation to react to the syntax and style of the text in the buffer
   smartindent = true,

   -- Start scrolling 8/4 lines/columns before the end/side of the window
   scrolloff = 8,
   sidescrolloff = 4,

   -- No line wrapping
   wrap = false,

   -- Show line numbers and highlight the line under cursor
   number = true,
   cursorline = true,
   numberwidth = 2,

   -- Keep buffers open in the background
   hidden = true,

   -- No swapfiles
   swapfile = false,

   -- Store a backup in tmp on loading a file into a buffer
   backupdir = "/tmp//",

   -- Persist undo history in tmp. Neovim creates undodir if needed, Vim doesn't
   undodir = "/tmp//",
   undofile = true,

   -- Source additional configuration from opened directories, if available
   exrc = true,

   -- Case insensitive searching unless case is specified
   ignorecase = true,
   smartcase = true,

   -- Open the insert mode completion menu, but don't autoselect an option
   completeopt = { 'menuone', 'noinsert', 'noselect' },

   -- Add a marker at column 80
   colorcolumn = "80",

   -- Use a line gutter
   signcolumn = "yes",

   -- Allow the mouse to scroll and resize
   mouse = "a",

   -- Sets swapfile write frequency and cursor inactivity counter through the
   -- CursorHold autocommand event. Decreasing the time increases performance
   updatetime = 50,

   -- Timeout length for remaps to complete
   timeoutlen = 1000,

   -- 24 bit colours
   termguicolors = true,

   -- No Neovim startup message, and don't forward messages to the completion menu
   shortmess_startup = "sI",
   shortmess_completion = "c",

   -- Tab completion to the longest matching word with a tab-able wildmenu
   wildmode = { "longest:full", "list:full" },

   -- Instruct the wildmenu to ignore .git and node_modules
   wildignore_git = "**/.git/*",
   wildignore_node = "/node_modules/",

   -- Recursively search for files from the root directory
   path = "**",

   -- Use the unnamed register by default
   clipboard = "unnamedplus",

   -- Don't show the mode on the command line
   showmode = false,

   -- Open splits below and right of the calling window
   splitbelow = true,
   splitright = true,

   -- Remove the pipe split separators
   fillchars_vert = " ",

   -- Remove trailing tildes in buffers
   fillchars_eob = "#",

   -- Wrap to the previous/next line with h/l or left arrow/right arrow
   whichwrap = "<>hl",

   mapleader = " ",
}

-- Plugin options
M.options.plugin = {}

-- Base remaps
M.remaps = {
   heretical = {
      -- Yank -> take
      yank = "t",
      yank_to_eol = "T",

      -- Till -> yet
      till = "y",
      till_backward = "Y",

      -- Paste -> resolve
      paste_after = "r",
      paste_before = "R",
      paste_reindented = "]r",

      -- Replace -> place
      replace = "p",
      replace_mode = "P",

      -- Home row navigation between line start and line end
      soft_bol = "H",
      soft_eol = "L",
      screen_top = "^",
      screen_bottom = "$",

      -- Faster navigation, with join -> merge
      paragraph_forward = "J",
      paragraph_backward = "K",
      page_up = "}",
      page_down = "{",
      join_lines = "M",

      -- Better bracket matching
      match_bracket = "Q",

      -- Deletion helpers
      delete_wout_yank = "x",
      normal_clear_wout_yank = "X",
      visual_clear_selection_content = "X",
      delete_selection_content = "<CR>",
      normal_mode_backspace = "<BS>",

      -- Faster indentation
      indent = ">",
      deindent = "<",

      -- Delete forward by words in insert mode
      delete_word_forward = "<C-d>",

      -- Deletion backward by words adds additional undo break points
      delete_word_backward = "<C-w>",

      -- Faster redo
      quick_redo = "U",
   },

   compatible = {
      -- Improved workflows for moving text in and out of Neovim
      compatible_copy = "<C-c>",
      compatible_cut = "<C-x>",
      compatible_paste = "<C-v>",
      compatible_select_all = "<C-a>",
      compatible_save = "<C-s>",
      compatible_undo = "<C-z>",
      compatible_redo = "<C-y>",

      -- Regain visual block mode
      visual_block_mode = "<C-q>",
   },

   additional = {
      -- Repeat word deletion forwards or backwards
      repeat_word_delete_forward = "d*",
      repeat_word_delete_backward = "d#",

      -- Repeat word changes forwards or backwards
      repeat_word_change_forward = "c*",
      repeat_word_change_backward = "c#",

      -- Sensible write and close
      quick_write = "<leader>w",
      quick_close = "<leader>q",

      -- Add line breaks below/above the cursor
      line_break_below = "<CR>",
      line_break_above = "<leader><CR>",

      -- Indent recently pasted text
      indent_recent_paste = "<leader><",
      deindent_recent_paste = "<leader>>",

      -- Line and block shifting
      shift_block_down = ")",
      shift_block_up = "(",

      -- Turn off search highlighting
      call_nohl = "<Esc>",

      -- Additional undo break points
      undo_break_comma = ",",
      undo_break_dot = ".",
      undo_break_bang = "!",
      undo_break_question = "?",

      -- Additional jump list insertions for relative line jumping beyond 5 lines
      down_w_jump_insertion = "j",
      up_w_jump_insertion = "k",
   },

   env = {
      -- Faster command mode entry
      quick_command_mode = "<leader>;",

      -- Faster window movement
      window_right = "<leader>h",
      window_down = "<leader>j",
      window_up = "<leader>k",
      window_left = "<leader>l",

      -- Faster window splits
      window_split_vertical = "<leader>v",
      window_split_horizontal = "<leader>c",

      -- Faster quit all
      quick_quit_all = "<leader><leader>q",

      -- Navigate through menu lists from the home row
      menu_right = "<C-h>",
      menu_next = "<C-j>",
      menu_prev = "<C-k>",
      menu_left = "<C-l>",

      -- Load an unnamed buffer
      load_unnamed_buffer = "<leader>n",

      -- Unload the focused buffer
      unload_buffer = "<leader>f",

      -- Reload all configuration
      reload_config = "<leader>r",

      -- Toggle the colourscheme
      toggle_theme = "<leader>t",
   },
}

-- Plugin remaps
M.remaps.plugin = {
   bufferline = {
      -- Select buffers by index
      buffer_1 = "<leader>1",
      buffer_2 = "<leader>2",
      buffer_3 = "<leader>3",
      buffer_4 = "<leader>4",
      buffer_5 = "<leader>5",
      buffer_6 = "<leader>6",
      buffer_7 = "<leader>7",
      buffer_8 = "<leader>8",
      buffer_9 = "<leader>9",

      -- Cycle through buffers
      next_buffer = "<leader><Tab>",
      prev_buffer = "<leader><S-Tab>",
   },
   comment = {
      toggle = "<leader>/",
   },
   nvimtree = {
      toggle = "<leader>s",
   },
   neoformat = {
      format = "<leader><leader>f",
   },
   telescope = {
      find_files = "<leader>o",
      buffers = "<leader>b",
      close = "<C-c>",
   },
   telescope_media = {
      media_files = "<leader>`",
   },
   truezen = {
      -- Centered zen mode
      ataraxis_mode = "<leader>zz",

      -- Focused mode
      focus_mode = "<leader>zf",

      -- Minimalistic mode
      minimalistic_mode = "<leader>zm",
   },
   vim_fugitive = {
      git = "<leader>gs",
      git_blame = "<leader>gb",
      diff_get_2 = "<leader>gh",
      diff_get_3 = "<leader>gl",
   },
}

-- Base UI configuration
M.ui = {
   italic_comments = false,

   theme = "tomorrow-night",
   theme_toggler = {
      enabled = true,
      theme_list = {
         "tomorrow-night",
         "one-light",
      },
   },

   -- Transparency works best when Neovim and the terminal share the same theme
   transparency = false,
}

-- Plugin UI configuration
M.ui.plugin = {
   statusline = {
      -- Filetypes in shown will always show the statusline
      hidden = {},
      shown = {},

      -- Statusline style: minimal, default, round, slant, block, arrow
      style = "minimal",
   },
}

-- Turn plugins on or off
M.plugin_status = {
   blankline = true,
   bufferline = true,
   colorizer = true,
   comment = true,
   feline = true,
   gitsigns = true,
   lspkind = true,
   lspsignature = true,
   neoformat = true,
   neoscroll = true,
   telescope_media = true,
   truezen = true,
   vim_fugitive = true,
   vim_matchup = true,
}

return M
