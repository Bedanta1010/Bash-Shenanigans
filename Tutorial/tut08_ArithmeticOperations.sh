#! /bin/bash

num1=10
num2=10

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

# Another way is to use expr, i.e., $(expr $num1 + $num2 ) but for * use \* instead

n1=20.5
n2=5

# scale for number of decimals, bc is basic calculation, -l is for calling math library
echo "$n1+$n2" | bc
echo "$n1-$n2" | bc
echo "20.5*5" | bc
echo "scale=2;$n1/$n2" | bc
echo "20.5%5" | bc

n3=27
echo "scale=2;sqrt($n3)" | bc -l
echo "scale=2;3^3" | bc -l