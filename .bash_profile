# ~/.bash_profile is sourced by ~/.zshrc
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load aliases
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

export TERM="screen-256color"
export HOMEBREW_NO_AUTO_UPDATE=1

# Prepend to PATH
export PATH=/usr/local/sbin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Library/Application Support/Mozilla/NativeMessagingHosts/:$PATH"
# Use the Homebrew version of git rather than system installed git
export PATH="/usr/local/bin:$PATH"
# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"

# Append to PATH
export PATH="$PATH:/usr/local/bin/go"

# Set GOROOT and GOPATH here.
# They are appended to PATH in ~/.zshrc
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/Development/Go
# Stop that frustrating error when running go get
export GOPRIVATE=github.com/gruntwork-io

# Run this to allow Mac OS to install apps from anywhere
# sudo spctl --master-disable
