runtime! debian.vim
"set compatible
filetype plugin indent on
syntax on
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set encoding=UTF-8
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set autoindent
set ruler
set hlsearch
set number
set cursorline
set laststatus=2
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1
" needed for tmux
set term=screen-256color
colorscheme elflord
set tabstop=2
set softtabstop=2
set shiftwidth=2
" sync open file with NERDTree
" " " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"set rtp+=~/.vim/bundle/Vundle.vim/
" call vundle#rc()
" Plugin '.vim/bundle/nerdtree'
" Plugin '.vim/bundle/vim-powerline'
" Bundle 'nerdtree'
" Bundle 'vim-powerline'
call plug#begin('~/.vim/plugged')
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
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'morhetz/gruvbox'
 Plug 'airblade/vim-gitgutter'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdtree'
call plug#end()
" :CocInstall coc-python
let g:airline#extensions#tabline#enabled = 1
 "nnoremap <C-j> gT
 "nnoremap <C-k> gt
map <C-X> :NERDTreeToggle<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-n> :tabnew<CR>
