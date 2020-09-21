#!/bin/bash

source=/var/log
result=0

for file in $(find $source -maxdepth 1 -name "*.log")
#if we want to search '*.log' files in subdirs too, than delete '-maxdepth 1'
do
count_lines=$(wc -l $file | cut -d " " -f1)
result=$(( $result + $count_lines ))
done
echo $result
