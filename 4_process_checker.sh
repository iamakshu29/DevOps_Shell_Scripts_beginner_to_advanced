#!/bin/bash

# Script will check particular service and start it if its not
# Check if a service (like nginx or mysql) is running; start it if not.
# Author: Akshat Verma
# Version: v0.0.1
# Date: 2024-09-10
#

# Validate if the correct number of arguements are passed
service="$1"
if [ $# -ne 1 ]; then
    echo "usage: $0 <service_name>"
    exit 1
fi 

# Use command if service is managed by systemd
# systemctl is-active

id=$(pgrep "$service")
pgrep "$service"
if [ $? -eq 0 ]; then
    echo "service is up and running"
    echo "PID(s): $(echo $id | tr '\n' ' ')"
else
    systemctl start "$service"
fi
