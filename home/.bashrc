#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias y='yaourt'
alias t='todo.sh -d ~/.todo.cfg'

PS1='[\u@\h \W]\$ '
