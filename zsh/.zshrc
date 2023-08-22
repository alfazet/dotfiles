# NEVER USE "~" instead of $HOME in env variables
export ZSH="$HOME/.local/share/oh-my-zsh"
ZSH_THEME="theunraveler"

# plugins
source $HOME/.local/share/oh-my-zsh/plugins/zsh-syntax-highlighting/themes/rose-pine-zsh-syntax-highlighting.zsh
plugins=(zsh-syntax-highlighting zsh-autosuggestions pass safe-paste themes copypath z)

# plugin configs
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export ZSHZ_DATA="$HOME/.cache/z-cache"

source $ZSH/oh-my-zsh.sh

# aliases
alias vim='nvim'
alias ls='exa --all --icons --group-directories-first'
alias ll='exa --all --icons --group-directories-first -l --git'
alias rip='rip --graveyard ~/.local/share/trash'
alias wget='wget --hsts-file="~/.cache/wget-hsts"'
alias ff="cd ~/Documents && cd \$(find ~/Documents -type d \( -name debug -o -name .git \) -prune -o -name '*' -type d -print | fzf)"

# keymaps
bindkey "^[[1;3C" forward-word # <Alt-Right>
bindkey "^[[1;3D" backward-word # <Alt-Left>
bindkey '^ ' autosuggest-accept

ZSH_DISABLE_COMPFIX=true
unsetopt IGNORE_EOF 
autoload -Uz compinit
compinit

precmd() {
    precmd() {
        echo
    }
}
