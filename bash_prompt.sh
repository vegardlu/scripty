# Bash prompt

function my_bash_prompt {
    local user_and_host="\[\033[01;32m\]\u@\h"
    local cur_location="\[\033[01;34m\]\w"
    local git_branch_color="\[\033[31m\]"
    local git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local prompt_tail="\[\033[35m\]$"
    local last_color="\[\033[00m\]"
    export PS1="$user_and_host $cur_location $git_branch_color$git_branch\n$prompt_tail$last_color "
}
