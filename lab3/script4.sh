#!/bin/bash

nice -n 12 bash script4_inf1.sh &
bash script4_inf2.sh &
bash script4_inf3.sh &

#renice 10 $(pidof bash | cut -d " " -f4)
