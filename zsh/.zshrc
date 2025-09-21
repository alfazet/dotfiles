config_dir="${HOME}/.config/zsh"
plugins_dir="${HOME}/.config/zsh/plugins"

theme="${config_dir}/theme.zsh"
[[ -f ${theme} ]] && source ${theme}

aliases_="${config_dir}/aliases.zsh"
[[ -f ${aliases_} ]] && source ${aliases_}

autosuggestions="${plugins_dir}/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f ${autosuggestions} ]] && source ${autosuggestions}
ZSH_AUTOSUGGEST_STRATEGY=(completion)

highlighting="${plugins_dir}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f ${highlighting} ]] && source ${highlighting}

ZSH_DISABLE_COMPFIX=true
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

bindkey -v
bindkey -v '^?' backward-delete-char
bindkey -v '^R' history-incremental-search-backward
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
export KEYTIMEOUT=15

HISTFILE="${HOME}/.local/state/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

unsetopt IGNORE_EOF
setopt INC_APPEND_HISTORY

precmd() {
    if [[ -z $first_prompt ]]; then
        first_prompt=1
    elif [[ -n $first_prompt ]]; then
        echo
    fi
}
