#!/bin/sh
ARGS=$*
CMD="${ARGS%% -- *}"
FILE="${ARGS##* -- }"
[ "$CMD" != "$FILE" ] && SAFEFILE=$(echo "$FILE" | sed 's/ /\\ /g')
WID=$(xdo id)

xdo hide
$SHELL -i -c "$* > /dev/null 2>&1; exit"
xdo show "$WID"
