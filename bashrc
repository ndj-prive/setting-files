# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#Private settings
#aliasen touchpad
alias tpoff='xinput --set-prop bcm5974 "Device Enabled" 0'
alias tpon='xinput --set-prop bcm5974 "Device Enabled" 1'
alias mouse='tpoff'
alias mouseOn='tpon'

#aliasen git
alias gits='git status'
alias gs='gits'
alias gitc='git commit -a -m'
alias gc='gitc'
alias gitp='git pull'
alias gp='gitp'
alias gitpp='git push'
alias gpp='gitpp'
alias gitppm='gitpp origin master'

alias bolaf='sudo ufw enable'
alias binnen='sudo ufw disable'

alias deleteNico='rm -rf /home/nico/.sounds/*'

alias startup='sh .everydayApps &> /dev/null'
alias setwindows='sh .setwindows &> /dev/null'
alias zendserver='sudo /usr/local/zend/bin/zendctl.sh'
#alias drush='/usr/bin/php5 ~/drush/drush.php'
alias cleanssh='echo > ~/.ssh/known_hosts'
alias cd='cd'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias l='ls -h --color=auto'
#alias diskspace ='du -s -h'

alias h="history|grep --color=auto"
alias f="find . |grep --color=auto"
alias p="ps aux |grep --color=auto"
alias o="gnome-open "
alias grep='grep --color=auto'
alias rm='mv --target-directory=/home/[USER]/.Trash/'

alias du='du -h'
alias df='df -h'

alias google="google-chrome http://www.google.com/"
alias twitter="google-chrome http://www.twitter.com"
#alias wiki="google-chrome http://en.wikipedia.org/wiki/Main_Page"

wiki () {
	if [ -f $1 ] ; then
		"google-chrome http://en.wikipedia.org/wiki/$1"
	fi
}

## functions
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1;;
			*.tar.gz)    tar xzf $1;;
			*.bz2)       bunzip2 $1;;
			*.rar)       rar x $1;;
			*.gz)        gunzip $1;;
			*.tar)       tar xf $1;;
			*.tbz2)      tar xjf $1;;
			*.tgz)       tar xzf $1;;
			*.zip)       unzip $1;;
			*.Z)         uncompress $1;;
			*.7z)        7z x $1;;
			*)           echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
	  echo "'$1' is not a valid file"
	fi
}

source ~/.superprompt
