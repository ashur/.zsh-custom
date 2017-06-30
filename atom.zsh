ATOM=/usr/local/bin/atom

function atom
{
	if [ "$1" = "" ]; then
		$ATOM '.'
	else
		$ATOM "$1"
	fi
}
