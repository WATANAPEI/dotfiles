#######################################
## ENV
export LANG=ja_JP.UTF-8

## path setting
# path=(~/bin(N-/) /usr/local/bin(N-/) ${path})

# enable color settings
autoload -Uz colors
colors

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# prompt
# 1 line
# PROMPT="%{${fg[white]}%}[%n@%m]%{${reset_color}%}"
PROMPT="%{${fg[blue]}%}%~%{${reset_color}%}
> "

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
alias lc='ls -hal -G'
if [[ `uname -a` =~ Linux && `uname -a` =~ Microsoft ]]; then
    alias lc='ls -hal --color=auto'
fi

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
# use command only for WSL
if [[ `uname -a` =~ Linux && `uname -a` =~ Microsoft ]]; then
    export DISPLAY=localhost:0.0
fi
# ruby setting
export GEM_HOME=~/.gem
# export EDITOR=vim
# add ruby/bin
export PATH=$PATH:~/.gem/bin
# nvim deoplete setting
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

# alias for docker
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dce='docker container exec -it'
alias dcup='docker-compose up -d'

# alias for vimdiff
alias vimdiff='nvim -d '

# alias for git
alias gac='git add . && git commit -v'
alias gp='git push'

# add cbc(original compiler)
export PATH=$PATH:/usr/local/cbc/bin

# fzf settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#include current directory into link search path
export LD_LIBRARY_PATH=.

#execute mkdir and cd
function mdc() {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

# find latest neovim
[ -f ~/downloads/nvim.appimage ] && alias nvim='~/downloads/nvim.appimage'

# add docker settings
export PATH=~/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

# add llvm path
export PATH=$PATH:~/src/llvm/llvm-project/build/bin

# add jdk path
export PATH=$PATH=~/.jdks/openjdk-14.0.1/bin
export JAVA_HOME=~/.jdks/openjdk-14.0.1
# launch tmux
tmux

# nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
