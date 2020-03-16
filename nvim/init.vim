" Kyle's Neovim Config
"
" Don't try to use it without knowing what it does, comments may or may not
" make sense to you (assuming it is commented, may not be whoops)... 
" if you are curious what something does further open an issue or ask me in person

set rtp+=/usr/local/opt/fzf

" Plugins
call plug#begin(expand('~/.config/nvim/plug.vim'))
Plug 'dracula/vim', { 'as': 'dracula'}
" Plug 'kylepeeler/vim-theme', { 'as': 'dracula' } " Match Dracula Pro
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'plasticboy/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'ryanoasis/vim-devicons'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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
nnoremap <leader><space> :set hls!<cr>


" UI Config
set number		          " show line numbers
set cursorline		      " highlight currentline
filetype indent on	    " load file-type specific indent files 
set wildmenu		        " visual autocomplete for command menu 
set showmatch		        " highlight matching [{()}]
syntax on               " turn syntax highlighting on1
set termguicolors
colorscheme dracula

" Deoplete
let g:deoplete#enable_at_startup = 1


" Statusline
let g:airline_theme="dracula"
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1    " Automatically displays all buffers when there's only one tab open

" COC
set updatetime=300
set shortmess+=c

" Use leader T to show documentation in preview window
nnoremap <leader>t :call <SID>show_documentation()<CR>

" ALE
" Type `gd` to go to definition
nnoremap <silent> gh :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
let g:ale_sign_error = 'x'
let g:ale_sign_warning = 'o'
nnoremap ]r :ALENextWrap<CR>     " move to the next ALE warning / error
nnoremap [r :ALEPreviousWrap<CR> " move to the previous ALE warning / error
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'less': ['stylelint'],
\   'javascript': ['eslint', 'flow-language-server'],
\   'javascriptreact': ['eslint', 'flow-language-server'],
\ }
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'javascriptreact': ['eslint'],
\}
let g:ale_fix_on_save = 1
" fzf
nnoremap <silent> <leader>o :FZF<CR>
nnoremap <silent> <leader>O :FZF!<CR>

" NerdTree
noremap <leader>\ :NERDTreeToggle<CR>

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" Bind Tab/Buffer navigation to \+[1-9]
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
let t:curwin = winnr()
exec "wincmd ".a:key
if (t:curwin == winnr())
if (match(a:key,'[jk]'))
    wincmd v
else
    wincmd s
endif
exec "wincmd ".a:key
endif
endfunction

" view registers
nnoremap <Leader>r :reg<CR>

" session save/open/remove
nnoremap <Leader>ss :mksession! ~/.config/nvim/sessions/
nnoremap <Leader>so :source ~/.config/nvim/sessions/
nnoremap <Leader>sr :!rm ~/.config/nvim/sessions/

" If more than one window and previous buffer was NERDTree, go back to it.
" autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Searching
set incsearch		" search as characters are entered
set hlsearch		" highlight matches
set gdefault    " default to global search

" find buffer
nnoremap <Leader>b :Buffers<CR>

" find and replace word
nnoremap <Leader>fr :%s/
" find file
nnoremap <Leader>ff :Files<CR>

" find fuzzy in buffer
nnoremap <Leader>fb :BLines<CR>

" find fuzzy in loaded buffers
nnoremap <Leader>fl :Lines<CR>

" find buffer
nnoremap <Leader>b :Buffers<CR>

" git
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" Disable Arrows because they are bad
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Move around windows easier
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Flow Configuration
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" instead of having ~/.vim/coc-settings.json
let s:LSP_CONFIG = {
\  'flow': {
\    'command': exepath('flow'),
\    'args': ['lsp'],
\    'filetypes': ['javascript', 'javascriptreact'],
\    'initializationOptions': {},
\    'requireRootPattern': 1,
\    'settings': {},
\    'rootPatterns': ['.flowconfig']
\  }
\}

let s:languageservers = {}
for [lsp, config] in items(s:LSP_CONFIG)
  let s:not_empty_cmd = !empty(get(config, 'command'))
  if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
endfor

if !empty(s:languageservers)
  call coc#config('languageserver', s:languageservers)
  endif
