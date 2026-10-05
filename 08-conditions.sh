#!/bin/bash

Number=$35

if   [ $Number -gt 100 ];then
    echo"given number : $Number is greater than 100"
elif [ $Number -eq 100 ];then
    echo"given number : $Number is equal to 100"
else
    echo"given number : $Number is less than 100"
fi