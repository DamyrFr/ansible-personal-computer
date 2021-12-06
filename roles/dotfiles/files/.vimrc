runtime! debian.vim
"set compatible
filetype plugin indent on
syntax on
set encoding=UTF-8
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set autowrite		" Automatically save before commands like :next and :make
set mouse=a		" Enable mouse usage (all modes)
set autoindent
set ruler
set hlsearch
set number
set cursorline
set laststatus=2
set guifont=DroidSansMono\ Nerd\ Font\ 11
set term=screen-256color
colorscheme elflord
set tabstop=2
set softtabstop=2
set shiftwidth=2
set clipboard=unnamedplus
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

call plug#begin('~/.vim/plugged')
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'prabirshrestha/async.vim'
 Plug 'prabirshrestha/vim-lsp'
 Plug 'prabirshrestha/asyncomplete.vim'
 Plug 'prabirshrestha/asyncomplete-lsp.vim'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'preservim/tagbar'
 Plug 'Shougo/vimproc.vim', {'do' : 'make'}
 Plug 'hashivim/vim-terraform'
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'airblade/vim-gitgutter'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plug 'ryanoasis/vim-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'andymass/vim-matchup'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:coc_disable_startup_warning = 1
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

inoremap <silent><expr> <c-space> coc#refresh()

map <C-R> :FZF<CR>
map <C-X> :NERDTreeToggle<CR>
map <C-N> :tabnew<CR>
map <C-Q> :tabclose<CR>
map <C-T> :tabnext<CR>
