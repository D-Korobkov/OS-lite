#!/bin/bash

#mkdir ~/test &&
#{
#  echo "catalog test was created successfully" > ~/report
#  touch ~/test/$(date +'%y.%m.%d_%H:%M:%S')
#}
ping www.net_nikogo.ru || echo $(date +'%d.%m.%y %H:%M:%S')" ping failed" >> ~/report
