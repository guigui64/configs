alias df='df -Th --total'
alias du='du -h'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem="ps -o pid,user,%mem,command ax | sort -b -k3 -r -n"
alias mkdir='mkdir -pv'
alias lessn='less -N'
alias asl='awk '\''{ print $NF }'\'' | sed '\''s/*//'\'' | xargs less'
alias clock='tty-clock -sc -C 6'
alias wtree="while true; do clear ; tree -a -I 'generation|bin|build|__pycache__|node_modules|.git|*.swp' ; sleep 5 ; done"

# Clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# GIT
alias gg='gitg &'
alias gs='git status'
alias gss='git status -s'
alias gl='git lga'
alias gd='git diff'
alias gototop='cd `git toplvl`'
functionCloneGithub() {
    git clone git@github.com:guigui64/$1
}
alias clgh='functionCloneGithub'
alias wg='while (true) ; do clear ; git lga -n 15 ; echo -e "\n====\n" ; git status -s | grep -v smp2 | grep -v roject > /tmp/wg ; head -n 25 /tmp/wg ; echo -n "Nb modified : "$(cat /tmp/wg | wc -l)" ("$(git status -s | wc -l)")" ; sleep 5 ; done'
alias wgl='while (true) ; do clear ; git lga -n 15 ; sleep 5 ; done'
alias wgs='while (true) ; do clear ; git status ; sleep 5 ; done'
alias gka='gitk --all'

# Go
alias cdgosrcs='cd golang/nonstd/src/github.com/guigui64/'

# if WORKENV is set
if [ ! -z $WORKENV ] ; then

	# SIMTG
	alias simgdb='for core in `ls -t core*`; do echo "### Debug with core : $core ###"; gdb /tools/simtg/simtg/Ubuntu_16.04/64bit/simtg_2.11.0/simtgCorba $core; break; done;'
	alias cachefree='free -h && sync && sudo sh -c "echo 3 > /proc/sys/vm/drop_caches" && free -h'
	alias simtgCorbaPids='ps x | grep simtgCorba | grep -v grep | awk "{ print $1 }"'
	alias sourceSimtgEnv='. ~/git/scripts/envSimTG.sh'

fi
