alias df='df -Th --total'
alias du='du -h'
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir='mkdir -pv'
alias gg='gitg &'
alias gs='git status'
alias gl='git lga'
alias gototop='cd `git toplvl`'
functionCloneGithub() {
    git clone git@github.com:guigui64/$1
}
alias clgh='functionCloneGithub'
alias gs='git status'
alias gss='git status -s'
alias gl='git lga'

# Go
alias cdgosrcs='cd golang/nonstd/src/github.com/guigui64/'
