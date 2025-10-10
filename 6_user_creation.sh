#!/bin/bash

#########
# This script will Read usernames from a file and create them in bulk.
# Author AKSHAT VERMA
# DATE 10-10-2025
##########

echo "Creating users"
read=$(cat users.txt)
for i in $read; do
    echo "creating user $i"
    sudo useradd $i
done


# add condition if its already exist or not