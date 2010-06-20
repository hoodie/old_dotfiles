# ~/.bashrc: executed by bash(1) for non-login shells.

# Check for an interactive session
[ -z "$PS1" ] && return

# Colors
alias ls='ls --color=auto'
PS1='\[\033[00;92m\]\u\[\033[00;92m\]@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Flex-Geraffel
export FLEX_HOME=/opt/flex-sdk
export PATH=$PATH:$FLEX_HOME/bin/
