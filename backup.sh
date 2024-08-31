#!/bin/bash

SOURCEDIR=$1
DESTDIR=$2 #/home/ec2-user/app
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%M-%D-%S)

if [ $# -lt 2 ]
then
exit 1
fi

if [ -d $SOURCEDIR ]
then
echo "Source directory exists"
else
echo "Source directory doesnt exist"
exit 1
fi

if [ -d $DESTDIR ]
then
echo "Destination directory exists"
else
echo "Destination directory doesn't exist"
exit 1
fi

FILES=$(find ${SOURCEDIR} -name "*.log" -mtime $DAYS)

if [ ! -z $FILES ]
then
ZIPFILE="$DESTDIR/app-logs-$TIMESTAMP.zip"
find ${SOURCEDIR} -name "*.log" -mtime $DAYS | zip "$ZIPFILE" -@

if [ -f $ZIPFILE ]
then
echo "Backup File is Zipped"
while IFS= read -r file
do
rm -rf $file
echo "old files deleted sucessfully"
done <<< $FILES
else
echo "Backup file is not zipped"
exit 1
fi
else
echo "no old files available"
fi



