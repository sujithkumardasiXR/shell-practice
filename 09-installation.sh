#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run the script with root user or sudo"
    exit 1
fi

echo "installing the package Nginx"
dnf install nginx -y


if [ $? -eq 0 ]; then
    echo "Nginx package installed failed"
else
    echo "Nginx package installation successful"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "mysql package installation failed"
else
    echo "mysql package installation successful"
    exit 1
fi

dnf install nodejs -y
 if [ $? -eq 0 ]; then
    echo "nodejs package installation failed"
else
    echo "nodejs package installation successful"
    exit 1
fi