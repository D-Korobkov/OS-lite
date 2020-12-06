#!/bin/bash

K=10

for ((i=0; i<$K; i++)); do
	bash newmem.bash 3000000 &
	sleep 1
done
