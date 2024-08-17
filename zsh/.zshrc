config_dir="$HOME/.config/zsh"
plugins_dir="$HOME/.config/zsh/plugins"

[ -f "$config_dir/aliases.zsh" ] && source "$config_dir/aliases.zsh"
[ -f "$config_dir/theme.zsh" ] && source "$config_dir/theme.zsh"
[ -f "$plugins_dir/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "$plugins_dir/zsh-autosuggestions/zsh-autosuggestions.zsh"
[ -f "$plugins_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$plugins_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -f "$plugins_dir/zsh-syntax-highlighting/themes/rose-pine.zsh" ] && source "$plugins_dir/zsh-syntax-highlighting/themes/rose-pine.zsh"
ZSH_AUTOSUGGEST_STRATEGY=(completion)

bindkey -v
bindkey -v '^?' backward-delete-char # "normal" behavior of Backspace
export KEYTIMEOUT=15

unsetopt IGNORE_EOF 
setopt APPEND_HISTORY

ZSH_DISABLE_COMPFIX=true
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

precmd() {
    precmd() {
        echo
    }
}

eval "$(zoxide init zsh)"
