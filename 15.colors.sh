#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

R="\e[31m" #red
G="\e[32m" #green
Y="\e[33m" #yellow
B="\e[34m" #blue
N="\e[0m" #normal


if [ $USERID -ne 0 ]; then
    echo "$R please run the script with root user or sudo $N"
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE_PACKAGE()
{

if [ $1 -ne 0 ]; then
      echo " $R $2 package installed failed $N"
      exit 1
else
   echo "$G $2 package installation successful $N"
   
fi
}

for package in $@ # sudo sh 12-loops.sh nginx mysql nodejs gcc python3 devel

do   
     dnf list installed $package &>>$LOGS_FILE
     if [ $? -ne 0 ]; then
     echo "$Y $package is not installed,installing now the package $N"
           
     dnf install $package -y &>>$LOGS_FILE
     VALIDATE_PACKAGE $? "$package installation"
 else
     echo "$G $package is already installed, skipping the package installation $N"
    fi
done





