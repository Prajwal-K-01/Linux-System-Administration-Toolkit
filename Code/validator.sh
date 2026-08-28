#!/bin/bash

file_exists(){

if [ -f "$1" ]
then
    return 0
else
    return 1
fi

}

directory_exists(){

if [ -d "$1" ]
then
    return 0
else
    return 1
fi

}

user_exists(){

id "$1" &>/dev/null

}
