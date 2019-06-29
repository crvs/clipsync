#!/bin/sh
# clipsync.sh
# keeps the primary selection and the system clipboard synchronized
# depends on xclip
# runs on POSIX shell

function get_primary() {
	xclip -o -selection primary 2> /dev/null || echo ''
}

function get_clipbrd() {
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

function update_primary () {
	OLD_primary=${primary}
	PRIMARY="$(get_primary)"
	if [ ! "${PRIMARY}" = "${OLD_PRIMARY}" ] ; then
		CLIPBRD=${PRIMARY}
		echo "${PRIMARY}" | xclip -selection clipboard
	fi
}

function update_clipbrd () {
	OLD_CLIPBRD=${CLIPBRD}
	CLIPBRD=$(get_clipbrd)
	if [ ! "${CLIPBRD}" = "${OLD_CLIPBRD}" ] ; then
		PRIMARY=${CLIPBRD}
		echo "${CLIPBRD}" | xclip -selection primary
	fi
}

while true ; do
	sleep 1
	update_clipbrd
	update_primary
done
