#!/usr/bin/env zsh
# nody theme https://github.com/thiagonod/zsh_custom_themes
#
prompt() { echo "%(?:%F{142}⧐%f:%F{160}⧐%f)" }
error_code() { echo "%(?..%F{160}%?☹%f)" }
mr() { echo "%F{142}⦉%f" }
ml() { echo "%F{142}⦊%f" }
prompt_time() { echo "%F{8}⌚ %f%F{8}%T%f" }
prompt_info() { echo "%F{8}💻 %f%B%F{142}%n%f%b %F{8}📂:%f%F{blue}%~%f" }
git_branch() {
    if [ $(git_prompt_info) ]; then
        echo '$(git_prompt_info)'
    else
        echo "%F{8}⌁%f"
    fi
}
ruby_version() {
    if ${HOME}/.rvm/bin/rvm-prompt &> /dev/null; then # detect user-local rvm installation
        echo "%F{8}💎 %f%F{red}‹$(${HOME}/.rvm/bin/rvm-prompt i v g s)›%f"
    elif which rvm-prompt &> /dev/null; then # detect system-wide rvm installation
        echo "%F{8}💎 %f%F{red}‹$(rvm-prompt i v g s)%f›"
    elif which rbenv &> /dev/null; then # detect Simple Ruby Version Management
        echo "%F{8}💎 %f%F{red}$(rbenv version | sed -e "s/ (set.*$//")%f"    
    fi
}
put_spaces() {  
    local espacos
    (( espacos = ${COLUMNS} - ${#USER} - ${#${PWD/HOME/~}} - 14 ))
    
    local spacing=""
    for i in {1..$espacos}; do
        spacing="${spacing} "
    done
    
    echo $spacing    
}

precmd() { 
    print -P "\n$(put_spaces)$(ml)$(prompt_info)  $(ruby_version)  $(prompt_time)$(mr)" 
    PROMPT="$(ml)$(git_branch) $(mr)$(prompt) "
    RPROMPT="$(error_code)"
}
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{white}⚡%f%b::%F{blue}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{202}⚠"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{82}☑"
