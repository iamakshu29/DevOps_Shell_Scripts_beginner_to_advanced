#!/bin/bash

#########
# NOT DONE
# This script will Read usernames from a file and create them in bulk.
# Author AKSHAT VERMA
# DATE 10-10-2025
##########


read=$(cat users.txt)

echo "Creating users from $read"

for i in $read; do
    if [ id "$i" ]; then
        echo "user $i already exists"
    else
        echo "creating user $i"
        sudo useradd $i
    fi
done
