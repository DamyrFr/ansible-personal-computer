runtime! debian.vim

"set compatible
filetype plugin indent on
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
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
colorscheme elflord

if has("autocmd")
    autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" Plugin '.vim/bundle/nerdtree'
" Plugin '.vim/bundle/vim-powerline'
Bundle 'nerdtree'
Bundle 'vim-powerline'
map <C-X> :NERDTreeToggle<CR>
