alias vim='/usr/local/bin/vim'
devDir="$HOME/Development"
alias lisp='cd $devDir/courses/cs325-lisp'
alias dev='cd $devDir/apps'
alias work='cd $devDir/apps/mediavine'
alias think='cd $devDir/apps/play/nodejs_sample'
alias play='cd $devDir/apps/play'
alias upcase='cd $devDir/apps/play/upcase'
alias golang='cd $devDir/go/src'
alias b='bundle exec'
alias bg='bundle exec guard'

alias gp='git push'
alias gpgh='git push github'
alias gu='git pull'
alias gug='git pull github'
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit --all --date=local'
alias gs='git status'
alias gb='git branch'
alias gls='git ls-files'
alias grr='git remote rename origin github'
alias grrr='git remote rename upstream github'
alias grv='git remote -v'
alias gunstage='git reset HEAD'
alias gign='git ls-files -o -i --exclude-standard'
alias gpr='f() { gco -q master; git branch -Dq pr/$1; git fetch github pull/$1/head:pr/$1 && gco -q pr/$1; };f'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -s "/Users/archanasriram/.jabba/jabba.sh" ] && source "/Users/archanasriram/.jabba/jabba.sh"
