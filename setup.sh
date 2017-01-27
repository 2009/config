cd $HOME/config

echo "Fetching git submodules"

git submodule update --init --recursive

echo "Creating link files"

ln -s ~/config ~/.config
ln -s ~/config/awesome ~/.config/awesome
ln -s ~/config/gitconfig ~/.gitconfig
ln -s ~/config/zshrc ~/.zshrc
ln -s ~/config/oh-my-zsh ~/.oh-my-zsh
ln -s ~/config/vim ~/.vim
ln -s ~/config/vimrc ~/.vimrc
ln -s ~/config/ranger ~/.config/ranger
ln -s ~/config/dircolors ~/.dircolors
ln -s ~/config/weechat ~/.weechat

echo "Installing vim bundles"

vim +PluginInstall +qall
