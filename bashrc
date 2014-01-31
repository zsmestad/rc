# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

set -o vi

alias l='ls -lF'
alias la='l -A'
alias lh='l -h'

alias ..='cd ..'
alias ...='cd ../..'
