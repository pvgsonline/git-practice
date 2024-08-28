#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

ROOT_USER()
{
    if [ $USERID -ne 0 ]
    then
    echo -e " $R User needs root privilages $N"
    exit 1
    fi
}

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
    echo -e "$2 installation is $R unsucessful $N"
    else
    echo -e "$2 instalaltion is $G sucessful $N"
    fi
}

ROOT_USER

for package in $@
do
dnf list installed $package
if [ $? -ne 0 ]
then
echo "package is not installed"
dnf install $package -y
VALIDATE $? "$package"
else 
echo -e "$Y package is already installed $N"
fi
done