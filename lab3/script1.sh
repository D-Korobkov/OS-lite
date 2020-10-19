#!/bin/bash

mkdir ~/test &&
{
  echo "catalog test was created successfully" > ~/report
  touch ~/test/$(date +'%d.%m.%Y_%H:%M:%S')
}
ping www.net_nikogo.ru || echo $(date +'%d.%m.%Y %H:%M:%S')" ping failed" >> ~/report
