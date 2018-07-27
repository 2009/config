#!/bin/bash

cd $HOME/config

echo "Fetching git submodules"

git submodule update --init --recursive

echo "Creating link files"

mkdir -p $HOME/.config
mkdir -p $HOME/.config/pulse

ln -sn $HOME/config/termite          $HOME/.config/termite
ln -sn $HOME/config/awesome          $HOME/.config/awesome
ln -sn $HOME/config/zshrc            $HOME/.zshrc
ln -sn $HOME/config/zprofile         $HOME/.zprofile
ln -sn $HOME/config/oh-my-zsh        $HOME/.oh-my-zsh
ln -sn $HOME/config/vim              $HOME/.vim
ln -sn $HOME/config/vimrc            $HOME/.vimrc
ln -sn $HOME/config/ranger           $HOME/.config/ranger
ln -sn $HOME/config/dircolors        $HOME/.dircolors
ln -sn $HOME/config/weechat          $HOME/.weechat
ln -sn $HOME/config/pulse/default.pa $HOME/.config/pulse/default.pa

echo "Installing vim bundles"

vim -e +PluginInstall +qall

echo "Building vim plugins"

function command_installed {
  command -v $1 >/dev/null 2>&1 || { echo "Please install $1 and rerun. Aborting." >&2; exit 1; }
}

command_installed cmake
command_installed python3
cd $HOME/config/vim/bundle/YouCompleteMe
./install.py

