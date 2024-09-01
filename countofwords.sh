#!/bin/bash

FILE=$(cat /home/ec2-user/assignement.txt)

#grep -wc 

#while IFS= read -r line
#do
#grep -o $line | wc -l
#echo "$line"
#done <<< $FILE

for word in $(<$FILE)
do
echo "$word"
done