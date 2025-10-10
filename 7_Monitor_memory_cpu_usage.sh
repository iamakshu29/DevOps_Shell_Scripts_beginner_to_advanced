#!/bin/bash

#########
# This script is used to monitor memory and cpu usage every 5 minutes
# Author AKSHAT VERMA
# DATE 10-102025
##########

echo "Report Generated on $(date)" > file.txt

echo "Monitoring memory"
TOTAL=$(free -m | awk 'NR==2 {print $2}')
USED=$(free -m | awk 'NR==2 {print $3}')
AVAILABLE=$(free -m | awk 'NR==2 {print $7}')

echo "Total memory is $TOTAL" >> file1.txt
echo "Used memory is $USED" >> file1.txt
echo "Available memory is $AVAILABLE" >> file1.txt