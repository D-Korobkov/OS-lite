#!/bin/bash

pid=$(cat .pid)
while true; do
	read line
	if [[ "$line" == "*" ]]; then
		kill -USR2 $pid
	elif [[ "$line" == "+" ]]; then
		kill -USR1 $pid
	elif [[ "$line" == "TERM" ]]; then
		kill -SIGTERM $pid
		exit 0
	fi
done
