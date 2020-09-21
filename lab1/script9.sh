#!/bin/bash

source=/var/log/*.log

wc -l $source | awk -F " " '{ SUM += $1 } END {print SUM}'
