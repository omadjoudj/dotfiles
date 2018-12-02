. /etc/profile.d/global_custom.sh
alias x='startx'

export EDITOR=vim

case "$TERM" in
    screen*) PROMPT_COMMAND='echo -ne "\033k\033\0134"'
esac
