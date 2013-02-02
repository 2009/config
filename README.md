# Installation #

1. Clone the repo to ~/configs.
2. Initialise git submodules.

    git submodule init
    git submodule update

3. Create symlinks and install deps based on the following sections.

## urxvt terminal ##

deps: urxvt-tabbedex

    ln -s ~/configs/Xdefaults ~/.Xdefaults

## awesome ##

    ln -s ~/configs/awesome ~/.config/awesome

## git ##

    ln -s ~/configs/gitconfig ~/.gitconfig

## zsh ##

Set default shell to zsh, if needed:
    chsh -s /bin/zsh

    ln -s ~/configs/zshrc ~/.zshrc
    ln -s ~/configs/oh-my-zsh ~/.oh-my-zsh
