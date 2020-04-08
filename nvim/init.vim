" Kyle's Neovim Config
"
" Don't try to use it without knowing what it does, comments may or may not
" make sense to you (assuming it is commented, may not be whoops)... 
" if you are curious what something does further open an issue or ask me in person


let $MODULE_LOCATION = "$HOME/.config/nvim/modules"

" --- Modules ---
source $MODULE_LOCATION/plugins.vim
source $MODULE_LOCATION/functions.vim
source $MODULE_LOCATION/mappings.vim
source $MODULE_LOCATION/statusline.vim
source $MODULE_LOCATION/wildmenu.vim
source $MODULE_LOCATION/functionality.vim
source $MODULE_LOCATION/terminal.vim
source $MODULE_LOCATION/visual.vim
source $MODULE_LOCATION/folding.vim
source $MODULE_LOCATION/indentation.vim
source $MODULE_LOCATION/findreplace.vim
source $MODULE_LOCATION/coc.vim
source $MODULE_LOCATION/autocommands.vim
source $MODULE_LOCATION/fzf.vim


