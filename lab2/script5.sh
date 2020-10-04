#!/bin/bash

touch CPU_burst_adv

str="Average_Sleeping_Children_of_ParentID"
cat CPU_burst | tr "=" " " |
awk -F " " -v msg=$str 'BEGIN { PPid=0 } {
                          if (PPid == $5) {
                            SUM+=$8; COL+=1
                          } else {
                            print msg"="PPid" is "SUM/COL
                            SUM=$8; COL=1; PPid=$5
                          }
                          print $0
                        } END { print msg"="PPid" is "SUM/COL }' |
sed -e "s/ID /ID=/g" -e "s/Time /Time=/g" > CPU_burst_adv
