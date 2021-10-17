colorscheme gruvbox

" Editor transparency
highlight Normal guibg=NONE ctermbg=NONE

" Gutter transparency
highlight clear SignColumn
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
highlight GitGutterChangeDelete guifg=#ff2222 ctermfg=Blue

" Separator transparency
highlight VertSplit guibg=None ctermbg=None

" No parentheses match highlighting
let loaded_matchparen = 1

" Delete trailing whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIMWHITESPACE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Temporarily highlight yanked text
augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua
		\ vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
