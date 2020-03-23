" ----------------------------------------------------------- Functionality

set hidden                                          " remember buffer history

set history=1000                                    " increase history from 20 to 1000

set undofile                                        " persistent undo
set directory=~/.config/nvim/swaps                  " use global swaps directory
set undodir=~/.config/nvim/undo                     " use global undo directory

set number                                          " show line numbers
set relativenumber                                  " make line numbers relative

set cursorline                                      " highlight current line

set splitright                                      " Split to right of active window
set splitbelow                                      " Split below the window

set ignorecase                                      " ignore case of searches

set backspace=indent,eol,start                      " fix backspace behavior

set laststatus=2                                    " always show the statusline

set showmatch                                       " highlight maching brackets

set magic                                           " enable extended regexes

set noerrorbells                                    " disable error bells
set visualbell                                      " disable use visual bells

set ttyfast                                         " more kps plz

set updatetime=300                                  " how often to write to swap
set shortmess+=c                                    " don't show match 1 of 2 etc. 

" ------- Plugin Settings --------
" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" fzf
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.6 } }

" CTRL-P
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

let g:ctrlp_map = '<c-p>'
