PS1="$"

# -----------------------------------------------
# Set up zsh-specifics
# -----------------------------------------------

# compinit initializes various advanced completions for zsh
autoload -U compinit && compinit

# case insensitive tab completion
unsetopt correctall

# http://www.gentoo.org/doc/en/zsh.xml - reference 
# function to determine the currently active virtualenv
function active_virtualenv() {
    if [ -z "$VIRTUAL_ENV" ]; then
        # not in a virtualenv
        return
    fi

    echo "(`basename \"$VIRTUAL_ENV\"`)"
}

fg_lblue=%{$'\e[0;34m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_white=%{$'\e[1;37m'%}
fg_default=%{$'\e[0m'%}
fg_magenta=%{$'\e[1;35m'%}
fg_cyan=%{$'\e[0;36m'%}

# version control info
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' check-for-changes false
zstyle ':vcs_info:*' enable git svn

# Show current git branch name only
zstyle ':vcs_info:*' formats "$fg_cyan%b${fg_default} "
precmd () {
    vcs_info
}
local git='$vcs_info_msg_0_'

# Custom status line
PS1="$(active_virtualenv)${git} ${fg_lblue}%~:\$${fg_default} "

cd ~/sq
. /opt/shootq/sq_py_env/bin/activate

if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
PATH=/usr/local/sbin:"${PATH}"

function clean {
    typeset to_del="$1"
    for file in `find . -name $to_del`; do rm -rf $file; done
}

alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

export EDITOR="subl"
