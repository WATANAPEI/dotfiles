#######################################
## ENV
export LANG=ja_JP.UTF-8

## path setting
path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

# enable color settings
autoload -Uz colors
colors

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# prompt
# 1 line
PROMPT="%{${fg[white]}%}[%n@%m]%{${reset_color}%}"

# keybind; vim
bindkey -v
bindkey '^R' history-incremental-search-backward

zstyle :compinstall filename '~/.zshrc'

# determine the separator
autoload -Uz select-word-style
select-word-style default
# Use "/" as a separator
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unsepecified

# vcs-info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
PROMPT=$PROMPT'${vcs_info_msg_0_}'

# default colors
#export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=dxfxcxdxbxexedabagacad

autoload -Uz compinit
compinit
# alias
alias lal='ls -hal | less'
alias lc='ls -hal --color=auto'

autoload -Uz add-zsh-hook
autoload -Uz terminfo

# export nvm settings
# source ~/.nvm/nvm.sh

# go env
export PATH=$PATH:/usr/local/go/bin

# local server env
export LOCAL_SERVER_ENV='/usr/local/etc'
for i in "${LOCAL_SERVER_ENV}"/*.sh ; do
        [ -r $i ] && source $i
done

# VcXsrv setting
export DISPLAY=localhost:0.0

