#!/bin/bash

########################
# This script is used to connect to EC2 using SSH
# Author Akshat Verma
# Date 10 oct 2025
# version 0.0.1
########################

sshkey=$1
ec2User=$2
ec2Host=$3

if [ "$#" -ne 3]; then
    echo "usage: $0 <sshkey> <ec2-user> <ec2-host>"
    exit 1;
fi

# -o StrictHostKeyChecking=no disables host key verification. (use it with CAUTION)
echo "connecting to EC2"
ssh -i "$sshkey" -o StrictHostKeyChecking=no "$ec2User"@"$ec2Host"