" ---- Visual Settings ----
set lazyredraw                      " dont draw if you don't have to

if (has("termguicolors"))           " enable 24-bit color if its available
  set termguicolors
endif

syntax on                           " turn on syntax highlighting

" ---- Theme Configuration ----
" >> Dracula Configuration
" colorscheme dracula
" let g:dracula_italic = 1

" >> Night Owl Configuration

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme night-owl
let g:airline_theme='night_owl'

" To enable the lightline theme
" let g:lightline = { 'colorscheme': 'nightowl' }

" Don't show the mode since airline already shows it
set noshowmode

" Enable Flow Syntax Highlighting for JS
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1

" Use pretty-jsx and disable jsx for polyglot, its not as good as pretty jsx and is older for some reason...
" let g:polyglot_disabled = ['jsx']
