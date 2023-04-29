#!/bin/bash

#mynum=2100                      # man test

#if [ $mynum -eq 200]  
#then
#    echo "The condition is true."
#else
#    echo "The variable does not equal 200."
#fi

# notEqual stmt  :: if [ $mynum -ne 200 ] or if [ ! $mynum -eq 200]
# greaterThen stmt :: if [ $mynum -gt 200]

# check the file exists are not

#if [ -f ~/myfile ]
#then
#    echo "File exists."
#else
#    echo "The file does not exist."
#fi

command=/usr/bin/htop                                       # command=htop

if [ -f $command ]                                          # if command -v $command
then
    echo "$command is available, let's run it..."
else
    echo "$command is NOT available, installing it..."
    sudo apt update && sudo apt install -y htop            # sudo apt update && sudo apt install -y $command
fi

$command