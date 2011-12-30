# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi
if [ -f $HOME/.bash_profile ]; then
	source ~/.bash_profile
fi
alias quickfind='find -iname \*|xargs grep -il'
alias ssh-session-update='source /tmp/.ssh'
alias g='git'
alias gqview='geeqie'
agent=$(pidof ssh-agent)
if [ ! $agent ]; then
    ssh-agent > /tmp/.ssh
    ssh-session-update
fi
if [ ! $SSH_AUTH_SOCK ]; then
    ssh-session-update 2>&1 1>/dev/null
fi
#fuck
# Put your fun stuff here.
