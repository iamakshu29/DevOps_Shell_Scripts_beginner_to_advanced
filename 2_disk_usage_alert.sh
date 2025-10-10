#!/bin/bash

# This will alert or Send a warning if disk usage > 50%.
# Author: Akshat Verma
# Version: v0.0.1
# Date: 2024-09-10
#

echo "If the alert is greater than 50 we will alert them"
echo "checking alert"

usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ $usage -gt 50 ]; then
    echo "ALERT ALERT ALERT"
else
    echo "Guys it safe"
fi


