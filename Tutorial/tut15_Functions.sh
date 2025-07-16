#! /bin/bash

function Hello() {
    echo $1 $2
}

quit() {
    exit
}

Hello World Great
echo hello this is normal line
quit

#function can be written in either formats
# Local variables can be declared using local keyword, example local name=$1
# Read only variables can be declared using readonly keyword, also use -f flag for read only function