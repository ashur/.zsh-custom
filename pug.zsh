CURRENT_DATE=`date +%Y-%m-%d`
PUG_UPDATE_FILE="${HOME}/.pug_update"

function pug_update()
{
	pug update daily --all
	echo $CURRENT_DATE > $PUG_UPDATE_FILE
}

if [ ! -f "${PUG_UPDATE_FILE}" ]; then
	pug_update;
fi

PUG_LAST_UPDATE=`cat ${PUG_UPDATE_FILE}`
if [ "${CURRENT_DATE}" != "${PUG_LAST_UPDATE}" ]; then
	pug_update;
fi
