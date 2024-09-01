#!/bin/bash

FILE=/home/user/assignement.txt

while IFS= read -r line
do
grep -wc $line
done <<< $FILE