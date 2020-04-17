runtime! debian.vim
"set compatible
filetype plugin indent on
syntax on
set nocompatible
set title
set wrap
set visualbell
set noerrorbells
set encoding=UTF-8
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch
set hlsearch
set autowrite		" Automatically save before commands like :next and :make
set mouse=a		" Enable mouse usage (all modes)
set autoindent
set ruler
set hlsearch
set number
set cursorline
set laststatus=2
set scrolloff=4
set guifont=DroidSansMono\ Nerd\ Font\ 11
" needed for tmux
set term=screen-256color
syntax enable
colorscheme slate
if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
call plug#begin('~/.vim/plugged')
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'Shougo/vimproc.vim', {'do' : 'make'}
 Plug 'osyo-manga/vim-over' 
 Plug 'hashivim/vim-terraform'
 Plug 'juliosueiras/vim-terraform-completion'
 Plug 'lervag/vimtex'
 Plug 'editorconfig/editorconfig-vim'
 Plug 'hashivim/vim-terraform'
 Plug 'kien/ctrlp.vim'
 Plug 'tpope/vim-fugitive'
call plug#end()
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
map <C-X> :NERDTreeToggle<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>

autocmd vimenter * NERDTree
