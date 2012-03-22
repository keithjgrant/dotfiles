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
#zstyle ':vcs_info:*' stagedstr $'%F{magenta}●'
#zstyle ':vcs_info:*' unstagedstr '%F{green}●'
#zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn

# Show current git branch and dots indicating uncommitted changes
# (requires staged info above -- a little slow)
#precmd () { 
#    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
#        zstyle ':vcs_info:*' formats $'[%{\e[1;33m%}%b%F{foreground}:%c%u%F{foreground}] '
#    } else {
#        zstyle ':vcs_info:*' formats $'(%{\e[1;33m%}%b%F{foreground}:%c%u%F{yellow}●%F{foreground}) '
#    }
#    vcs_info
#}

# Show current git branch name only
precmd () { 
    zstyle ':vcs_info:*' formats $'\{%{\e[0;36m%}%b%F{foreground}%c%u%F{foreground}\} '
    vcs_info
}
local git='$vcs_info_msg_0_'

# Custom status line
PS1="$(active_virtualenv)${git}${fg_lblue}%~:\$${fg_default} "

# Show a green $ on the status line when vim mode is -- INSERT --
function zle-line-init zle-keymap-select {
    PS1="$(active_virtualenv)${git}${fg_lblue}%~:\$${fg_default} "
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

cd ~/sq
. /opt/shootq/sq_py_env/bin/activate
