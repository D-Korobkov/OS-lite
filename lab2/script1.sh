#!/bin/bash

ps aux |
awk -F " " '$1 == "root" {SUM += 1; print $2" : "$11} END {print SUM > "run_proc"}' >> run_proc
