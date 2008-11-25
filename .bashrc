# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
PATH=${PATH}":/sbin"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$TERM" != "dumb" ]; then
	#Non-Dumb terminal
	
	# Load Dircolors, set grep and ls alias
	[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias ls='ls --color=auto'
    alias grep='grep --color'
	
	# Set colored prompt
	if [ `/usr/bin/whoami` = 'root' ]
	then
        if [ "$TERM" != 'dumb'  ] && [ -n "$BASH" ]
		then
			export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;37;44m\]\w\[\033[00m\]\$ '
		fi
		export PATH="/bin:/sbin:/usr/bin:/usr/sbin:${ROOTPATH}"
	else
        if [ "$TERM" != 'dumb'  ] && [ -n "$BASH" ]
		then
			export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;37;44m\]\w\[\033[00m\]\$ '
		fi
		export PATH="/bin:/usr/bin:${PATH}"
	fi
	
	# Export program name for screen tabs
	if [ "$TERM" == "screen" ]; then
		export PS1='\[\033k\033\\\]'$PS1
		export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
	fi
else 
	# Dumb terminal
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
# enable bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
export GTK2_RC_FILES=$HOME/.gtkrc-2.0
export EDITOR=vim

# export PS1='\[\033k\033\\\]\u@\h:\w\$ '
