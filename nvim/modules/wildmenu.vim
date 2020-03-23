" ------------------------------------------------ Wildmenu
set wildmenu                          " use wildmenu
set wildchar=<TAB>                    " tab complete commands

" ignore certain extensions in wildmenu
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Complete only until point of ambiguity.
set wildmode=list:longest

" splits reduced to single line.
set winminheight=0
