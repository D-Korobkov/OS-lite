#!/bin/bash

source=/etc/passwd

sort -g -t ":" -k 3 < $source | cut -d ":" -f3,1