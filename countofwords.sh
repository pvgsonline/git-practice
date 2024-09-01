#!/bin/bash

FILE=/home/user/assignement.txt

#grep -wc 

while IFS= read -r line
do
#grep -o $line | wc -l
echo "$line"
done <<< $FILE