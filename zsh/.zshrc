config_dir="$HOME/.config/zsh"
plugins_dir="$HOME/.config/zsh/plugins"

[[ -f "$config_dir/aliases.zsh" ]] && source "$config_dir/aliases.zsh"
[[ -f "$config_dir/theme.zsh" ]] && source "$config_dir/theme.zsh"
[[ -f "$plugins_dir/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$plugins_dir/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -f "$plugins_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$plugins_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_AUTOSUGGEST_STRATEGY=(completion)
fpath=("$plugins_dir/zsh-completions/src" $fpath)

bindkey -v
bindkey -v '^?' backward-delete-char # "normal" behavior of Backspace
bindkey -v '^R' history-incremental-search-backward
export KEYTIMEOUT=15

unsetopt IGNORE_EOF 
setopt APPEND_HISTORY

ZSH_DISABLE_COMPFIX=true
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

precmd() {
    if [[ -z $first_prompt ]]; then
        first_prompt=1
    elif [[ -n $first_prompt ]]; then
        echo
    fi
}
