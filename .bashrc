# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export EDITOR=vim
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias x='startx'
#alias screen='tmux'


case "$TERM" in
    screen*) PROMPT_COMMAND='echo -ne "\033k\033\0134"'
esac
