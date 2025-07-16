#! /bin/bash

echo -e 'Enter file name: \d'
read file_name

if [ -e $file_name ]
then
    echo "$file_name found"
else
    echo "$file_name not found"
fi
# e is for checking file exist, f is for if its exists and is regular file, d is for directories, b for block special file, c for character special file, s if file is empty or not, x for if it has execute permission, w for write permission

# Appending output to file
if [ -f $file_name ]
then
    if [ -w $file_name ]
    then
        echo "Type some text. Ctrl + D to exit"
        cat >> $file_name # > to overwrite, >> to append
    else
        echo "$file_name does not have write permissions"
    fi
else
    echo "$file_name not found"
fi