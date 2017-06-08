# Update all projects in the 'daily' namespace
# ---

local CURRENT_DATE=`date +%Y-%m-%d`
local PUG_UPDATE_FILE="${HOME}/.pug_update"
local PUG_GROUP_NAME="daily"

which pug >/dev/null
if [ $? != 0 ]; then
	return;
fi

pug ls | grep " ${PUG_GROUP_NAME}/" >/dev/null
if [ $? != 0 ]; then
	return;
fi

function pug_update()
{
	pug update "${PUG_GROUP_NAME}" --all
	echo $CURRENT_DATE > $PUG_UPDATE_FILE
}

if [ ! -f "${PUG_UPDATE_FILE}" ]; then
	pug_update;
fi

PUG_LAST_UPDATE=`cat ${PUG_UPDATE_FILE}`
if [ "${CURRENT_DATE}" != "${PUG_LAST_UPDATE}" ]; then
	pug_update;
fi
