#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run the script with root user or sudo"
    exit 1
fi
VALIDATE_PACKAGE()
{

if [ $1 -ne 0 ]; then
      echo "$2 package installed failed"
else
   echo "$2 package installation successful"
   exit 1
fi
}
dnf install nginx -y
VALIDATE_PACKAGE $? "Nginx"

dnf install mysql -y
VALIDATE_PACKAGE $? "mysql"

dnf install nodejs -y
VALIDATE_PACKAGE $? "nodejs"




