# .zshrc

# Set Variables

# Syntax highlighting for man pages using bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat
export N_PREFIX="$HOME/.n"
export PREFIX="$N_PREFIX"

# Change ZSH Options

# Create Aliases

alias ls='exa -laFh --git'
alias bbd='echo "Updating Brewfile..." && brew bundle dump --force --describe && echo "Complete!"'
alias trail='<<<${(F)path}'

# Customize Prompt(s)
PROMPT='
%1~ %L %# '
RPROMPT='%*'


# Add Locations to $PATH Variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$N_PREFIX/bin"

# Write Handy Functions

# Make and enter new directory
function mkcd() {
  mkdir -p "$@" && cd "$_";
}

# Use ZSH Plugins
