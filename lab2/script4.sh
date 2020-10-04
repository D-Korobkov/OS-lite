#!/bin/bash

out=CPU_burst
touch $out

regexp="^Pid:|^PPid:|^se.sum_exec_runtime|^nr_switches"

grep --include=sched --include=status --exclude-dir=task -hEr $regexp /proc | sed "N; s/\n/ /" |
sed -r -e "s/[[:blank:]]+/ /g" -e "s/PPid: /: Parent_ProcessID = /g" -e "s/Pid: /ProcessID = /g" |
sed -r -e "s/se.sum_exec_runtime : /: Average_Running_Time = :/g" -e "s/[[:blank:]]+nr* : /:/g" |
sed "N; s/\n/ /" | awk -F : '{print $1$2$3$4/$5}' | sed "s/  / : /g" | sort -n -t " " -k 7 |
sed "s/ = /=/g" > $out
