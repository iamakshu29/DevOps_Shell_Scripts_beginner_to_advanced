#!/bin/bash

#########
# This script is used to count errors or warning from log files.
# Author AKSHAT VERMA
# DATE 10-10-2025
##########

echo "getting the file"
FILE=$1

ERROR_COUNT=$(cat $FILE | grep "error" | wc -l)
WARNING_COUNT=$(cat $FILE | grep "warning" | wc -l)

SUM=$ERROR_COUNT+$WARNING_COUNT
echo "total error and warning in log file are $SUM"

###########################################################################################

#!/bin/bash

#########
# This script is used to count errors or warnings from log files.
# Author: AKSHAT VERMA
# DATE: 10-10-2025
##########

# if [ -z "$1" ]; then
#   echo "Usage: $0 <logfile>"
#   exit 1
# fi

# FILE=$1

# if [ ! -f "$FILE" ]; then
#   echo "File not found: $FILE"
#   exit 1
# fi

# ERROR_COUNT=$(grep -i "error" "$FILE" | wc -l)
# WARNING_COUNT=$(grep -i "warning" "$FILE" | wc -l)

# SUM=$((ERROR_COUNT + WARNING_COUNT))

# echo "Total errors and warnings in log file are $SUM"