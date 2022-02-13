#######################################
## ENV
export LANG=ja_JP.UTF-8

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# prompt
# 1 line
# PROMPT="%{${fg[white]}%}[%n@%m]%{${reset_color}%}"
PROMPT="%{${fg[blue]}%}%~%{${reset_color}%}
> "

# default colors
export LSCOLORS=dxfxcxdxbxexedabagacad

# alias
alias lal='ls -hal | less'
alias lc='ls -hal -G'
if [[ `uname -a` =~ Linux && `uname -a` =~ Microsoft ]]; then
    alias lc='ls -hal --color=auto'
fi

# alias for docker
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dce='docker container exec -it'
alias dcup='docker-compose up -d'

# alias for git
alias gac='git add . && git commit -v'
alias gp='git push'

