#!/bin/bash

source=/etc
destination=emails.lst

touch $destination

email="\b[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:]]{2,6}\b"

for file in $(find $source -maxdepth 1 -type f)
#if we want to search emails in subdirs too than delete '-maxdepth 1'
do
grep -E -o  $email $file
done | tr -s "\n" "," > $destination