#!/bin/sh
days=$(echo "$(( $(date -d "Jul 1" +%j) - $(date +%j) ))")

case $days in
	0) echo "Zomervakantie start vandaag. Vergeet er niet van te genieten.";;
	-*) echo "Nog $(( $days + 365 )) dag(en) tot begin zomervakantie.";;
	*) echo "Nog $days dag(en) tot begin zomervakantie.";;
esac
