# NEVER USE "~" instead of $HOME in env variables
export ZSH="$HOME/.local/share/oh-my-zsh"
ZSH_THEME="theunraveler"

# plugins
source $HOME/.local/share/oh-my-zsh/plugins/zsh-syntax-highlighting/themes/rose-pine-zsh-syntax-highlighting.zsh
plugins=(zsh-syntax-highlighting zsh-autosuggestions pass safe-paste themes copypath z)

# plugin configs
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSHZ_DATA="$HOME/.cache/z-cache"
source $ZSH/oh-my-zsh.sh

# aliases
[ -f "$HOME/.config/zsh/aliases" ] && source "$HOME/.config/zsh/aliases"

# keymaps
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
