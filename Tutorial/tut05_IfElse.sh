#! /bin/bash

count=10

if [ $count -eq 10 ] # Check all comparison operators on the internet like -ne -gt -ge -lt -le
then
    echo 'Condition is true'
fi

# Check comparison operators for strings too
word=a
if [ $word == 'b' ]
then
    echo 'The word is b'
elif [ $word == 'a' ]
then
    echo 'The word is a'
else
    echo 'The condition is false'
fi
