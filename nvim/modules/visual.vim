" -------------------------------------------------- Visual Settings

set lazyredraw                      " dont draw if you don't have to

if (has("termguicolors"))           " enable 24-bit color if its available
  set termguicolors
endif

syntax on                           " turn on syntax highlighting

colorscheme dracula                 

" Enable Flow Syntax Highlighting for JS
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1

