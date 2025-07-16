#! /bin/bash

n=1
until (( $n > 10 )) # or [ $n -gt 10 ]
do
    echo $n
    n=$(( n + 1 ))
done