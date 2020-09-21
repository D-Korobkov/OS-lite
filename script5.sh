#!/bin/bash

source=/var/log/anaconda/syslog
destination=info.log

touch $destination

for word in $(cut -d" " -f2 $source)
do
read line
if [[ $word = INFO ]]; then echo $line >> $destination; fi
done < $source
