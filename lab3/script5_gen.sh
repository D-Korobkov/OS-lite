#!/bin/bash

while [[ true ]]; do
	read line
	echo "$line" > pipe
	if [[ "$line" == "QUIT" ]]; then
		exit 0;
	elif [[ "$line" != "+" && "$line" != "*" && (! "$line" =~ ^[[:digit:]]+$) ]]; then
		exit 1;
	fi;
done

