# vim: filetype=bash

_shortpath() {
    echo "$1" | sed "s:$HOME:~:" | sed -r "s:(\w)[^/]+/:\1/:g"
}

_git_summary() {
    changes=$(git diff --shortstat | sed 's/^[^0-9]*\([0-9]*\)[^0-9]*\([0-9]*\)[^0-9]*\([0-9]*\)[^0-9]*/~\1+\2-\3/')
    [ -n $changes ] && changes=" $changes"
    status=$(git rev-parse --abbrev-ref HEAD)
    echo "$status$changes"
}

# Conversion functions
h2d(){
    echo "ibase=16; $*"|bc
}
d2h(){
    echo "obase=16; $*"|bc
}

# find-in-file - usage: fif <SEARCH_TERM>
fif() {
  if [ ! "$#" -gt 0 ]; then
    echo "Need a string to search for!";
    return 1;
  fi
  rg --files-with-matches --no-messages "$1" | fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}

# changelog from git log
# usage: changelog <ORIGIN>
changelog() {
  if [ ! "$#" -gt 0 ]; then
      echo "Need an origin for the changelog (i.e. origin/master)";
    return 1;
  fi
  git log --grep="Closes" $1.. | grep -B2 "Closes" | sed -E -e 's/^\s*//' -e '/^$/d' -e '/^--$/d' -e 's/Closes (.+)/* \1/' -e 's/Resolve "(.+)"/\1/' | tac | awk '/^*/{ printf("%s : ", $0); next } 1' | tac
}

# if WORKENV is set
if [ ! -z "$WORKENV" ] ; then

    # MOBA
    moba-gnome-terminal() {
        #/usr/lib/gnome-terminal/gnome-terminal-server --app-id moba.Terminal &
        gnome-terminal --app-id moba.Terminal
    }

fi
