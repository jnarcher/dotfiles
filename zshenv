# .zshenv

# Check if command exists
function exists() {
    # `command -v` is similar to `which` command
    command -v $1 >/dev/null 2>&1
}

. "$HOME/.cargo/env"

