# Installation #

1. Clone the repo to ~/config.
2. Initialise git submodules.

    ```
    git submodule init
    git submodule update
    ```

3. Create symlinks and install deps based on the following sections.

## urxvt terminal ##

```
ln -s ~/config/Xdefaults ~/.Xdefaults
```

## awesome ##

```
ln -s ~/config/awesome ~/.config/awesome
```

## dwb ##

```
ln -s ~/config/dwb ~/.config/dwb
```

## git ##

```
ln -s ~/config/gitconfig ~/.gitconfig
```

## zsh ##

Set default shell to zsh, if needed:
    `chsh -s /bin/zsh`

```
ln -s ~/config/zshrc ~/.zshrc
ln -s ~/config/oh-my-zsh ~/.oh-my-zsh
```

## tmux ##

```
ln -s ~/config/tmux.conf ~/.tmux.conf
```

## vim ##

```
ln -s ~/config/vim ~/.vim
ln -s ~/config/vimrc ~/.vimrc
```

Install vundle bundles by running `:BundleInstall` in vim

NOTE: Sparkup requires python2, you may need to modify the following line in sparkup.py:
    `#!/usr/bin/env python`
    
To:
    `#!/usr/bin/env python2`

# Addition Configuration #

## Disable Caps Lock ##

Used to disable caps lock.

Add the following to .xinitrc:
    `setxkbmap -option caps:none`
