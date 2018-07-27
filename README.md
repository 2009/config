# Installation #

1. clone the repo to `~/.config`

    ```sh
    git clone git@github.com:2009/config.git $HOME/config
    ```

1. Install dependencies

    ```sh
    pacman -S vim zsh cmake python3
    ```

1. Run the setup script

    ```sh
    ./setup.sh 
    ```

## Sparkup

NOTE: Sparkup requires python2, you may need to modify the following line in sparkup.py:
    `#!/usr/bin/env python`
    
To:
    `#!/usr/bin/env python2`

# Addition Configuration #

## Disable Caps Lock ##

Used to disable caps lock.

Add the following to .xinitrc:
    `setxkbmap -option caps:none`
