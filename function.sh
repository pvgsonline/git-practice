#!/bin/bash

USER=$(id -u)
if [ $USER -ne 0 ]
echo "user needs root user privilages"
exit 1
fi

VALIDATE()
{
    if [ $1 -ne 0 ]
    then
    echo "Installation is not successful for $2"
    exit 1
    else
    echo "Installation is sussceful for $2"
    fi

}

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