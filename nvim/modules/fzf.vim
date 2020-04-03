let g:lens#disabled_filetypes = ['nerdtree', 'fzf']

let g:fzf_tags_command = 'ctags --extra=+f -R'

let g:fzf_action = {
  \ 'ctrl-q': function('BuildQuickfixList'),
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" fzf layout
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.6 } }

" command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>,
"   \ fzf#vim#with_preview({'options': ['--color', 'hl:9,hl+:14']}), <bang>0
"   \ )

" command! -bang -nargs=* Rg call fzf#vim#grep(
"   \ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, 
"   \ fzf#vim#with_preview({}), <bang>0
"   \ )

" command! -bang -nargs=* RgWord call fzf#vim#grep(
"   \ 'rg --column --line-number --no-heading --color=always --smart-case --word-regexp '.shellescape(<q-args>), 1, 
"   \ fzf#vim#with_preview({}), <bang>0
"   \ )

