#! /bin/bash

vehicle=$1

case $vehicle in
    "car" )
        echo "Rent of $vehicle is 100 dollars"  ;;
    "van" )
        echo "Rent of $vehicle is 80 dollars" ;;
    "bicycle" )
        echo "Rent of $vehicle is 10 dollars" ;;
    "truck" )
        echo "Rent of $vehicle is 400 dollars" ;;
    * )
        echo "Unknown vehicle" ;;
esac

echo -e "Enter some single input: \c"
read value

case $value in
    [a-z] )
        echo "The value is $value a-z" ;;
    [A-Z] )
        echo "The value is $value A-Z" ;;
    [0-9] )
        echo "The value is $value 0-9" ;;
    ? )
        echo "The value is $value ?" ;;
    * )
        echo "Unknown input" ;;
esac