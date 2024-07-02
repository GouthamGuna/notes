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