" -------------------------------------------- Completion

autocmd CursorHold * silent call CocActionAsync('highlight')

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [gd <Plug>(coc-diagnostic-prev)
nmap <silent> ]gd <Plug>(coc-diagnostic-next)

" Use `[qg` and `]qg` to navigate quickfix
nmap <silent> ]gq :cn<CR>
nmap <silent> [gq :cp<CR>

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <Leader>A  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <Leader>E  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <Leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <Leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <Leader>fs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <Leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <Leader>rl :<C-u>CocListResume<CR> 
" ------------------------------------------------------------ Linting/Formatting
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>sf <Plug>(coc-format-selected)
nmap <leader>sf <Plug>(coc-format-selected)
noremap <leader>F :Prettier

highlight link CocErrorSign ErrorMsg
highlight link CocInfoSign Comment
highlight link CocWarningSign Search

let g:coc_global_extensions = ['coc-actions', 'coc-eslint', 'coc-highlight', 'coc-css', 'coc-flow', 'coc-html', 'coc-json', 'coc-stylelintplus', 'coc-svg']
