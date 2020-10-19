#!/bin/bash

MODE=+
val=1
input=+
(tail -f pipe) |
while true; do
	read line;
	if [[ "$line" == "+" ]]; then
		MODE="+"
		echo "mode +"
	elif [[ "$line" == "*" ]]; then
		MODE="*"
		echo "mode *"
	elif [[ "$line" =~ ^[0-9]+$ ]]; then
		case $MODE in
			\*) val=$((val * line));;
			+) val=$((val + line));;
		esac
		echo "result: "$val
	elif [[ "$line" = "QUIT" ]]; then
		echo "stop executing"
		killall tail
		exit 0;
	else
		echo "wrong input"
		killall tail
		exit 1;
	fi
done
