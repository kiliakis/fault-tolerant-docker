# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable tab completion
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

# colors!
green="\[\e[0;32m\]"
green_bold="\[\e[1;32m\]"
blue="\[\e[0;34m\]"
blue_bold="\[\e[1;34m\]"
purple="\[\e[0;35m\]"
purple_bold="\[\e[1;35m\]"
reset="\[\e[0m\]"
cyan="\[\e[0;36m\]"
cyan_bold="\[\e[1;36m\]"
red="\[\e[0;31m\]"
red_bold="\[\e[1;31m\]"
grey="\[\e[0;37m\]"
grey_bold="\[\e[1;37m\]"
yellow_bold="\[\e[1;33m\]"

# Change command prompt
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
# export PS1="$purple\u$blue@\h$green\$(__git_ps1)$cyan \W $ $reset"
export PS1="\n$grey\t $blue\u $green\h $red\$(__git_ps1) $purple\w \n$green→$reset "

# export PS1="$purple\u$green\$(__git_ps1)$cyan \W $ $reset"
LS_COLORS=$LS_COLORS:'ex=0;35:' ; export LS_COLORS

# export INSTALL_DIR="$HOME/install"

# export CPLUS_INCLUDE_PATH="$HOME/install/inlcude"
# export C_INCLUDE_PATH="$HOME/install/inlcude"
# export LD_LIBRARY_PATH="$HOME/install/lib"


# Add install bins to $PATH
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export RTE_SDK="$HOME/install/dpdk/build"
# GCC
# export PATH="$HOME/install/opt/gcc/gcc-6.3.0/bin:$PATH"
# export LD_LIBRARY_PATH="$HOME/install/opt/gcc/gcc-6.3.0/lib64:$LD_LIBRARY_PATH"

# MPI
# export PATH="/opt/openMPI/bin:$PATH"
# export LD_LIBRARY_PATH="/opt/openMPI/lib:$LD_LIBRARY_PATH"

# CUDA
# export PATH="$HOME/install/cuda-10/bin:$PATH"
# export LD_LIBRARY_PATH="$HOME/install/cuda-10/lib64:$LD_LIBRARY_PATH"
# export CUDA_PATH="$HOME/install/cuda-10"
# export CUDA_HOME=$CUDA_PATH

#PYTHON
# export BLONDHOME="$HOME/git/hblond"
# export PYTHONPATH="$BLONDHOME:$HOME/git/pymodules:$HOME/git/:$PYTHONPATH"

# export VIRTUAL_ENV=$HOME/venv
# source $VIRTUAL_ENV/bin/activate
