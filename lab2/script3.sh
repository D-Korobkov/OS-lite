#!/bin/bash

ps aux | grep -vE "cut|tr|tail|ps|grep|script3" | tail -1 |
tr -s " " " " | cut -d " " -f2
