#!/bin/bash

source=/var/log/anaconda/X.log
destination=full.log

touch $destination

grep "(WW)" $source | sed 's/(WW)/Warning:/g' > $destination
grep "(II)" $source | sed 's/(II)/Information:/g' >> $destination

cat $destination