#!/bin/bash

# This will email-alert or Send a warning if disk usage > 50%.
# Author: Akshat Verma
# Version: v0.0.1
# Date 2025-10-06
#

echo "checking alert"
echo
usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$usage" -gt 50 ]; then
    echo "ALERT ALERT ALERT"
else
    echo "Guys it safe"
fi



######### Explanation of the command used to get disk usage percentage:

# df -h / | awk 'NR==2 {print $5}' | tr -d '%'

# df -h / → checks only the root filesystem.

# awk 'NR==2 {print $5}' -> extracts the 5th column (use percentage).
# NR==2 means “when the line number is 2”.

# tr -d '%' → tells tr to delete (-d) every '%' character from its input. (50% -> 50)
# tr stands for “translate” or “transform”.
# It reads from standard input and replaces or deletes characters as instructed.

