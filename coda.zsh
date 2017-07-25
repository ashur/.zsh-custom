function coda
{
	if [ "$1" = "" ]; then
		open -a Coda "./"
	else
		open -a Coda "$1"
	fi
}
