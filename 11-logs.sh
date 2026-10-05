#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER ="/var/log/shell-scripts"
LOGS_FILE   ="/var/log/shell-scripts/$0.log"

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

dnf install nginx -y >>$LOGS_FILE 
VALIDATE_PACKAGE $? "Nginx installation"

dnf install mysql -y >>$LOGS_FILE 
VALIDATE_PACKAGE $? "mysql installation"

dnf install nodejs -y >>$LOGS_FILE 
VALIDATE_PACKAGE $? "nodejs installation"




