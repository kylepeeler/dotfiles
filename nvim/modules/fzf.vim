let g:lens#disabled_filetypes = ['nerdtree', 'fzf']

let g:fzf_tags_command = 'ctags --extra=+f -R'

let g:fzf_action = {
  \ 'ctrl-q': function('BuildQuickfixList'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Dracula theme
" let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all --ansi --reverse --multi --filepath-word
"   \ --color=dark'
"  \ --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
"  \ --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7'

command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>,
  \ fzf#vim#with_preview({'options': ['--color', 'hl:9,hl+:14']}), <bang>0
  \ )

command! -bang -nargs=* Rg call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, 
  \ fzf#vim#with_preview({}), <bang>0
  \ )

command! -bang -nargs=* RgWord call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case --word-regexp '.shellescape(<q-args>), 1, 
  \ fzf#vim#with_preview({}), <bang>0
  \ )

