#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
    echo "please run the script with root user or sudo"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE_PACKAGE()
{

if [ $1 -ne 0 ]; then
      echo "$2 package installed failed"
      exit 1
else
   echo "$2 package installation successful"
   
fi
}

for package in $@ # sudo sh 12-loops.sh nginx mysql nodejs gcc python3 devel

do   
     dnf list installed $package &>>$LOGS_FILE
     if [ $? -ne 0 ]; then
     echo "$package is not installed,installing now the package"
           
     dnf install $package -y &>>$LOGS_FILE
     VALIDATE_PACKAGE $? "$package installation"
 else
     echo "$package is already installed, skipping the package installation"
    fi
done





