local utils = require "lib.utils"
local map = utils.map

map("n", "<leader>o", ":Clap files<CR>")

vim.api.nvim_exec([[
   let g:clap_layout = { 'relative': 'editor',
      \ 'width': '40%',
      \ 'height': '50%',
      \ 'row': '30%',
      \ 'col': '30%'
   \ }

   let g:clap_open_preview = 'never'
   let g:clap_no_matches_msg = ''
   let g:clap_insert_mode_only = 1
   let g:clap_on_move_delay = 0
   let g:clap_maple_delay = 0
   let g:clap_popup_border = 0
   let g:clap_popup_input_delay = 0
   let g:clap_search_box_border_symbols = {  'arrow': ["a", "b"], 'curve': ["c", "d"], 'nil': ['', ''] }
   let g:clap_search_box_border_style = 'nil'
   let g:clap_prompt_format = ' %provider_id% '
   let g:clap_enable_icon = 1
   let g:clap_provider_grep_delay = 0
]], false)
