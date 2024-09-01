#!/bin/bash

FILE=/home/user/assignement.txt

while IFS= read -r word
do
grep -wc $word
done <<< $FILE