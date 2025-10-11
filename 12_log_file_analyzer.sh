#!/bin/bash

#########
# This script is used to count errors or warning from log file.
# Author AKSHAT VERMA
# DATE 10-10-2025
##########

echo "getting the file"
if [ -z "$1" ]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

FILE=$1

# checking if the input is a file or not
if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE"
fi

ERROR_COUNT=$(grep -i "error" "$FILE" | wc -l)
WARNING_COUNT=$(grep -i "warning" "$FILE" | wc -l)

SUM=$((ERROR_COUNT)+($WARNING_COUNT))
echo "total error and warning in log file are $SUM"
