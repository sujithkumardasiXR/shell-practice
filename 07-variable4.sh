#!/bin/bash

echo "ALL args passed to the script are $@"
echo "Total number of args passed to the script are $#"
echo "Script name :$0"
echo "present working directory is :$PWD"
echo "who is running the script :$USER"
echo "Home directory of the current user is :$HOME"
echo "PID of the current script is :$$"
sleep 100 &
echo "PID of the last background process is :$!"
echo "all args passed to the script are : $@"