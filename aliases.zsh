alias bonjour="dns-sd -B _ssh._tcp ."
alias cap="catpack"
alias cat=bat
alias catpack="cat package.json"
alias la="ls -hAlp"
alias nova.="nova ."
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '🔑  Public key copied to pasteboard.'"
alias reload!='omz reload'
alias serve=start

start() {
	if [ -f .aliases.zsh ]; then
		start_local() {
			echo "'start_local' not defined in $PWD/.aliases.zsh"
			return 1
		}

		source .aliases.zsh
		start_local
	else
		echo "$PWD/.aliases.zsh not found"
		return 1
	fi
}
