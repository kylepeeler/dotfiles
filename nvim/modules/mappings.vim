" ---- Mappings ----

" leader is <space>
let mapleader="\<Space>"
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

" Navigate buffers with <leader>[1-9]
nnoremap <leader>0 <Plug>AirlineSelectTab1
nnoremap <leader>1 <Plug>AirlineSelectTab1
nnoremap <leader>2 <Plug>AirlineSelectTab2
nnoremap <leader>3 <Plug>AirlineSelectTab3
nnoremap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>5 <Plug>AirlineSelectTab5
nnoremap <leader>6 <Plug>AirlineSelectTab6
nnoremap <leader>7 <Plug>AirlineSelectTab7
nnoremap <leader>8 <Plug>AirlineSelectTab8
nnoremap <leader>9 <Plug>AirlineSelectTab9
nnoremap <leader>- <Plug>AirlineSelectPrevTab
nnoremap <leader>+ <Plug>AirlineSelectNextTab

" Cut/Copy/Paste/Replace to System Clipboard
" copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
" cut to system clipboard
vnoremap <Leader>d "+d
" paste from system clipboard
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Move text up/down/left/right
" vnoremap <C-J> <Plug>MoveBlockDown
" vnoremap <C-K> <Plug>MoveBlockUp
" vnoremap <C-H> <Plug>MoveBlockLeft
" vnoremap <C-L> <Plug>MoveBlockRight
" nnoremap <C-J> <Plug>MoveLineDown
" nnoremap <C-K> <Plug>MoveLineUp
" nnoremap <C-L> <Plug>MoveCharRight
" nnoremap <C-H> <Plug>MoveCharLeft

" fzf
" nnoremap <leader>o :FZF<CR>
" nnoremap <leader>O :FZF!<CR>
" find buffers
nnoremap <leader>b :Buffers<CR>
" find file
nnoremap <leader>ff :call FilesOrGFiles()<CR>
nnoremap <leader>fF :Files<CR>
" find git files
nnoremap <leader>fg :GFiles<CR>
" find git status files
nnoremap <leader>fmg :GFiles?<CR>
" open editing history in fzf
nnoremap <leader>fh :History<CR>
" find fuzzy in buffer
nnoremap <leader>fb :BLines<CR>
" find fuzzy in loaded buffers
nnoremap <leader>fl :Lines<CR>
" open Ag with ctrl-f
nnoremap <C-f> :Ag<CR>
" ctrl-t to open tags in current buffer in fzf
nnoremap <leader>ft :BTags<CR>
" ctrl-t to open tags in current buffer
nnoremap <leader>fT :Tags<CR>

" open up ripgrep search with <space>a
nnoremap <Leader>a :Rg<CR>
" run ripgrep search wrapped in word boundaries 
nnoremap <leader>F :RgWord<CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" NerdTree
" Project Root
nnoremap <leader>fe :NERDTreeToggle<CR>
" Current File
nnoremap <leader>fa :NERDTreeFind<CR>

" Vim test
nnoremap <silent>tn :TestNearest<CR>
nnoremap <silent>tf :TestFile<CR>
nnoremap <silent>ts :TestSuite<CR>
nnoremap <silent>tl :TestLast<CR>
nnoremap <silent>tg :TestVisit<CR>

" git
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" Session save/open/remove
nnoremap <leader>s :ToggleWorkspace<CR>

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
nnoremap <Leader>cc :cclose<CR>

" run @ to run a macro over a visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
