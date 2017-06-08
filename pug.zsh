# Update all projects in the 'daily' namespace
# ---

local CURRENT_TIME=`date +%s`
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
	echo $CURRENT_TIME > $PUG_UPDATE_FILE
}

if [ ! -f "${PUG_UPDATE_FILE}" ]; then
	pug_update;
fi

PUG_LAST_UPDATE=`cat ${PUG_UPDATE_FILE}`
TIME_SINCE_UPDATE=$(($CURRENT_TIME - $PUG_LAST_UPDATE))

if [ "${TIME_SINCE_UPDATE}" -ge 86400 ]; then
	pug_update;
fi
