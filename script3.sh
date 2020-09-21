#!/bin/bash

echo "
  Menu
1) open vi
2) open nano
3) open links
4) exit"

read command
while [[ $command != [1-4] ]]
do
echo unknown command
read command
done

case $command in
1 ) vi     ;;
2 ) nano   ;;
3 ) links  ;;
4 ) exit 0 ;;
esac