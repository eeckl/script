#!/bin/sh
[[ $(echo "$(cmus-remote -Q)" | wc -l) == 1 ]] >/dev/null 2>&1 || cmus-remote -Q | grep title | awk {'print $3'}
