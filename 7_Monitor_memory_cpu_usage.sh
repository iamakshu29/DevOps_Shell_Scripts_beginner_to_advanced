#!/bin/bash

#########
# This script is used to monitor memory and cpu usage every 5 minutes
# Author AKSHAT VERMA
# DATE 10-102025
##########

echo "Report Generated on $(date)" >> file.txt

TOTAL=$(free -m | awk 'NR==2 {print $2}')
USED=$(free -m | awk 'NR==2 {print $3}')
AVAILABLE=$(free -m | awk 'NR==2 {print $7}')

# sum of us + sy
TOP=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

echo "Monitoring memory" >> file.txt
echo "Total memory is $TOTAL" >> file.txt
echo "Used memory is $USED" >> file.txt
echo "Available memory is $AVAILABLE" >> file.txt

echo "Monitoring CPU usage" >> file.txt
echo "CPU usage is $TOP" >> file.txt