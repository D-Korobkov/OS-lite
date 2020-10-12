#!/bin/bash

ps -ef | awk -v cur_pid=$$ '$3 != cur_pid && $2 != cur_pid { print $2 }' | tail -1
