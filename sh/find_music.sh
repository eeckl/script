#!/usr/bin/env bash
read -e -p "Song: " qry
song=$(find ~/Music -type f | grep "$qry")
songcount=$(find ~/Music -type f | grep "$qry" | wc -l)
if [ $songcount == 1 ]; then
	echo -e "$(tput setab 2)Playing \"$song\"$(tput sgr0)"
	cvlc "$song" >/dev/null 2>&1
elif [ $songcount \> 1 ]; then
	cachefile=~/.cache/MusCache.txt
	echo "$song" > $cachefile
	nl -w1 -s') ' $cachefile
	read -e -p "Song: " sel
	song=$(sed -n "$sel"p $cachefile)
	echo -e "$(tput setab 2)Playing \"$song\"$(tput sgr0)"
	cvlc "$song" >/dev/null 2>&1
else
	echo "$(tput setab 1)Song not found.$(tput sgr0)"
fi
rm $cachefile >/dev/null 2>&1
