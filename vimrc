" ==================================================
" Shortcut Documentation
" ==================================================
"
" ,    - Leader
" ;    - Substitute for :
" jj   - Esc
"
" ,b   - LustyJuggler buffers
" ,ev  - Open vimrc
" ,sv  - Save and reload vimrc
" ,/   - Clear search (:nohlsearch)
"
" <F2> - Toggle paste
"
" :w!! - Write read-only file with sudo


" ==================================================
" Vundle Bundles
" ==================================================

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'millermedeiros/vim-statline'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" vim-scripts repos
Bundle 'UltiSnips'
Bundle 'LustyJuggler'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on    " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ==================================================
" Plugin Setup
" ==================================================

" Ultisnips
set runtimepath+=~/.vim/bundle/UltiSnips

" ==================================================
" Key Mappings
" ==================================================

" Change the mapleader from \ to ,
let mapleader=","

" Remove the need to hold shift
nnoremap ; :

" Maps for jj to act as Esc
ino jj <esc>
cno jj <c-c>

" Clear search
nmap <silent> <Leader>/ :nohlsearch<CR>

" Remap LustyJuggler key
nmap <silent> <Leader>b :LustyJuggler<CR>

" Don't skip wrapped lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable arrow key
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set pastetoggle=<F2>

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" ================ Write non-sudo files ==============

" Allows saving files not opened with sudo
cmap w!! w !sudo tee % >/dev/null

" ================ Edit/Reload Vimrc =================

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ================ General Config ====================

set number "Line numbers
set backspace=indent,eol,start "Allow backspace in insert mode
set history=1000 "Store lots of :cmdline history
set showcmd "Show incomplete cmds down the bottom
set showmode "Show current mode down the bottom
set gcr=a:blinkon0 "Disable cursor blink
set visualbell "No sounds
set autoread "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ================ Search Settings =================

set incsearch "Find the next match as we type the search
set hlsearch "Hilight searches by default
set ignorecase "Ignore case when searching
set smartcase " Ignore case if search pattern is all lowercase,
              " case-sensitive otherwise
set viminfo='100,f1 "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap "Don't wrap lines
set linebreak "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Theme ========================

set t_Co=256
set background=dark
let g:solarized_termcolors=256
"let base16colorspace=256
colorscheme solarized

" ================ Statusline ========================

set laststatus=2
