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
 Bundle 'vim-scripts/wombat256.vim'
 "Bundle 'Lokaltog/vim-easymotion'
 "Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 "Bundle 'L9'
 "Bundle 'FuzzyFinder'
 " non github repos
 "Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

 syntax on
 set number

 " Search options
 set incsearch
 set hlsearch
 
 " Indent options
 set tabstop=2
 set shiftwidth=2
 set shiftround
 set expandtab
 set autoindent

 " Theme options
 set background=dark
 let g:solarized_termcolors=256
 let base16colorspace=256
 colorscheme solarized
