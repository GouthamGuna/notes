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