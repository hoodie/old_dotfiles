# ~/.bashrc: executed by bash(1) for non-login shells.

fortune;

# Check for an interactive session
[ -z "$PS1" ] && return

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

PS1="${lightgreen}\u${white}:${BLUE}\w${white}$ " 
PS2="${NC}--> ${white}"

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


# Functions
mkcd() { mkdir -p "$@" && cd "$_"; }
vcp() { find $1/ \( -type d -exec mkdir -p $2/{}  \; \) -o \( -type f -exec ln {} $2/{}  \; \); }
wmp2ogg() { find . -iname '*wma' \( -exec ffmpeg -i {} -acodec vorbis -aq 5  {}.ogg \; \);  }
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf $1    ;;
			*.tar.gz)    tar xvzf $1    ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       rar x $1       ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xvf $1     ;;
			*.tbz2)      tar xvjf $1    ;;
			*.tgz)       tar xvzf $1    ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)           echo "don't know how to extract '$1'..." ;;
	esac
	else
		echo "'$1' is not a valid file!"
			fi
}




# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Flex-Geraffel
export FLEX_HOME=/opt/flex-sdk
export PATH=$PATH:$FLEX_HOME/bin/
