" Kyle's Neovim Config
"
" Don't try to use it without knowing what it does, comments may or may not
" make sense to you (assuming it is commented, may not be whoops)... 
" if you are curious what something does further open an issue or ask me in person


let $MODULE_LOCATION = "$HOME/dotfiles/nvim/modules"

" --- Modules ---


set rtp+=/usr/local/opt/fzf

" Plugins
call plug#begin(expand('~/.config/nvim/plug.vim'))
Plug 'dracula/vim', { 'as': 'dracula'}
Plug 'ntk148v/vim-horizon'
" Plug 'kylepeeler/vim-theme', { 'as': 'dracula' } " Match Dracula Pro
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'master'
  \ }
Plug 'plasticboy/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'ryanoasis/vim-devicons'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vimlab/split-term.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
call plug#end()

" Turn off line numbers in terminal
augroup TurnOffLineNumbers 
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Fix syntax highlighting
let g:polyglot_disabled = ['javascript']

" Learn Vim Script the hard way mappings
" Set leader to be ,
let mapleader = ","
" Set local leader to be \
let maplocalleader = "\\"
" Make it easier to edit VIM - opens vimrc in a split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Make it easier to load vimrc changes
nnoremap <leader>sv :source $MYVIMRC<cr>

" Change jk to be esc on insert mode 
inoremap jk <esc>
" Opt into jk on vmode 
noremap <leader>jk <esc>
" Upper case current word <c-u> when in insert mode 
inoremap <c-u> <esc>viwU<esc>i
" Uppercase current word <c-u> when in normal mode
nnoremap <c-u> viwU<esc> 

" Window Splits 
set splitright              " Split to right of active window
set splitbelow              " Split below the window
augroup PreferToRightOpen   " Prefer opening all new windows in a vertical split
  autocmd WinNew * wincmd L
augroup END

set softtabstop=2	    " number of spaces in tab when editing
set expandtab		    " tabs are spaces
set shiftwidth=2            " number of spaces to use for each step of autoindent
set autoindent              " copy indent from current line with starting a new line 
set smartindent             " consider braces and other syntax for indent level when starting a new line
set ignorecase              " ignore case of searches
set relativenumber          " display relative line numbers rather than file line numbers

" filetype plugin indent on
set backspace=indent,eol,start
set laststatus=2        " always show the statusline"
set hidden              " allows moving away from buffers w/out saving

" UI Config
set number		          " show line numbers
set cursorline		      " highlight currentline
filetype indent on	    " load file-type specific indent files 
set showmatch		        " highlight matching [{()}]
syntax on               " turn syntax highlighting on1
set termguicolors
colorscheme dracula

" WILDMENU
set wildmenu                          " use wildmenu
set wildchar=<TAB>                    " tab complete commands

" IGNORE CERTAIN EXTENSION IN WILDMENU
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*

set wildmode=list:longest             " Complete only until point of ambiguity.
set winminheight=0                    " splits reduced to single line.

""""" LEADER COPY/CUT/PASTE/REPLACE COMMMANDS
" copy to system clipboard
vnoremap <Leader>y "+y
" cut to system clipboard
vnoremap <Leader>d "+d
" paste from system clipboard after cursor
vnoremap <Leader>p "+p
nnoremap <Leader>p "+p
" paste from system clipboard before cursor
vnoremap <Leader>P "+P
nnoremap <Leader>P "+P
"""""

" ------------------------------------------------------------ JS

let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1

" ------------------------------------------------------------ CTRL-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }


" Deoplete
let g:deoplete#enable_at_startup = 1


let g:ctrlp_map = '<c-p>'

" Statusline
let g:airline_theme="dracula"
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1    " Automatically displays all buffers when there's only one tab open

" COC
set updatetime=300
set shortmess+=c

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <leader>k :ALEFix<CR>

" ALE
" Type `gd` to go to definition
nnoremap <silent> gh :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
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

" Use leader + space to clear highlighting
nnoremap <leader><space> :set hls!<CR>       

" Toggle terminal
nnoremap <leader>T :Term<CR>
nnoremap <leader>t :VTerm<CR> 
tnoremap <Esc> <C-\><C-n>

" fzf
nnoremap <leader>o :FZF<CR>
nnoremap <leader>O :FZF!<CR>

" NerdTree 
noremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1

" FORMATTERS
let g:prettier#autoformat = 1 " Enable auto formatting of files that have "@format" or "@prettier" tag

" Bind Tab/Buffer navigation to \+[1-9]
nnoremap <leader>0 <Plug>AirlineSelectTab1
nnoremap <leader>1 <Plug>AirlineSelectTab1
nnoremap <leader>2 <Plug>AirlineSelectTab2
nnoremap <leader>3 <Plug>AirlineSelectTab3
nnoremap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>5 <Plug>AirlineSelectTab5
nnoremap <leader>6 <Plug>AirlineSelectTab6
nnoremap <leader>7 <Plug>AirlineSelectTab7
nnoremap <leader>8 <Plug>AirlineSelectTab8
nnoremap <leader>9 <Plug>AirlineSelectTab9
nnoremap <leader>- <Plug>AirlineSelectPrevTab
nnoremap <leader>+ <Plug>AirlineSelectNextTab

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
" function! WinMove(key)
" let t:curwin = winnr()
" exec "wincmd ".a:key
" if (t:curwin == winnr())
" if (match(a:key,'[jk]'))
"     wincmd v
" else
"     wincmd s
" endif
" exec "wincmd ".a:key
" endif
" endfunction

" view registers
nnoremap <Leader>r :reg<CR>

" session save/open/remove
nnoremap <Leader>ss :mksession! ~/.config/nvim/sessions/
nnoremap <Leader>so :source ~/.config/nvim/sessions/
nnoremap <Leader>sr :!rm ~/.config/nvim/sessions/

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
" git
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" Disable Arrows all together because they are bad
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Move around windows easier
noremap <C-h> :call WinMove('h')<cr>
noremap <C-j> :call WinMove('j')<cr>
noremap <C-k> :call WinMove('k')<cr>
noremap <C-l> :call WinMove('l')<cr>

" instead of having ~/.vim/coc-settings.json
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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
