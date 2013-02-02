# Installation #

1. Clone the repo to ~/configs.
2. Initialise git submodules.

    git submodule init
    git submodule update

3. Create symlinks and install deps based on the following sections.

## urxvt terminal ##

deps: urxvt-tabbedex

    ln -s ~/config/Xdefaults ~/.Xdefaults

## awesome ##

    ln -s ~/config/awesome ~/.config/awesome

## git ##

    ln -s ~/config/gitconfig ~/.gitconfig

## zsh ##

Set default shell to zsh, if needed:
    chsh -s /bin/zsh

    ln -s ~/config/zshrc ~/.zshrc
    ln -s ~/config/oh-my-zsh ~/.oh-my-zsh

## vim ##

    ln -s ~/config/vim ~/.vim
    ln -s ~/config/vimrc ~/.vim

Install vundle bundles:
    vim +BundleInstall +qall
