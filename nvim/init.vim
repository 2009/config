set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" ALWAYS use the clipboard for ALL operations (instead of '+' and/or '*' explicitly)
set clipboard+=unnamedplus
