#! /bin/bash

#While loop
n=1

while [ $n -le 10 ]  # (( $n <= 10 )) also works
do
    echo "$n"
    n=$(( n+1 )) #Post increment and pre increment works too

    # sleep 1 #sleeps for 1 second
    # gnome-terminal & #open the terminal (only for linux and not for windows subsystem)
done


#For reading files
# while read p
# cat tut11_Loops.sh | while read p
while IFS= read -r line
do
    # echo $p
    echo $line
done < tut11_Loops.sh # The < tut11_Loops.sh is only required when cat is not used
