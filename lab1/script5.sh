#!/bin/bash

source=/var/log/anaconda/syslog
destination=info.log

touch $destination

awk -F " " '{if ($2 == "INFO") print}' < $source > $destination
