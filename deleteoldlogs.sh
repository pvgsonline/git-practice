#!/bin/bash

SOURCEDIR=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ -d $SOURCEDIR ]
then
echo -e "$G directory exists $N"
else
echo -e "$R directory doesnt exit $N"
exit 1
fi

FILES=$(find $SOURCEDIR -name "*.log" -mtime +14)
echo "files : $FILE"

while IFS= read -r file  #IFS - internal field separator

do
echo -e " $R deleting the file $N : $FILE"

done << $FILES


