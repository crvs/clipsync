#!/bin/sh
# file: clipsync.sh
# keep the primary selection and the system clipboard synchronized


get_primary() {
	xclip -o -selection primary 2> /dev/null || echo ''
}

get_clipbrd() {
	xclip -o -selection clipboard 2> /dev/null || echo ''
}

CLIPBRD="$(get_clipbrd)"

if [ "${CLIPBRD}" = "" ] ; then
	PRIMARY="$(get_primary)"
	CLIPBRD="${PRIMARY}"
	echo "${PRIMARY}" | xclip -selection clipboard
else
	PRIMARY="${CLIPBRD}"
	echo "${CLIPBRD}" | xclip -selection primary
fi

update_primary () {
	OLD_primary=${primary}
	PRIMARY="$(get_primary)"
	if [ ! "${PRIMARY}" = "${OLD_PRIMARY}" ] ; then
		CLIPBRD=${PRIMARY}
		echo "${PRIMARY}" | xclip -selection clipboard
	fi
}

update_clipbrd () {
	OLD_CLIPBRD=${CLIPBRD}
	CLIPBRD=$(get_clipbrd)
	if [ ! "${CLIPBRD}" = "${OLD_CLIPBRD}" ] ; then
		PRIMARY=${CLIPBRD}
		echo "${CLIPBRD}" | xclip -selection primary
	fi
}

i=0
while true ; do
    if [ "$DISPLAY" = "" ]; then
        logger -s -t "[CLIPSYNC]" "No display set. Exiting clipsync."
        exit 1
    fi
	sleep 1
	update_clipbrd
	update_primary
done
