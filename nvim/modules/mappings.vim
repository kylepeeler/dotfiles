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

" Uppercase current word <c-u> when in insert mode
inoremap <c-u> <esc>viwU<esc>i
" Uppercase current word <c-u> when in normal mode
nnoremap <c-u> viwU<esc>

" Toggle terminal
nnoremap <leader>T :Term<CR>
nnoremap <leader>t :VTerm<CR>
tnoremap <Esc> <C-\><C-n>
" open window in floating
nnoremap <Leader>+ :call CreateCenteredFloatingWindow(50, 50)<CR>:terminal<CR>a
" delete buffer
nnoremap <Leader>q :Bdelete<CR>

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
vnoremap <C-J> <Plug>MoveBlockDown
vnoremap <C-K> <Plug>MoveBlockUp
vnoremap <C-H> <Plug>MoveBlockLeft
vnoremap <C-L> <Plug>MoveBlockRight
nnoremap <C-J> <Plug>MoveLineDown
nnoremap <C-K> <Plug>MoveLineUp
nnoremap <C-L> <Plug>MoveCharRight
nnoremap <C-H> <Plug>MoveCharLeft

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
nnoremap <leader>fmg :GFiles?
" find fuzzy in buffer
nnoremap <leader>fb :BLines<CR>
" find fuzzy in loaded buffers
nnoremap <leader>fl :Lines<CR>
" ctrl-p to open files menu in fzf
noremap <C-P> :Files<CR>
" open Ag with ctrl-f
noremap <C-f> :Ag<CR>
" ctrl-t to open tags menu in fzf
noremap <C-T> :Tags<CR>
" ctrl-m to open editing history in fzf
noremap <C-M> :History<CR>
" open up ripgrep search with <space>a
nnoremap <Leader>a :Rg<CR>
" run ripgrep search wrapped in word boundaries 
nnoremap <leader>F :RgWord <CR>

" Undotree
nnoremap <leader>u :UndotreeToggle<CR>

" NerdTree
" Project Root
nnoremap <leader>fe :NERDTreeToggle<CR>
" Current File
nnoremap <leader>fa :NERDTreeFind<CR>


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
