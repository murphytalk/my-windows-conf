#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias y='yaourt'
alias t='todo.sh -d ~/.todo.cfg'

PS1='[\u@\h \W]\$ '

if ! echo $PS1 | grep git_ps1 >/dev/null;then
    [ -f /etc/profile.d/git-prompt.sh ] && source /etc/profile.d/git-prompt.sh
fi

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
