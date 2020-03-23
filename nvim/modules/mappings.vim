" ---- Mappings ----

" leader is <space>
let mapleader="\<Space>"
" local leader is \
let maplocalleader="\\"

" insert line in normal mode with <space>Enter
nnoremap <Leader><CR> o<esc>

" Make it easier to edit vim
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
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

" Toggle highlighting with leader+h
nnoremap <leader>x :noh<CR>

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
" cut to system clipboard
vnoremap <Leader>d "+d
" paste from system clipboard
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" fzf
nnoremap <leader>o :FZF<CR>
nnoremap <leader>O :FZF!<CR>
" find buffers
nnoremap <leader>b :Buffers<CR>
" find file
nnoremap <leader>ff :Files<CR>
" find fuzzy in buffer
nnoremap <leader>fb :BLines<CR>
" find fuzzy in loaded buffers
nnoremap <leader>fl :Lines<CR>

" git
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gs :Gstatus<CR>

" NerdTree 
noremap <leader>e :NERDTreeToggle<CR>

" Session save/open/remove
nnoremap <Leader>ss :mksession! ~/.config/nvim/sessions/
nnoremap <Leader>so :source ~/.config/nvim/sessions/
nnoremap <Leader>sr :!rm ~/.config/nvim/sessions/

" Move more naturally up/down when wrapping is enabled
nnoremap j gj
nnoremap k gk

" Make arrow keys more useful and plebian movement 
noremap <Up> :resize +2<CR>
noremap <Down> :resize -2<CR>
noremap <Left> :vertical resize +2<CR>
noremap <Right> :vertical resize -2<CR>
