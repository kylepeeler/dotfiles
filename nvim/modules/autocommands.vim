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
" augroup PreferOpenRight
"   autocmd!
"   autocmd WinNew * wincmd L
" augroup END

" Disable auto comments
augroup RemoveAutoComments
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" reload changed file on focus, buffer enter
" helps if file was changed externally.
augroup ReloadGroup
  autocmd!
  autocmd! FocusGained,BufEnter * checktime
augroup END

" When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
augroup PreservingFilePosition
  autocmd!
  autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

if has("autocmd")
  augroup FileTypes
    autocmd!

    " shell files
    autocmd BufNewFile,BufRead .variables set filetype=less
    autocmd BufNewFile,BufRead .overrides set filetype=less

    if has('nvim')
      " Don't show invisibles in the terminal. Also go into insert mode.
      autocmd TermOpen * setlocal nolist
      autocmd TermOpen * startinsert
      " Go back to normal mode in the terminal once process is
      " complete, this stops the any key to close behavior.
      autocmd TermClose * call feedkeys("\<C-\>\<C-n>")
    endif

  augroup END
endif

" Highlight currently open buffer in NERDTree if it is open
augroup AutoMoveTree
  autocmd!
  autocmd BufEnter * call SyncTree()
augroup END

" Highlight symbol under cursor on CursorHold
augroup CursorHighlight
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
