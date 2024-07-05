# Task`s Types and Explanation

Learn Linux shell scripting...

## Task_1

our task is to use for loops to display only odd natural numbers from 1 to 99.

```
#!/bin/bash

echo "Odd natural numbers from 1 to 99 are:"
for ((i = 1; i <= 99; i += 2)); do
    echo $i
done
```

## Task_2

Write a Bash script which accepts username as input and displays the greeting "Welcome (name)".

```
#!/bin/bash

read username

echo "Welcome "$username
```

## Task_3

Use a for loop to display the natural numbers from 1 to 50.

```
for ((i = 1; i <= 50; i++));
do
    echo $i
done
```
## Task_4

 Given two integers, X and Y, find their sum, difference, product, and quotient.

 ``` 
read x
read y

echo $((x + y))
echo $((x - y))
echo $((x * y))
echo $((x / y))
```

## Task_5

Given two integers, x and y, identify whether x < y or x > y or x == y.

```
read x
read y

if [ $x -lt $y ]; then
    echo "X is less than Y"  
elif [ $x -gt $y ]; then
    echo "X is greater than Y"
else 
    echo "X is equal to Y"
fi
```