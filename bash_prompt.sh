# Bash prompt

function __prompt_command {
    local EXIT=$?
    PS1=""
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    if [ $EXIT != 0 ]; then
        PS1+="[${Red}${EXIT}] "
    else
        PS1+="[${Gre}${EXIT}] "
    fi
    local user_and_host="\[\033[01;32m\]\u@\h"
    local cur_location="\[\033[01;34m\]\w"
    local git_branch_color="\[\033[31m\]"
    local git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local prompt_tail="\[\033[35m\]$"
    local last_color="\[\033[00m\]"
    export PS1+="$user_and_host $cur_location $git_branch_color$git_branch\n$prompt_tail$last_color "
}
export PROMPT_COMMAND=__prompt_command
