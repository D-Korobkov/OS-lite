#!/bin/bash

grep --include=io --exclude-dir=task --exclude-dir=pressure -r read_bytes /proc |
tr "/" " " | cut -d " " -f5,3 | tr " " ":" > buffer

sleep 5m

grep --include=io --exclude-dir=pressure --exclude-dir=task -r read_bytes /proc |
tr "/" " " | cut -d " " -f5,3 | tr " " ":" | sed "s/$/:mark/g" >> buffer

sort -n -t : -k 1 < buffer |
awk -v pid=0 -v bytes=0 -F : '{if ($1 == pid)
                                   print $1":"($2-bytes);
                                 else {
                                   if ($3 == "mark")
                                     print $1":"$2":mark"
                                   pid=$1
                                   bytes=$2
                                 }} '
#sort -t : -k 1 < buffer | tr -s " " " " | sed "N; s/\n/:/" |
#awk -F: '{if ($1 == $4){ print $1" : "$6-$3} else{ print $4" : "$6}}'|
#sort -n -r -t : -k 2 | head -3 | tr / " " | cut -d " " -f6,3 |
#sed -e "s/^/PID:/g" -e "s/$/ bytes were read/g"
