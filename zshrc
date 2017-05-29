# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aussiegeek"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bower gem git lol npm pip rails systemd taskwarrior colored-man history)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=$PATH:/user/custom/path

# Add scripts to PATH
export PATH=$HOME/bin:$PATH

# Add node package manager to PATH
export PATH=/usr/local/share/npm/bin:$PATH

# Fix for java font rendering in Arch Linux
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# RVM
# Load rvm
source ~/.rvm/scripts/rvm
# Ignore --user-install in /etc/gemrc, this is Arch specific
#export rvm_ignore_gemrc_issues=1

# Disable corrections
unsetopt correct_all

# Set vi keybindings
# also enable command line editing in vim (<C-e><C-x>)
#bindkey -v

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      history-beginning-search-backward
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    history-beginning-search-forward
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.

if [[ -n ${terminfo[smkx]} ]] && [[ -n ${terminfo[rmkx]} ]]; then
  function zle-line-init () { echoti smkx }
  function zle-line-finish () { echoti rmkx }

  zle -N zle-line-init
  zle -N zle-line-finish
fi

export EDITOR=vim
export BROWSER=firefox

# Aliases
source $HOME/config/zsh/aliases

# Show ponysay fortune
fortune -a $ZSH/plugins/chucknorris/fortunes all | ponysay

# Don't load global ranger config as we set all variables in config/ranger/rc.conf
export RANGER_LOAD_DEFAULT_RC=FALSE

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load plugin to fix terminal titles for commands used with job control
source $HOME/config/zsh/terminal-title.zsh
