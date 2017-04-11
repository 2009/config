cd $HOME/config

echo "Fetching git submodules"

git submodule update --init --recursive

echo "Creating link files"

[ -d $HOME/.config ] || mkdir $HOME/.config

ln -sn $HOME/config/termite   $HOME/.config/termite
ln -sn $HOME/config/awesome   $HOME/.config/awesome
ln -sn $HOME/config/gitconfig $HOME/.gitconfig
ln -sn $HOME/config/zshrc     $HOME/.zshrc
ln -sn $HOME/config/oh-my-zsh $HOME/.oh-my-zsh
ln -sn $HOME/config/vim       $HOME/.vim
ln -sn $HOME/config/vimrc     $HOME/.vimrc
ln -sn $HOME/config/ranger    $HOME/.config/ranger
ln -sn $HOME/config/dircolors $HOME/.dircolors
ln -sn $HOME/config/weechat   $HOME/.weechat

echo "Installing vim bundles"

vim -e +PluginInstall +qall
