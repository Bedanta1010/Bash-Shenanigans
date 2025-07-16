#! /bin/bash

age=20

if [ $age -gt 15 ] && [ $age -lt 50 ] # or [ condition -a condition ], use [[]] if you want to use && still
then
    echo "$age is a valid age"
else
    echo "$age is an invalid age"
fi

# For OR operator use || or -o