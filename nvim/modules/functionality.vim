" ----------------------------------------------------------- Functionality

set hidden                                          " remember buffer history

set history=1000                                    " increase history from 20 to 1000

set undofile                                        " persistent undo
set directory=~/.config/nvim/swaps                  " use global swaps directory
set undodir=~/.config/nvim/undo                     " use global undo directory
set nobackup
set nowritebackup

set number                                          " show line numbers
set relativenumber                                  " make line numbers relative

" this seems to make rendering v slow...
" set cursorline                                      " highlight current line

set splitright                                      " Split to right of active window
set splitbelow                                      " Split below the window

set ignorecase                                      " ignore case of searches

set backspace=indent,eol,start                      " fix backspace behavior

set laststatus=2                                    " always show the statusline
set cmdheight=2

set showmatch                                       " highlight maching brackets

set magic                                           " enable extended regexes

set noerrorbells                                    " disable error bells
set visualbell t_vb=                                      " disable use visual bells

set ttyfast                                         " more apm's plz

set updatetime=300                                  " how often to write to swap
set shortmess+=c                                    " don't show match 1 of 2 etc. 
set signcolumn=yes                                  " always show the sign column

if has('mouse')
    " have the mouse enabled all the time
    set mouse=a
    " make a menu popup on right click
    set mousemodel=popup
endif

" ------- Plugin Settings --------
" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1


" nerdtree
let NERDTreeShowHidden = 1
