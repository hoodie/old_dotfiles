# ~/.bashrc: executed by bash(1) for non-login shells.

# Check for an interactive session
[ -z "$PS1" ] && return

# Colors
alias ls='ls --color=auto'
alias grep='grep --color=always'

PS1='\[\033[00;92m\]\u\[\033[00;92m\]@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='\[\033[01;32m\]\u               @\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
NC='\[\033[0m\]'      # no color
black='\[\e[0;30m\]'
BLACK='\[\e[1;30m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
magenta='\[\e[0;35m\]'
MAGENTA='\[\e[1;35m\]'
white='\[\e[0;37m\]'
WHITE='\[\e[1;37m\]'


# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Functions
mkcd() { mkdir -p "$@" && cd "$_"; }
vcp() { find $1/ \( -type d -exec mkdir -p $2/{}  \; \) -o \( -type f -exec ln {} $2/{}  \; \); }
#wmp2ogg() { find . -iname '*wma' \( -exec ffmpeg -i {} -acodec vorbis -aq 5  {}.ogg \; \)  }

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Flex-Geraffel
export FLEX_HOME=/opt/flex-sdk
export PATH=$PATH:$FLEX_HOME/bin/
