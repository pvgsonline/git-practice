#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/logs/shell-script"
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP" 
mkdir -p $LOG_FOLDER


ROOT_USER()
{
    if [ $USERID -ne 0 ]
    then
    echo -e " $R User needs root privilages $N" | tee -a $LOG_FILE
    exit 1
    fi
}

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
    echo -e "$2 installation is $R unsucessful $N" | tee -a $LOG_FILE
    else
    echo -e "$2 installation is $G sucessful $N"  | tee -a $LOG_FILE
    fi
}

ROOT_USER

for package in $@
do
dnf list installed $package &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo "$package is not installed" | tee -a $LOG_FILE
dnf install $package -y &>>$LOG_FILE
validate $? "$package" 
else
echo "$Y $package is already installed $N" | tee -a $LOG_FILE
fi
done
