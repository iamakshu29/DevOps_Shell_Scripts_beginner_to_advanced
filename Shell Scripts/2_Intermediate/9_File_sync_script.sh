#!/bin/bash

########################
# This script is used to Sync local folder to remote using rsync or scp
# Author Akshat Verma
# Date 10 oct 2025
# version 0.0.1

#### APPROACH
# input variables
# connction check
# sync operation
# logging
# Automate via cronjob
#########################


sourcePath=$1
remoteUser=$2
remoteHost=$3
remotePath=$4
sshkey=$5
LOGFILE="sync_log_file.txt"

# creating a log file
mkdir -p $LOGFILE

# Script Input Validation
if [ $# -ne 5 ]; then
    echo "usage: $0 <dirPath> <remoteUser> <remoteHost> <remotePath> <sshkey>"
    exit 1
fi

# Connection Check
echo "Checking connection using SSH"
ssh -i "$sshkey" "$remoteUser"@"$remoteHost" "echo connected to \$(hostname)"
if [ $? -ne 0 ]; then
    echo "connection failed"
    exit 1
fi

# perform sync operation and then check return status of rsync command, if failed print error msg or send notifications
# for dry run add the -n flag -> -avzn
rsync -avz -e "ssh -i $sshkey" "$sourcePath" "$remoteUser"@"$remoteHost":"$remotePath" >> "$LOGFILE" 2>&1
if [ $? -ne 0 ]; then
    echo "rsync failed"
    exit 1
fi