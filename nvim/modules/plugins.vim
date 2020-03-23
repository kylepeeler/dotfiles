" Make sure fzf is in run time path before installing
set rtp+=/usr/local/opt/fzf

" Plugins
call plug#begin(expand('~/.config/nvim/plug.vim'))
" file explorer
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'

" functionality
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Olical/vim-enmasse'
Plug 'matze/vim-move'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-conflicted'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'wellle/targets.vim'
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/denite-git'
Plug 'vim-syntastic/syntastic'
"--TODO: Plugins to deprecate
" Plug 'w0rp/ale'

" behavior
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-sleuth'
Plug 'Shougo/neoinclude.vim'

" integrations
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

" display
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'

" completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" languages
Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'AndrewRadev/tagalong.vim'

" formatters
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'branch': 'master'
\ }

" colors
Plug 'dracula/vim', { 'as': 'dracula'}
" Plug 'kylepeeler/vim-theme', { 'as': 'dracula' } " Match Dracula Pro
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'dankneon/vim'

call plug#end()

