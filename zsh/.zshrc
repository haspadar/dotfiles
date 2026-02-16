# ============================================================
# Powerlevel10k instant prompt (must stay at very top)
# ============================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================
# Environment
# ============================================================

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# History behavior
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY

# Ctrl+W deletes by path segments
WORDCHARS=${WORDCHARS//\/}

# BSD ls colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Load aliases / functions
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.functions ]] && source ~/.functions

# Docker completions
[[ -d "$HOME/.docker/completions" ]] && fpath=("$HOME/.docker/completions" $fpath)

# ============================================================
# Completion
# ============================================================
autoload -Uz compinit
compinit -C

zmodload zsh/complist
bindkey '^I' menu-complete

zstyle ':completion:*' menu select
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' quote-style single

# ============================================================
# Autosuggestions
# ============================================================
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ============================================================
# Syntax highlighting
# ============================================================
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ============================================================
# zoxide (directory jumper)
# ============================================================
eval "$(zoxide init zsh)"

# ============================================================
# Prompt
# ============================================================
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ============================================================
# Keybindings
# ============================================================
bindkey -e

# Fish-like history prefix search
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[A' history-beginning-search-backward-end
bindkey '^[[B' history-beginning-search-forward-end

# Word movement
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[^?' backward-kill-word

