#!/bin/bash

USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

ROOT_USER()
{
    if [ $USER -ne 0 ]
    then
echo "user needs root user privilages"
exit 1
fi

}

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
    echo  -e "Installation is  $R unsuccessful for $2  $N"
    exit 1
    else
    echo -e "Installation is $G sucessful for $2  $N"
    fi
}

ROOT_USER

dnf list installed git

if [ $? -ne 0 ]
then
echo "GIT is not installed, going to install"
dnf install git -y
VALIDATE &? "GIT"
else
echo "GIT is already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
echo "mysql is not installed , going to install"
dnf install mysql -y
VALIDATE $? "MYSQL"
else
echo "mysql is already installed"
fi