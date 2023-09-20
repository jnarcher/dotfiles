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

alias ls='exa -laFh --git'
alias bbd='echo "Updating Brewfile..." && brew bundle dump --force --describe && echo "Complete!"'
alias trail='<<<${(F)path}'
alias rm=trash
alias vim='nvim'
alias v='nvim .'
alias so='source ~/.zshrc'
alias mkex='chmod +x'
alias t='~/.local/bin/tmux-sessionizer'
alias lg='lazygit'

# Customize Prompt(s)
PROMPT='%F{221}%n%f@%F{59}%m%f %1~ %F{%(?.59.red)}%#%f '


# Add Locations to $path array
typeset -U path
path=(
    "$N_PREFIX/bin"
    $path
    "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
)

# -------------- FUNCTIONS -------------- #

# Make and enter new directory
function fn_make_and_enter_dir() {
    mkdir -p "$@" && cd "$_";
}
alias mkcd="fn_make_and_enter_dir"

# -------------- PLUGINS -------------- #

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Set zsh-syntax-highlighting colors

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

eval "$(zoxide init zsh)"
