" ---- Mappings ----

" leader is <space>
let mapleader=" "
" local leader is \
let maplocalleader="\\"

" insert line in normal mode with <space>Enter
nnoremap <Leader><CR> o<esc>

" Make it easier to edit vim
nnoremap <leader>ev :vsplit ~/dotfiles/nvim/<cr>
" Make it easier to load vimrc changes
nnoremap <leader>sv :source $MYVIMRC<cr>

" change jk to be esc on insert mode
inoremap jk <esc>
inoremap kj <esc>

" Toggle terminal
nnoremap <leader>~ :Term<CR>
nnoremap <leader>` :VTerm<CR>
" Make it more sane to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" delete buffer
nnoremap <Leader>q :Bdelete<CR>

" 'Fly' thru buffers
nnoremap <leader>\ :ls<CR>:b<space>

" Keep next/prev in the center of the screen
nnoremap n nzzzv
nnoremap N Nzzzv


" Toggle highlighting with leader+h
nnoremap <leader>x :noh<CR>
" Shortcut to clear out the search pattern (and thus turn off the highlighting)
nnoremap <leader>X :let @/ = ""<CR>

" <Space>[ for previous buffer
nnoremap <Leader>[ :bprev<CR>
" <Space>] for next buffer
nnoremap <Leader>] :bnext<CR>

" Search for character under cursor with dash
nmap <silent> <leader>d <Plug>DashSearch

" Cut/Copy/Paste/Replace to System Clipboard
" copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
" cut to system clipboard
vnoremap <Leader>D "+d
nnoremap <Leader>D "+d
" paste from system clipboard
vnoremap <Leader>p "+p
nnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader>P "+P

" Find and replace
nnoremap <leader>r :%s/

" kill all windows but current
nnoremap <leader>W :only<CR>

" fzf
" find buffers
nnoremap <leader>b :Buffers<CR>
" find file
nnoremap <leader>ff :call FilesOrGFiles()<CR>
" fine files or git files if its a project
nnoremap <leader>fF :Files<CR>
" find force git files
nnoremap <leader>fg :GFiles<CR>
" find git status files
nnoremap <leader>fG :GFiles?<CR>
" open editing history in fzf
nnoremap <leader>fh :History<CR>
" find fuzzy in buffer
nnoremap <leader>fb :BLines<CR>
" find fuzzy in loaded buffers
nnoremap <leader>fl :Lines<CR>
" find with ripgrp
nnoremap <Leader>fr :Rg<CR>
" ctrl-t to open tags in current buffer in fzf
nnoremap <leader>ft :BTags<CR>
" ctrl-t to open tags in current buffer
nnoremap <leader>fT :Tags<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" NerdTree - (O)pen file tree
" Project Root
nnoremap <leader>oe :NERDTreeToggle<CR>
nnoremap <leader>oo :NERDTreeToggle<CR>
" Current File
nnoremap <leader>oa :NERDTreeFind<CR>

" Vim (t)est
nnoremap <silent>tn :TestNearest<CR>
nnoremap <silent>tf :TestFile<CR>
nnoremap <silent>ts :TestSuite<CR>
nnoremap <silent>tl :TestLast<CR>
nnoremap <silent>tg :TestVisit<CR>

" (g)it
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" vim-workspace mapping, toggle whether open project is a workspace
nnoremap <leader>sw :ToggleWorkspace<CR>

" Move more naturally up/down when wrapping is enabled
nnoremap j gj
nnoremap k gk

" shortcut to cycle through quickfix list
nnoremap [q :cnext<cr>
nnoremap ]q :cprevious<cr>

" shortcut to cycle through location list
nnoremap [w :lnext<cr>
nnoremap ]w :lprevious<cr>

" close quickfix
nnoremap <Leader>cq :cclose<CR>

" run @ to run a macro over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
