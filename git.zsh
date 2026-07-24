alias gco='git checkout'
alias gs='git status'
alias gw='git whatchanged'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`'

gbclean() {
	git branch -vv | grep 'gone]' | awk '{print $1}' | xargs git branch -D
}
