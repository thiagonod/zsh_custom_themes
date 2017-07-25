
# dexty theme https://github.com/thiagonod/zsh_custom_themes

local prompt_string="%(?:%F{142}»%f:%F{160}»%f)"
local user_name="%B%F{142}%n%f%b"
local current_dir="%B%F{148}%1./%f%b"
local git_branch='$(git_prompt_info)'
local rvm_ruby=''
if ${HOME}/.rvm/bin/rvm-prompt &> /dev/null; then # detect user-local rvm installation
  rvm_ruby='%F{red}‹$(${HOME}/.rvm/bin/rvm-prompt i v g s)›%f'
elif which rvm-prompt &> /dev/null; then # detect system-wide rvm installation
  rvm_ruby='%F{red}‹$(rvm-prompt i v g s)›%f'
elif which rbenv &> /dev/null; then # detect Simple Ruby Version Management
  rvm_ruby='%F{red}‹$(rbenv version | sed -e "s/ (set.*$//")›%f'
fi

PROMPT=" ${user_name} in ${current_dir}  ${rvm_ruby}
${prompt_string} "
RPROMPT="${git_branch}"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{reset_color}[%f%b%B%F{white}Ⓖ it:%f%b%F{149}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f›"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{160}✗%B%F{reset_color}]%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{154}✓%B%F{reset_color}]%f%b"
