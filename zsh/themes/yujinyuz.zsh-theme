local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})"
local green="%{$fg_bold[green]%}"
local red="%{$fg_bold[red]%}"
local blue="%{$fg_bold[cyan]%}"
local yellow="%{$fg_bold[yellow]%}"
PROMPT='${blue}%n${red}@${yellow}%m🐍 ${ret_status}[$?] %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
