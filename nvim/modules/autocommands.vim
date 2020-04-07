" ------------------------------------------------------ Autocommands

" Reload VIM when .vimrc changes
augroup reload_vimrc
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" Always open help files in a rightward vertical split 
autocmd FileType help wincmd L

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

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" " When editing a file, always jump to the last known cursor position.
"   " Don't do it when the position is invalid or when inside an event handler
"   " (happens when dropping a file on gvim).
"   " Also don't do it when the mark is in the first line, that is the default
"   " position when opening a file.
" augroup PreservingFilePosition
"   autocmd!
"   autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
" augroup END

augroup FileTypes
  autocmd!

  " semantic-ui files
  autocmd BufNewFile,BufRead .variables set filetype=less
  autocmd BufNewFile,BufRead .overrides set filetype=less

  if has('nvim')
    " When in a neovim terminal, add a buffer to the existing vim session instead of nesting
    	autocmd VimEnter * if !empty($NVIM_LISTEN_ADDRESS) && $NVIM_LISTEN_ADDRESS !=# v:servername
              \ |let g:r=jobstart(['nc', '-U', $NVIM_LISTEN_ADDRESS],{'rpc':v:true})
              \ |let g:f=fnameescape(expand('%:p'))
              \ |noau bwipe
              \ |call rpcrequest(g:r, "nvim_command", "edit ".g:f)
              \ |call rpcrequest(g:r, "nvim_command", "call lib#SetNumberDisplay()")
              \ |qa
              \ |endif
  endif

augroup END
