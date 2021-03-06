#!/bin/bash

grep --include=io --exclude-dir=task --exclude-dir=pressure -r read_bytes /proc |
tr "/" " " | cut -d " " -f5,3 | tr " " ":" > buffer

sleep 30s

grep --include=io --exclude-dir=pressure --exclude-dir=task -r read_bytes /proc |
tr "/" " " | cut -d " " -f5,3 | tr " " ":" | sed "s/$/:mark/g" >> buffer

sort -n -t : -k 1 < buffer |
awk -F : 'BEGIN { pid=0; bytes=0 }
                { if ($1 == pid) { print $1":"($2-bytes) }
                  else {
                    if ($3 == "mark") { print $1":"$2 }
                    pid=$1; bytes=$2
                  }
                 }' | sort -nrt : -k 2 | head -3 |
awk -F : '{getline COM < ("/proc/"$1"/cmdline"); print $1":"COM":"$2}'
rm buffer
