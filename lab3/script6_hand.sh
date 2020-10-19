#!/bin/bash

echo $$ > .pid
val=1

USR1() {
	val=$((val + 2))
	echo $val
}

USR2() {
	val=$((val * 2))
	echo $val
}

SIGTERM() {
	echo "terminate by another process"
	exit 0
}

trap "USR1" USR1
trap "USR2" USR2
trap "SIGTERM" SIGTERM

while true; do
sleep 1
done
