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
			read "create?'start_local' not defined in .aliases.zsh. Create it? [Y/n] "
			create_start_local $create
		}

		source .aliases.zsh
		start_local
	else
		read "create?.aliases.zsh not found. Create it? [Y/n] "
		create_start_local $create
	fi
}

create_start_local() {
	if [[ "$1" =~ ^[Yy]$ ]] || [[ "$1" == "" ]]; then
		read "command?Command to run: "
		echo "start_local() {\n\t$command\n}" >> .aliases.zsh
		echo "Created 'start_local' in $PWD/.aliases.zsh"

		read "run_start?Run 'start' now? [Y/n] "
		if [[ "run_start" =~ ^[Yy]$ ]] || [[ "run_start" == "" ]]; then
			start
		fi
	else
		return 1
	fi
}
