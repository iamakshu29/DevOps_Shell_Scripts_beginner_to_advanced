#!/bin/bash

# Script will compress all the logs and delete the logs which are more than X days
# Author: Akshat Verma
# Version: v0.0.1
# Date: 2024-09-10
#
#

echo "Checking the logs which are not modified for more than 7 days and deleting it"
find /var/log -type f -name "*.log" -mtime +7 -exec rm {} \;

echo "Listing the logs which are not modified for more than 1 days"
find /var/log -type f -name "*.log" -mtime +30 -exec ls {} \;

echo "Compressing the logs which are not modified for more than 1 days"
find /var/log -type f -name "*.log" -mtime +30 -exec gzip {} \;
