#!/bin/bash

# Script will check particular service and start it if its not
# Check if a service (like nginx or mysql) is running; start it if not.
# Author: Akshat Verma
# Version: v0.0.1
# Date: 2025-09-10
#

# Validate if the correct number of arguments are passed
if [ $# -ne 1 ]; then
    echo "usage: $0 <service_name>"
    exit 1
fi 

service=$1

# Use command if service is managed by systemd
# systemctl is-active

id=$(pgrep $service)

# checking if $id is not empty
if [ -n "$id" ]; then
    echo "$service is up and running"
    echo "PID(s): $(echo $id | tr '\n' ' ')"
else
    echo "$service is not running. Starting..."
    systemctl start $service
fi


# Explaination
# pgrep <service> command -> will provide the PID of the process as O/P

# echo "PID(s): $(echo $id | tr '\n' ' ')"
# If there are multi PID then it will align all PID horizontally with sapce not vertically