#!/bin/bash

acc=""
read word

while [[ $word != q ]]
do
acc=$acc$word
read word
done
echo $acc