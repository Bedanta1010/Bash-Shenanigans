#! /bin/bash
# Passing Arguments from Command Line

echo $0 $1 $2 $3 ' > Passing from Command Line'

args=("$@")
#echo ${args[0]} ${args[1]} ${args[2]} ${args[3]} # This will print only the arguments passed and not the script name
echo $@ # Will print everything
echo $# # Will print number of arguments