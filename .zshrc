# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gozilla"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler macos ruby rake shrink-path)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source $HOME/.bash_profile

# gozilla theme:
# PROMPT='%{$fg_bold[red]%}%* %{$fg[blue]%}%(5~|%-1~/…/%1>>%3~%<</%1>>%2~%<</%1~|%4~) %{$fg_bold[grey]%}$(git_prompt_info)%{$fg[blue]%} % %{$reset_color%}'
setopt prompt_subst
PROMPT='%{$fg_bold[red]%}%* %{$fg[blue]%}$(shrink_path -f) %{$fg_bold[grey]%}$(git_prompt_info)%{$fg[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='$(git_prompt_status)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[grey]%} ✱"

# Add autocompletion for exercism
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  . ~/.config/exercism/exercism_completion.zsh
fi

# This might fix the no matches found issue when I try to use regex in zsh
unsetopt nomatch

# Starting fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `pipx` on 2021-07-09 15:45:45
export PATH="$PATH:/Users/rhozen/.local/bin"

# Add go and RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.rvm/bin"

# Use asdf via ZSH and Homebrew
. /usr/local/opt/asdf/libexec/asdf.sh
