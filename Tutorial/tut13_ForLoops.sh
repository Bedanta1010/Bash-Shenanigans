#! /bin/bash

# for i in 1 2 3 4 5
# for i in {1..5..2} # startvalue..endvalue..increment
for (( i=1; i<6; i++ ))
do 
    echo $i
done
echo -e "\n"

#Commands can be executed too
for command in ls pwd date
do
    echo "---------------$command---------------"
    $command
    echo -e "\n"
done

# break and continue exist here too, use wherever u like