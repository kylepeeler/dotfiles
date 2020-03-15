" Kyle's Neovim Config
"
" Don't try to use it without knowing what it does, comments may or may not
" make sense to you... if you are curious what something does further open an
" issue or ask me in person

" Plugins
call plug#begin(expand('~/.config/nvim/plug.vim'))
Plug 'kylepeeler/vim-theme', { 'as': 'dracula' } " Match Dracula Pro
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
call plug#end()

" Behavior 
set tabstop=2		        " number of visual spaces per TAB
set softtabstop=2	      " number of spaces in tab when editing
set expandtab		        " tabs are spaces
set autoindent
filetype plugin indent on
set backspace=indent,eol,start
set laststatus=2        " always show the statusline"
set hidden              " allows moving away from buffers w/out saving

" UI Config
set number		          " show line numbers
set cursorline		      " highlight currentline
filetype indent on	    " load file-type specific indent files 
set wildmenu		        " visual autocomplete for command menu 
set showmatch		        " highlight matching [{()}]
syntax on               " turn syntax highlighting on1
set termguicolors
colorscheme dracula

" Statusline
let g:airline_theme="dracula"

" NerdTree
" Bind NerdTree open to Ctrl W o

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Searching
set incsearch		" search as characters are entered
set hlsearch		" highlight matches
set gdefault    " default to global search

" Disable Arrows because they are bad
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
