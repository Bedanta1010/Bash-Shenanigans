#! /bin/bash

# echo "Enter your name: "
# read name
# echo "Hello, $name!"

read -p "Enter your name: " name
read -sp "Enter your password: " passwd
echo "Hello, $name!"

echo "Enter two numbers: "
read num1 num2
echo "The sum of $num1 and $num2 is $((num1 + num2))"

echo "Enter marks: "
read -a marks # stores as an array
echo "The marks are: ${marks[0]}, ${marks[1]}"