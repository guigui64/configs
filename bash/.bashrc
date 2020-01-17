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
HISTSIZE=1000000
HISTFILESIZE=2000000

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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

# Configs path
CONFIG_ROOT="$HOME/git/configs"

# Git
. ${CONFIG_ROOT}/git/git-completion.bash
. ${CONFIG_ROOT}/git/git-prompt.sh

# Detect work environment
[[ -f ~/.work-env ]] && export WORKENV=true

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUPSTREAM=0
# export PS1=$PS1'\[\033[1;35m\]$(__git_ps1 "(%s)")\[\033[00m\] '

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]$(_shortpath $PWD)\[\033[1;35m\]$(__git_ps1 "(%s)")\[\033[00m\]$ '
else
	PS1='${debian_chroot:+($debian_chroot)}$(_shortpath $PWD)$(__git_ps1 "(%s)")$ '
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
    alias ls='ls --color=auto --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls --group-directories-first'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -halF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_functions ] && source ~/.bash_functions

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

# Use Vi style commands on the shell (in insert mode by defualt)
set -o vi
# switch back to emacs : set -o emacs
# Clear screen with C-l also in insert mode
bind -m vi-insert "\C-l":clear-screen

# Java
export JAVA_HOME=/usr/java/default

# PATH
export PATH=$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/eclipse:$HOME/git/scripts:$JAVA_HOME/bin:$PATH

# VIM
export VISUAL=vim
export EDITOR=vim

# Enable the **/* globstar
shopt -s globstar

# Conversion functions
h2d(){
    echo "ibase=16; $@"|bc
}
d2h(){
    echo "obase=16; $@"|bc
}

# Go
#export GOPATH=$HOME/golang/nonstd
#export GOROOT=$HOME/golang/go
#export PATH=$GOROOT/bin:$PATH

# CORE
ulimit -c unlimited

# ANT
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export ANT_OPTS='-Dant.logger.defaults=$HOME/.ant-colors'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by Anaconda3 installer
#export PATH="/home/comte/anaconda3/bin:$PATH"

# Tmux
. ${CONFIG_ROOT}/tmux/tmux-completion.bash
# Install Ruby Gems to ~/gems
#export GEM_HOME="$HOME/gems"
#export PATH="$HOME/gems/bin:$PATH"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add my Python to PATH
[[ $WORKENV ]] && \
	export PATH=$HOME/python-3.6.9/bin:$PATH && \
	export LD_LIBRARY_PATH=$HOME/python-3.6.9/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Pipenv completion
eval "$(pipenv --completion)"

# Finally some joke to begin the shell laughing ;)
hash pyjoke 2> /dev/null && pyjoke

