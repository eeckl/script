#!/usr/bin/env bash
cachefile=$HOME/.cache/CopyFilesTmp.txt
cachefile1=$HOME/.cache/CopyFilesTmp1.txt
cachefiledirs=$HOME/.cache/CopyFilesTmpDirs.txt
rm $cachefile >/dev/null 2>&1
rm $cachefile1 >/dev/null 2>&1
rm $cachefiledirs >/dev/null 2>&1
read -e -p "Geef het volledige pad van de map die gekopieërd moet worden: " copy
read -e -p "Geef het volledige pad van de map waar alles terecht moet komen: " paste
find "$copy" -maxdepth 1 -type f | sort >> $cachefile
exact=$(basename "$copy")
mkdir "$paste$exact" >/dev/null 2>&1 || echo "Error, de map die je probeert te kopiëren staat waarschijnlijk al in $paste."
subdircount=`find "$copy" -maxdepth 1 -type d | wc -l`
if [ $subdircount -ge 2 ]
then
  find "$copy" -maxdepth 1 -type d | tail -n +2 | sort >> $cachefiledirs
  while read line; do
    exactdir=$(basename "$line")
    mkdir "$paste$exact/$exactdir"
    find "$line" -maxdepth 1 -type f | sort >> $cachefile1
  done < $cachefiledirs
  while read line; do
    cutline=$(basename "$(dirname "$line")")
    cp "$line" "$paste$exact/$cutline"
  done < $cachefile1
fi
while read line; do
  cp "$line" "$paste$exact"
done < $cachefile
rm $cachefile >/dev/null 2>&1
rm $cachefile1 >/dev/null 2>&1
rm $cachefiledirs >/dev/null 2>&1
