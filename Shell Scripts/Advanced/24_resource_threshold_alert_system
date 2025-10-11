#!/bin/bash

#########
# This script will Alert if CPU > 80% or Memory > 75% with timestamps.
# Author AKSHAT VERMA
# DATE 10-10-2025
##########

# check for CPU
cpuUsage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# check for memory
totalMem=$(free -m | grep Mem | awk '{print $2}')
usedMem=$(free -m | grep Mem | awk '{print $3}')
memUsage=$(( usedMem * 100 / totalMem ))

if [ "$cpuUsage" -gt 80 ]; then
    echo "CPU usage is above 80% : ${cpuUsage}%"
    echo "Alert"
    echo " CPU is ${cpuUsage}% at $(date)" >> 24_file_logs.txt
fi

if [ "$memUsage" -gt 75 ]; then
    echo "Memory usage is above 75% : ${memUsage}%"
    echo "Alert"
    echo " Memory is ${memUsage}% at $(date)" >> 24_file_logs.txt
fi

# EXPLAINATION
# for cpu usage => cpuUsage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)
# Why USE this -> as the output will be in decimal. For ex - 4.6 (so we only want the first part i.e. 4)
# we only want to know this part
# cut -d. -f1

# cut -> it is a command line tool used to "extract section" of text from input
# -d. -> it specifies the delimiter the separates fields. Here (.) dot is the delimiter.
    # the text got splits, wherever there is a dot(.)
    # it splits into 2 fields -> f1 and f2
# -f1 -> to show field1 only