#! /bin/bash

os=('ubuntu' 'windows' 'kali')
os[6]='mac' #Elements can be added at any indices
unset os[1] # Removed windows

echo "${os[@]}"
echo "${os[0]}"
echo "${!os[@]}" #Prints index of every elements
echo "${#os[@]}" #Prints number of elements

string=asdbakuwgdukaw
echo "${string[@]}"
echo "${string[0]}"
echo "${string[1]}" #It will treat the variable at index 0