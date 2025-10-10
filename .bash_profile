# ~/.bash_profile is sourced by ~/.zshrc
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load aliases
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Empty for now
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Start fzf
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && source /opt/homebrew/opt/asdf/libexec/asdf.sh # Use asdf via ZSH and Homebrew

export TERM="screen-256color"
export HOMEBREW_NO_AUTO_UPDATE=1
# For accessing rhoboat/dotfiles repo
export GITHUB_PAT="" # redacted
# Make docker builds readable on black background
export BUILDKIT_PROGRESS=plain

# Prepend to PATH
PYVER=3.12
PYTHON_ROOT="/Library/Frameworks/Python.framework/Versions/3.12"
PYTHON_ROOT2="/Users/rsang5/Library/Python/3.12/bin"
export PATH="$PYTHON_ROOT/bin:$PYTHON_ROOT2:$PATH"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH=/usr/local/sbin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Application Support/Mozilla/NativeMessagingHosts/:$PATH"
# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

# Append to PATH
export PATH="$PATH:/usr/local/bin/go"

# Set GOROOT and GOPATH here.
# They are appended to PATH in ~/.zshrc to make sure they're the last things appended to PATH.
export GOROOT="$(asdf where golang)/go/"
export GOPATH=$HOME/Development/Go
# Stop that error in vim-go where gopls doesn't have GOBIN set.
export GOBIN="/usr/local/go/bin/go"
# Stop that frustrating error when running go get
#export GOPRIVATE=github.com/gruntwork-io

# Run this to allow Mac OS to install apps from anywhere
# sudo spctl --master-disable
