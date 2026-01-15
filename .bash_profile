# ~/.bash_profile is sourced by ~/.zshrc
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load aliases
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Empty for now
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Start fzf
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && source /opt/homebrew/opt/asdf/libexec/asdf.sh # Use asdf via ZSH and Homebrew

export TERM="screen-256color"
export HOMEBREW_NO_AUTO_UPDATE=1
# For accessing rhoboat/dotfiles repo
# Redacted
export GITHUB_PAT=""
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
# export GOROOT="$(asdf where golang)/go/"
# export GOPATH=$HOME/Development/Go
# This sets both GOROOT and GOPATH:
source ~/.asdf/plugins/golang/set-env.zsh
# Stop that error in vim-go where gopls doesn't have GOBIN set.
export GOBIN="/usr/local/go/bin/go"
# Stop that frustrating error when running go get
#export GOPRIVATE=github.com/gruntwork-io

#--- Start of Amex specific things

export GOPRIVATE="*.aexp.com"

# Run this to allow Mac OS to install apps from anywhere
# sudo spctl --master-disable

# For one app https://one-app.aexp.com/docs/documentation/getting-started/initial-setup-mac
export NODEJS_ORG_MIRROR=https://artifactory.aexp.com/nodejs-proxy/
export NODE_ENV=development
export NVM_NODEJS_ORG_MIRROR=$NODEJS_ORG_MIRROR
# avoids nvm waiting for the socket to timeout
export NVM_IOJS_ORG_MIRROR=https://ci-repo.aexp.com/repository/iojs-proxy/

# Added for JetBrains Toolbox thingy
export JETBRAINS_LICENSE_SERVER="http://jetbrains.aexp.com:443"
# Java and gradle
export GRADLE_USER_HOME="/Users/rsang5/.gradle"
# for java 21
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
#export JAVA_HOME="/Users/rsang5/.asdf/installs/java/openjdk-21
# for java 17 maven uses this
#export JAVA_HOME="/Users/rsang5/.asdf/installs/java/openjdk-17.0.2"
export M2_HOME=/opt/apache-maven-3.9.9

export PATH=${M2_HOME}/bin:${PATH}

#--- End of Amex specific things

# Add go and RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.rvm/bin"

