cd $HOME/config

echo "Fetching git submodules"

git submodule init
git submodule update

echo "Creating link files"

ln -s ~/config/awesome ~/.config/awesome
ln -s ~/config/gitconfig ~/.gitconfig
ln -s ~/config/zshrc ~/.zshrc
ln -s ~/config/oh-my-zsh ~/.oh-my-zsh
ln -s ~/config/vim ~/.vim
ln -s ~/config/vimrc ~/.vimrc

echo "Installing vim bundles"

vim +PluginInstall +qall
