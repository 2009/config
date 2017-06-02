" ==================================================
" Shortcut Documentation
" ==================================================
" " ,    - Leader
" ;    - Substitute for :
" jj   - Esc
"
" removed ,b   - LustyJuggler buffers
" ,ev  - Open vimrc
" ,sv  - Save and reload vimrc
" ,/   - Clear search (:nohlsearch)
"
" <F2> - Toggle paste
"
" :w!! - Write read-only file with sudo
"
" <ctrl-p> - CtrlP filename search
" <ctrl-d> - CtrlP buffer filename search
" 

" ==================================================
" Plugin Documentation
" ==================================================
"
" Fugitive - Git wrapper for vim
" https://github.com/tpope/vim-fugitive
" --------------------------------------------------
" 

" ==================================================
" Vundle Bundle
" ==================================================
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

set nocompatible               " be iMproved, required!
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages all the packages for Vim:
" http://github.com/gmarik/Vundle.vim
Plugin 'gmarik/Vundle.vim'

" This plugin hooks into the git for the closest repo found within the project
" and sets up a side bar to let you know what areas of the file have changed.
" It may be a bit slow so it's disabled by default, however, it can be enabled
" on a per-project basis by using localvimrc. This link contains more  info:
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" This plugin sets up a nice, colourful statusbar at the bottom of the vim
" session which lets the user know what mode they are in and what the current
" selection and status of the text position is. The link below has more info:
" http://github.com/bling/vim-airline. Remember to set the following
" configuration such that it is enabled by default: set laststatus=2
Plugin 'bling/vim-airline'

" Deps "
Plugin 'tpope/vim-eunuch'
Plugin 'mattn/webapi-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'xolox/vim-misc'

" Provides syntax-highlighting support for HTML5 markup in Vim.
" Click here to find out more: https://github.com/othree/html5.vim
Plugin 'othree/html5.vim'

" Clojure "
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-classpath'

 " Tools "
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'

" This plugins aims to make the cursor in terminal vim behave like it does in
" gui vim (by showing a skinny line when in insert and a block otherwise) "
Plugin 'jszakmeister/vim-togglecursor'

" Provides buffer and file searching capabilities directly in Vim.
" The commands set up in this configuration are:
" - ctrl-p (files)
" - ctrl-d (buffers)
"
" Use the up and down arrows to highlight a file to pick and enter to
" open it. You can also refresh the file list by typing <leader>fuf.
" Or you can type in :CtrlPClearCache<Enter>
"
" Click here to find out more: https://github.com/kien/ctrlp.vim
Plugin 'kien/ctrlp.vim'

" .editorconfig is a file that is used across a series of code editors that
" configures itself such that spacing, tabbing and token management is as
" similar as possible. With this plugin enabled, Vim will automatically
" configure itself to match the configurations present in the .editorconfig
" file (this will only be present for the directory that contains the config).
" More Info can be found here: https://github.com/editorconfig/editorconfig-vim
Plugin 'editorconfig/editorconfig-vim'

" This plugin allows a project-specific .vimrc file to be loaded in when Vim
" is active within that directory. The filename itself must be called
" .lvimrc and Vim itself may prompt you to ask if you want to load it in.
" The prompt can be configured using 'let g:localvimrc_ask = 0'. Click here
" to find out more about this plugin: https://github.com/embear/vim-localvimrc
Plugin 'embear/vim-localvimrc'

" This plugin fills the missing feature in vim to rename a file and still keep
" the same buffer around. Use :Rename NEW_NAME to rename the existing file
" (for this to work the file itself must already be created on the
" filesystem). Click here to read more: https://github.com/danro/rename.vim
Plugin 'danro/rename.vim'

" Excellent plugin for searching text occurances of text within a directory
" using the linux `ag` command. By typing in `:Ag 'search str' ./` then Ag
" will search the existing directory for 'search str' and then display the
" list of items inside of a buffer. The link below includes more information
" on the plugin: http://github.com/epmatsw/ag.vim. This video shows how to use
" Ag with :args and :argdo to search and replace file contents within a series
" of files within a project: https://www.youtube.com/watch?v=XzN4h4dj4cE
Plugin 'epmatsw/ag.vim'

" A space-alignment tool that will evenly align the spacing between tokens
" such as :, |, ;, \ and = (you can set your own tokens as shortcuts. The
" shortcuts are typically things like <leader>a: which will align the spacing
" between and around all instances of a colon. To create you own shortcut,
" just call :Tabularize /* (where * is the token). The link below has more
" info on the plugin: https://github.com/godlygeek/tabular. (This was
" originally discovered from this Github vimrc repo: https://github.com/spf13/spf13-vim
Plugin 'godlygeek/tabular'

" Themes "
Plugin 'tpope/vim-vividchalk'
Plugin 'tomasr/molokai'

" Another really nice and colourful theme. There are multiple variations of
" this theme in terms of darkness. Click here to find out more about this
" theme: https://github.com/chriskempson/vim-tomorrow-theme
Plugin 'chriskempson/vim-tomorrow-theme'

" A dark and colourful theme created by yearofmoo which was inspired from the
" theme present in the Gedit text editor. This theme works nicely with Ruby
" and JavaScript. Click here to find out more: https://github.com/yearofmoo/Vim-Darkmate
Plugin 'yearofmoo/Vim-Darkmate'

" A nice gray and black theme with subdle gray and green colors
" works nicely with JS, HTML, CSS and Vim: https://github.com/ajh17/Spacegray.vim
Plugin 'ajh17/Spacegray.vim'

" This plugin is a visual undo viewer to see what changes have
" been made to a file: https://www.youtube.com/watch?v=vP4gEOUz4WM
Plugin 'sjl/gundo.vim'

" A Plugin to manage snippets located under ~/.vim/snippets
" Bundle garbas/vim-snipmate

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Show autocomplete automatically
Bundle 'Valloric/YouCompleteMe'

" Awesome typescript features, requires Typescript npm module to be installed
" See the help for more info.
Bundle 'Quramy/tsuquyomi'

" Typescript syntax highlighting and indentation
Plugin 'leafgarland/typescript-vim'

" This plugin allows for blocks of code to be wrapped in characters,
" tags and more: https://github.com/tpope/vim-surround
Bundle "tpope/vim-surround"

" This plugin allows a scratch buffer to exist which can be used to write
" down notes without effecting other bueffers: https://github.com/mtth/scratch.vim
" use :Scratch or gs to open up the scratch buffer
Bundle "mtth/scratch.vim"

"Bundle 'altercation/vim-colors-solarized'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'LustyJuggler'

"Bundle 'git://git.wincent.com/command-t.git'

call vundle#end()           " required!
filetype plugin indent on   " required!

" ==================================================
" Plugin Setup
" ==================================================

" Ultisnips
set runtimepath+=~/.vim/bundle/UltiSnips

" UltiSnips triggers
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" Ctrlp root markers
let g:ctrlp_root_markers = ['.ctrlp']

" Ctrlp custom ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|tmp\|dist'
let g:ctrlp_show_hidden = 1

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

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" CtrlP
map <C-b> :CtrlPBuffer<CR>

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
set cursorline " Highlight the cursor line
set visualbell "No sounds
set autoread "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Set the terminal to use z-shell
" (use -l since the interactive mode always fails)
set shell=/bin/zsh\ -l

" ================ Search Settings =================

set incsearch "Find the next match as we type the search
set hlsearch "Highlight searches by default
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

" stuff to ignore with tab completing
set wildignore=*.o,*.obj,*~
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

" ================ File Types =======================
au BufNewFile,BufRead *.ts.js set syn=javascript
au BufNewFile,BufRead *.ts set syn=javascript

" ================ Theme ========================

"set t_Co=256 " Fix colors in terminal vim
"set background=dark
"let g:solarized_termcolors=256
"let base16colorspace=256
"colorscheme solarized

"let g:spacegray_italicize_comments = 1
colorscheme spacegray

" Add a different color for the cursor line
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
hi CursorLine guibg=#000000 ctermbg=0 gui=none
"hi SignColumn guibg=#333333 ctermbg=235

" ================ Statusbar ========================
"
set laststatus=2 " Always show the status line
let g:airline#extensions#tabline#enabled = 1 " Enable buffer line
let g:airline_powerline_fonts = 1 " Enable powerline symbols

" Customise vim-airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

" =========== Project Specific .vimrc =================
" Allows for adding a .vimrc in a directory that will be started
" when running vim from that directory.
set exrc
set secure

