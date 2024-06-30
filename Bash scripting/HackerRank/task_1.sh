#!/bin/bash

echo "Odd natural numbers from 1 to 99 are:"
for ((i = 1; i <= 99; i += 2)); 
do
    echo $i
done