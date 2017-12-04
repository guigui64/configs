alias df='df -Th --total'
alias du='du -h'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir='mkdir -pv'
alias gg='gitg &'
alias gototop='cd `git toplvl`'

# SIMTG
alias simgdb='for core in `ls -t core*`; do echo "### Debug with core : $core ###"; gdb /tools/simtg/simtg/Ubuntu_16.04/64bit/simtg_2.11.0/simtgCorba $core; break; done;'
alias cachefree='free -h && sync && sudo sh -c "echo 3 > /proc/sys/vm/drop_caches" && free -h'
alias simtgCorbaPids='ps x | grep simtgCorba | grep -v grep | awk "{ print $1 }"'

# OBC
alias cdobc='cd ~/workspace/obc'

# JUICE
alias juice='launch-eclipse.sh -v JUICE -w ~/workspaceJUICE/ $*'
alias cdjuice='cd ~/workspaceJUICE'
alias cdcdmu='cd ~/workspaceJUICE/cdmu'
alias cdapl='cd ~/Documents/JUICE/APL'
