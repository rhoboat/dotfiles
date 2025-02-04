devDir="$HOME/Development"
alias vim='/usr/local/bin/vim'
alias dotf='cd $devDir/dotfiles'
alias pgstart='pg_ctl -D /usr/local/var/postgres start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'
alias youtube-mp3='youtube-dl --extract-audio --audio-format mp3'
alias dockerstop='docker stop --time 0 `docker ps --format "{{.ID}}" --last 1`'
alias docker_reclaim='($foo=docker ps -q -f "status=exited"; [[ -n $foo ]] && docker rm $foo || true) && ($bar=docker images -q -f "dangling=true"; [[ -n $bar ]] && docker rmi $bar)'

# Load work aliases
[[ -s "$HOME/.bash_work" ]] && source "$HOME/.bash_work"

# Load play aliases
[[ -s "$HOME/.bash_play" ]] && source "$HOME/.bash_play"

# AWS Vault Aliases
alias awsin='f() { aws-vault login $1 -d12h -s | pbcopy; };f'

# Git Aliases
alias gra='f() { git remote add github $(git remote get-url origin); };f'
alias grv='git remote -v'
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
alias gunstage='git reset HEAD'
alias gign='git ls-files -o -i --exclude-standard'
alias gpr='f() { gco -q master; git branch -Dq pr/$1; git fetch github pull/$1/head:pr/$1 && gco -q pr/$1; };f'
alias gprm='f() { gco -q master; git branch -Dq mine/pr/$1; git fetch mine pull/$1/head:mine/pr/$1 && gco -q mine/pr/$1; };f'
alias gcleanup='git remote prune github && git remote prune origin'
alias gf='git fetch github main'

# Remove this when no longer needed
alias gmm='f() { gb -m master main; git fetch $1; gb -u $1/main main; git remote set-head $1 -a; };f'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function rgsed() {
  local -r lookup="$1"
  local -r replace="$2"

  rg "$lookup" --files-with-matches | xargs sed -i '' "s|$lookup|$replace|g"
}

function del_origin_remote_tracking_branches() {
  local -r remote="$1"

  git branch -a | grep "$remote" | grep -v " -> " | sed "s/remotes\///g" | xargs git branch -rd
}
