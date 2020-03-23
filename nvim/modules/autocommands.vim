" ------------------------------------------------------ Autocommands

" Reload VIM when .vimrc changes
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" Turn off line numbers in terminal windows
augroup TurnOffLineNumbers
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Prefer to open windows in a vertical split to right
augroup PreferOpenRight
  autocmd!
  autocmd WinNew * wincmd L
augroup END
