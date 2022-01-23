# Almost like Simple
SKOVHUS_COLOR_BASE="%{$fg[green]%}"
SKOVHUS_COLOR_GIT="%{$fg[blue]%}"

# 2~ shows the current and the parent folder
PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%2~%{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
