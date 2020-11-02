" Make sure fzf is in run time path before installing
set rtp+=/usr/local/opt/fzf

" Plugins
call plug#begin(expand('~/.config/nvim/plug.vim'))

" file explorer
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
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'
Plug 'moll/vim-bbye'
Plug 'vim-syntastic/syntastic'
Plug 'meain/vim-package-info', { 'do': 'npm install' }
Plug 'mbbill/undotree'
Plug 'thaerkh/vim-workspace'
Plug 'janko/vim-test'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-peekaboo'
Plug 'godlygeek/tabular'

" behavior
Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-sleuth'
Plug 'camspiers/lens.vim'

" integrations
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rizzatti/dash.vim'

" display
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'thaerkh/vim-indentguides'

" completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" languages
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'
" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'AndrewRadev/tagalong.vim'

" formatters
Plug 'prettier/vim-prettier', {
\ 'do': 'yarn install',
\ 'branch': 'master'
\ }

" colors
Plug 'haishanh/night-owl.vim'
" Plug 'dracula/vim', { 'as': 'dracula'}
" Plug 'kylepeeler/vim-theme', { 'as': 'dracula' } " Match Dracula Pro
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'dankneon/vim'

call plug#end()

