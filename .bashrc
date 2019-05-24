#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. /etc/profile.d/custom.sh

export EDITOR=vim
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias x='startx'
#alias screen='tmux'


case "$TERM" in
    screen*) PROMPT_COMMAND='echo -ne "\033k\033\0134"'
esac
