#!/bin/bash

#########
# This script is used to Ping a URL or use curl to check response code.
# 0 success
# 1 host unreachable
# 2 invalid command
# Author AKSHAT VERMA
# DATE 10-102025
##########

URL=$1
if [ -z "$URL" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

ping -c 1 $URL
# why ping -c 1 ? to send only 1 packet to check availability
code=$?

if [ $code -eq 0 ]; then
    echo "Host is reachable"
    exit 0
elif [ $code -eq 1 ]; then
    echo "Host is unreachable"
    exit 1
else
    echo "Invalid URL"
    exit 2
fi

