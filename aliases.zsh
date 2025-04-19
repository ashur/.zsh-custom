alias bonjour="dns-sd -B _ssh._tcp ."
alias cap="catpack"
alias cat=bat
alias catpack="cat package.json"
alias la="ls -hAlp"
alias nova.="nova ."
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '🔑  Public key copied to pasteboard.'"
alias reload!='omz reload'
alias start=serve

serve() {
	if [ -f .aliases.zsh ]; then
		source .aliases.zsh
	fi

	which serve_local > /dev/null
	if [ $? -eq 0 ]; then
		serve_local
	else
		npm run serve
	fi
}
