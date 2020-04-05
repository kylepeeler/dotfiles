" -------------------------------------------------- Visual Settings

" set lazyredraw                      " dont draw if you don't have to

if (has("termguicolors"))           " enable 24-bit color if its available
  set termguicolors
endif

syntax on                           " turn on syntax highlighting

set lazyredraw

colorscheme dracula
let g:dracula_italic = 1

" Don't show the mode since airline already shows it
set noshowmode

" Enable Flow Syntax Highlighting for JS
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1
" Use pretty-jsx and disable jsx for polyglot, its not as good as pretty jsx and is older for some reason...
let g:polyglot_disabled = ['jsx']
