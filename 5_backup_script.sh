#!/bin/bash

#########
# This script is Comrpress the directory (e.g., /etc) and store it with a timestamp
# Author AKSHAT VERMA
# DATE 10-10-2025
#########

# Getting the required file
DIR=$1
if [ -z "$DIR" ]; then
  echo "Usage: $0 <directory_to_backup>"
  exit 1
fi

DATE=$(date +"%Y-%m-%dT%H:%M:%S")

echo "Compressing the file"
zip backup_$DATE $DIR