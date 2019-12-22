[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load aliases
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

export PATH=/usr/local/sbin:$PATH
export TERM="screen-256color"

export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

export RUBY_VERSION=ruby-2.4.0
export MY_RUBY_HOME=$HOME/.rvm/rubies/$RUBY_VERSION
export IRBRC=$HOME/.rvm/rubies/$RUBY_VERSION/.irbrc # I am not using this
export GEM_HOME=$HOME/.rvm/gems/$RUBY_VERSION@global
export GEM_PATH=$GEM_HOME # Not sure if need this?

export GOROOT="/usr/local/opt/go/libexec"
export GOPATH=$HOME/Development/Go

# rvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"
