#!/usr/bin/env zsh
# nody theme https://github.com/thiagonod/zsh_custom_themes

local error_code="%(?..%F{160}%?:%f)"
local prompt_time="%F{8}time ⦂%f%F{white}%T%f"
local prompt_string="%(?:%F{142}»%f:%F{160}»%f)"
local git_branch='$(git_prompt_info)'


ruby_version() {
    if ${HOME}/.rvm/bin/rvm-prompt &> /dev/null; then # detect user-local rvm installation
        echo "%F{8}💎 %f%F{red}‹$(${HOME}/.rvm/bin/rvm-prompt i v g s)›%f"
    elif which rvm-prompt &> /dev/null; then # detect system-wide rvm installation
        echo "%F{8}💎 %f%F{red}‹$(rvm-prompt i v g s)›%f"
    elif which rbenv &> /dev/null; then # detect Simple Ruby Version Management
        echo "%F{8}💎 %f%F{red}‹$(rbenv version | sed -e "s/ (set.*$//")›%f"
    fi
}

prompt_info() {   
    echo " %B%F{142}‹%n›%f%b %F{8}path:%f%F{blue}%~%f"
}

calc_espace() {
    local termwidth
    (( termwidth = ${COLUMNS} - 3 - ${#HOST} - ${#$(get_pwd)} - ${bat} - ${git} ))
}

precmd() {
    print -P "\n $(prompt_info)"
}

PROMPT="${error_code}${prompt_string} "
RPROMPT="${git_branch} ${prompt_time}"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{white}%f%b%F{blue}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{blue}/%f%b%B%F{yellow}✘%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{blue}/%f%b"
