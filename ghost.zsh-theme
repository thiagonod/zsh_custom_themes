# ghost theme https://github.com/thiagonod/zsh_custom_themes

setopt prompt_subst

() {

local PR_HOST
# SSH?
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{cyan}%M%f' # no SSH
fi
local prompt_string="%(?:%F{blue}»%f:%F{red}»%f)"
local return_code="%(?..%F{red}err:%? ↵%f)"
local user_name="%B%F{cyan}λ%f%b"
local user_host="${PR_HOST}" 
local current_dir="%B%F{blue}%2./%f%b"
local git_branch='$(git_prompt_info)'
local prompt_time="%F{white}%T%f"

PROMPT="${user_name} ${current_dir}${git_branch} ${prompt_string} "
RPROMPT="${return_code} ${user_host} ${prompt_time}"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{white}%f%b%F{blue}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{blue}/%f%b%B%F{yellow}✘%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{blue}/%f%b"

}
