#!/bin/bash

# ~/.bash_profile: executed by bash for login shells

export TERM=xterm-256color

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Use Vi style commands on the shell (in insert mode by defualt)
set -o vi
# switch back to emacs : set -o emacs
# Clear screen with C-l also in insert mode
bind -m vi-insert "\C-l":clear-screen

# Java
export JAVA_HOME=$HOME/java/default

# PATH
export PATH=$HOME/.local/bin:$HOME/git/configs/bin:$JAVA_HOME/bin:$PATH:/usr/local/go/bin

# VIM
export VISUAL=vim
export EDITOR=vim

# GPG prompt: use tty
export GPG_TTY=$(tty)

# CORE
ulimit -c unlimited

# ANT
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
# export ANT_OPTS='-Dant.logger.defaults=$HOME/.ant-colors'

# Pipenv completion
hash pipenv 2> /dev/null && alias complete_pipenv='eval "$(pipenv --completion)"'

# NPM completion
hash npm 2> /dev/null && alias complete_npm='eval "$(npm completion)"'

# Add Rust to PATH
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
    eval "$(rustup completions bash)"
    eval "$(rustup completions bash cargo)"
fi

# Go
if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    export PATH=$PATH:$GOPATH/bin
fi

# Thefuck completion
hash thefuck 2> /dev/null && eval "$(thefuck --alias)"

# Tabs size in terminal
tabs -4
export LESS=Rx4

# Python SSL
export REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
