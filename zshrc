# .zshrc


# -------------- VARIABLES -------------- #

# Prevent duplicate command history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"

# Create Aliases

# BREWFILEPATH="$HOME/.dotfiles/Brewfile"

alias ls='eza --color=always --long --git --no-filesize --no-time --no-permissions --no-user'
alias bbd='echo "Updating Brewfile..." && brew bundle dump --force --describe --file=~/.dotfiles/Brewfile && echo "Complete!"'
alias trail='<<<${(F)path}'
alias ..='z ..'
alias ...='z ../..'
alias rm='trash'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias so='source ~/.zshrc'
alias t='~/.local/bin/tmux-sessionizer.zsh'
alias lg='lazygit'
alias cl='clear'
alias ssh='TERM=xterm-256color ssh'
alias cd='z'

# Git Aliases

alias g='git'
alias gl='git log --graph --oneline --all'
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias gsw='git switch'


# Customize Prompt(s)
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/theme.omp.toml)"
fi

# Add Locations to $path array
typeset -U path
path=(
    "$N_PREFIX/bin"
    $path
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    "$HOME/go/bin"
)

# -------------- FUNCTIONS -------------- #

# Make and enter new directory
function fn_make_and_enter_dir() {
    mkdir -p "$@" && cd "$_";
}
alias mkcd="fn_make_and_enter_dir"

# -------------- PLUGINS -------------- #


autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=black'

# FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)             fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset)   fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh)            fzf --preview "dig {}" "$@" ;;
        *)              fzf --preview "bat -n --color-always --line-range :500 {}" "$@" ;;
    esac
}

export FZF_DEFAULT_OPTS='
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#deae57,marker:#e153cb
  --color=prompt:#deae57,spinner:#af5fff,pointer:#deae57,header:#ffffff
  --prompt="> " --marker="*"
  --pointer="⋅" --separator="─" --layout="reverse" --header-first
  --info="right"'

# Set zsh-syntax-highlighting colors

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=blue
ZSH_HIGHLIGHT_STYLES[alias]=none
ZSH_HIGHLIGHT_STYLES[builtin]=none
ZSH_HIGHLIGHT_STYLES[function]=none
ZSH_HIGHLIGHT_STYLES[command]=none
ZSH_HIGHLIGHT_STYLES[precommand]=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=none
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[globbing]=none
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none

# Zoxide

eval "$(zoxide init zsh)"

# thefuck

eval $(thefuck --alias)
eval $(thefuck --alias fk)
