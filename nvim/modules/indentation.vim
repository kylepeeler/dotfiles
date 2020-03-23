" ---------------------------------------------- Indentation

filetype indent on                                  " load filetype specific indents 
set expandtab                                       " tabs are spaces
set softtabstop=2                                   " number of columns in insert mode
set smartindent                                     " indent files smartly
set autoindent                                      " copy indent from current line with starting a new line 
set tabstop=2
set shiftwidth=2 

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_exclude_filetypes = ['help', 'netrw']
