[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load aliases
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

export PATH=/usr/local/sbin:$PATH
export TERM="screen-256color"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.tgenv/bin:$PATH"

export PATH="$PATH:/usr/local/bin/go"
export PATH="$HOME/Library/Application Support/Mozilla/NativeMessagingHosts/:$PATH"

export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/Development/Go

# Use the Homebrew version of git rather than system installed git
export PATH="/usr/local/bin:${PATH}"

# Run this to allow Mac OS to install apps from anywhere
# sudo spctl --master-disable

# Prevent anyone from spoofing commits as if using my GitHub account
if [[ -f "~/.gnupg/.gpg-agent-info" && -n "$(pgrep gpg-agent)" ]]; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf))
fi
