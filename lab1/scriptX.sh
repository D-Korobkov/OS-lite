#!/bin/bash

man bash | sed "s/[^[:alnum:][:space:]]//g" | tr -s "[[:space:]]" "\n" |
sort | uniq -c -i | tr -s "[[:blank:]]" " " | sort -r -g -k 1 | cut -d " " -f3 |
awk "{if (length($1) > 3) print $1}" | head -3