#!/bin/bash

source=/var/log/*.log

wc -l $source | tail -1 | cut -d " " -f3
