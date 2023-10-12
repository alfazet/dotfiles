# theme
source $HOME/.config/zsh/theme.zsh

# plugins
source $HOME/.local/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh
source $HOME/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.local/share/zsh/plugins/zsh-syntax-highlighting/themes/rose-pine-zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSHZ_DATA="$HOME/.cache/z-cache"

# aliases
[ -f "$HOME/.config/zsh/aliases" ] && source "$HOME/.config/zsh/aliases"

# keymaps
bindkey -e
bindkey "^[[1;3C" forward-word # <Alt-Right>
bindkey "^[[1;3D" backward-word # <Alt-Left>
bindkey "^ " autosuggest-accept # <C-Space>

# options
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
