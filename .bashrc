devDir="$HOME/Development"
alias vim='/usr/local/bin/vim'
alias dot='cd $devDir/dotfiles'
alias pgstart='pg_ctl -D /usr/local/var/postgres start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'

# Load work aliases
[[ -s "$HOME/.bash_work" ]] && source "$HOME/.bash_work"

# Load play aliases
[[ -s "$HOME/.bash_play" ]] && source "$HOME/.bash_play"

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
alias gas='git add --all && git status'
alias gb='git branch'
alias gss='git show --stat --oneline'
alias gls='git ls-files'
alias gra='f() { git remote add github $(git remote get-url origin); };f'
alias grr='git remote rename origin github'
alias grrr='git remote rename upstream github'
alias grv='git remote -v'
alias gunstage='git reset HEAD'
alias gign='git ls-files -o -i --exclude-standard'
alias gpr='f() { gco -q master; git branch -Dq pr/$1; git fetch github pull/$1/head:pr/$1 && gco -q pr/$1; };f'
alias gprm='f() { gco -q master; git branch -Dq mine/pr/$1; git fetch mine pull/$1/head:mine/pr/$1 && gco -q mine/pr/$1; };f'

export PATH="$PATH:/usr/local/bin/go"
