#!/bin/bash

USER=$(id -u)
if [ $USER -ne 0 ]
then
echo "user needs root user privilages"
exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
echo "GIT is not installed, going to install"
dnf install git -y
if [ $? -ne 0 ]
echo "GIT installation is not sucessful"
exit 1
else
echo "GIT is installed succesfully"
fi
else
echo "GIT is already installed"
fi

dnf list installed mysql
if [ $? ne 0 ]
then
echo "mysql is not installed , going to install"
dnf install mysql -y
if [ $? ne 0 ]
then
echo "mysql installation is not successful"
exit 1
else
echo "mysql installation is successful"
fi
else
echo "mysql is already installed"
fi