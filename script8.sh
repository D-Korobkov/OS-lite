#!/bin/bash

source=/etc/passwd

cut -d ":" -f3,1 < $source | sort -g -t ":" -k 2