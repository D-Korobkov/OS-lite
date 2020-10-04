#!/bin/bash

ps aux | grep -E "* /sbin/" | awk -F " " '{print $2}' > proc_in_sbin

