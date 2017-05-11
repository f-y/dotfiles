# Set up the prompt

export LANG=ja_JP.UTF-8

autoload -Uz promptinit
promptinit
prompt walters 

PROMPT='%B%(?..[%?] )%b%n@%U%m%u %D{%H:%M:%S}> '
PROMPT2=''
RPROMPT2='<heredoc'

setopt nonomatch
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias gr=$HOME/bin/gr.sh
alias 'll=ls -al'
alias "clip=xclip -selection clipboard"

export PATH=/home/fm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export GOPATH=$HOME/work
export ANDROID_STUDIO_HOME=$HOME/android-studio
export ACTIVATOR_HOME=$HOME/activator-dist-1.3.10
export PATH=$PATH:$ANDROID_STUDIO_HOME/bin:$ACTIVATOR_HOME/bin

# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^k' autosuggest-accept
bindkey '^y' autosuggest-execute

