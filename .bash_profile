[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load aliases
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

export PATH=/usr/local/sbin:$PATH
export TERM="screen-256color"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.tgenv/bin:$PATH"

export PATH="$PATH:/usr/local/bin/go"

export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/Development/Go

# Commands to run

# Run this to allow Mac OS to install apps from anywhere
# sudo spctl --master-disable
