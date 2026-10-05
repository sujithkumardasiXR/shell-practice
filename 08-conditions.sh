#!/bin/bash

Number=$ 35

if   [ $Number -gt 20 ]; then
    echo"given number : $Number is greater than 20"
elif [ $Number -eq 20 ]; then
    echo"given number : $Number is equal to 20"
else
    echo"given number : $Number is less than 20"
fi