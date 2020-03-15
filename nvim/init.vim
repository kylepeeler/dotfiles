" Kyle's Neovim Config
"
" Don't try to use it without knowing what it does, comments may or may not
" make sense to you... if you are curious what something does further open an
" issue or ask me in person

" Plugins
call plug#begin(expand('~/.config/nvim/plug.vim'))
" put plugins here
call plug#end()

" Spaces & Tabs
set tabstop=2		" number of visual spaces per TAB
set softtabstop=2	" number of spaces in tab when editing
set expandtab		" tabs are spaces

" UI Config
set number		" show line numbers
set cursorline		" highlight currentline
filetype indent on	" load file-type specific indent files 
set wildmenu		" visual autocomplete for command menu 
set showmatch		" highlight matching [{()}]

" Searching
set incsearch		" search as characters are entered
set hlsearch		" highlight matches

