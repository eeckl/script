#!/bin/sh
[[ $(echo "$(cmus-remote -Q)" | wc -l) == 1 ]] >/dev/null 2>&1 || echo "MUS: $(cmus-remote -Q | grep title | cut -d' ' -f3-) | "
