# Based on "The Unraveler" from oh-my-zsh

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

PROMPT='%F{magenta}[%~] %F{white}%% '
RPROMPT='%F{yellow}${vcs_info_msg_0_}'
