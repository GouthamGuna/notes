#!/bin/bash

x=5
y=2

if [ $x -lt $y ]; then
    echo "$x is less than $y."
elif [ $x -gt $y ]; then
    echo "$x is greater than $y."
else
    echo "$x is equal to $y."
fi
