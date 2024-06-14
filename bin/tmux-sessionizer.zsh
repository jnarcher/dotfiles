#!/usr/bin/env zsh

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#deae57,marker:#e153cb
  --color=prompt:#deae57,spinner:#af5fff,pointer:#deae57,header:#ffffff
  --prompt="> " --marker="*"
  --pointer="⋅" --separator="─" --layout="reverse" --header-first
  --info="right"'

zoxide_paths=$(zoxide query -l)
tmux_sessions=$(tmux ls -F "#{session_name}: #{session_windows} window(s)")

selected=$(echo "$tmux_sessions\n$zoxide_paths" | fzf --header="SESSIONIZER")

if [[ -z $selected ]]; then
    echo "none selected"
    exit 1
fi

if [[ $selected == *":"* ]]; then
    # Found session
    selected_name=$(echo "$selected" | awk '{print $1}')
    selected_name=${selected_name:0:-1}
else
    selected_name=$(basename "$selected" | tr . _)
    # Only create a new session if one of the same name doesn't exists
    if ! tmux has-session -t $selected_name; then
        tmux new-session -ds $selected_name -c $selected
    fi
fi

# If not already in tmux then attach to selected
if [[ -z "$TMUX" ]]; then
    tmux attach-session -t $selected_name
    exit 0
fi

# Switch to selected/new session
tmux switch-client -t $selected_name
