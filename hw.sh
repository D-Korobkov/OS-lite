#!/bin/bash

##############################################################################
echo task I

if [[ $1 -gt $2 ]]

then if [[ $1 -gt $3 ]]; then echo $1; else echo $3; fi

else if [[ $2 -gt $3 ]]; then echo $2; else echo $3; fi

fi

##############################################################################
echo task II

acc=""
read word

while [[ $word != q ]]
do
acc=$acc$word
read word
done
echo $acc

##############################################################################
echo task III

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
4 ) echo exiting ;; #exit 0
esac

##############################################################################
echo task IV

if [[ $PWD == $HOME ]]

then

echo $HOME
#exit 0

else

echo Error
#exit 1

fi

##############################################################################
echo task V

source1=/var/log/anaconda/syslog
destination1=info.log

touch $destination1

for word in $(cut -d" " -f2 $source1)
do
read line
if [[ $word = INFO ]]; then echo $line >> $destination1; fi
done < $source1

##############################################################################
echo task VI

source2=/var/log/anaconda/X.log
destination2=full.log

touch $destination2

grep "(WW)" $source2 | sed 's/(WW)/Warning:/g' > $destination2
grep "(II)" $source2 | sed 's/(II)/Information:/g' >> $destination2

cat $destination2

##############################################################################
echo task VII

source3=/etc
destination3=emails.lst

touch $destination3

email="\b[[:alnum:]._%+-]+@[[:alnum:].-]+\.[[:alpha:]]{2,6}\b"

for file in $(find $source3 -maxdepth 1 -type f)
#if we want to search emails in subdirs too than delete '-maxdepth 1'
do
grep -E -o  $email $file
done | tr -s "\n" "," > $destination3

################################################################################
echo task VIII

source4=/etc/passwd

cut -d ":" -f3,1 < $source4 | sort -g -t ":" -k 2

################################################################################
echo task IX

source5=/var/log
result=0

for file in $(find $source5 -maxdepth 1 -name "*.log")
#if we want to search '*.log' files in subdirs too, than delete '-maxdepth 1'
do
count_lines=$(wc -l $file | cut -d " " -f1)
result=$(( $result + $count_lines ))
done
echo $result

#################################################################################
echo task X

man bash | sed "s/[^[:alnum:][:space:]]//g" | tr -s "[[:space:]]" "\n" |
sort | uniq -c -i | tr -s "[[:blank:]]" " " | sort -r -g -k 1 | cut -d " " -f3 |
awk "{if (length($1) > 3) print $1}" | head -3

##################################################################################
