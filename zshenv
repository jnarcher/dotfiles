
echo 'Hello from .zshenv'

# Check if command exists
function exists() {
  command -v $1 >/dev/null 2>&1
}