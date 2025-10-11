#!/bin/bash

########################
# This script is used to run terraform commands - init, plan, apply
# Author Akshat Verma
# Date 10 oct 2025
# version 0.0.1
########################

if [ "$#" -ne 1 ]; then
    echo "usage: $0 <path>"
    exit 1
fi

path=$1

echo "traversing to the path: $path"
cd "$path" || { echo "Error: Failed to change directory to $path"; exit 1; }

echo "Initializing terraform"
terraform init

echo "Planning terraform"
terraform plan

echo "Applying terraform"
terraform apply --auto-approve

read -p "Do you want to destroy the architecture? (yes/no) " bool
if [ "$bool" == "yes" ] || [ "$bool" == "y" ]; then
    echo "Destroying terraform"
    terraform destroy --auto-approve
else
    echo "Not destroying the architecture now"
    exit 0
fi


