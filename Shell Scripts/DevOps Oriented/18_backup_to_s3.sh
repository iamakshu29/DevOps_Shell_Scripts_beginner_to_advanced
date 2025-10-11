#!/bin/bash

#########
# This script will compress logs and upload to AWS S3 buckets
# Author AKSHAT VERMA
# DATE 10-10-2025
##########

echo "Script Usage"
if [ $# -ne 2 ]; then
    echo "usage: $0 <path> <region>"
    exit 1
fi

LOGDIR=$1
REGION=$2 
DATE=$(date +"%Y-%m-%dT%H-%M-%S")

ARCHIVE_DIR="$LOGDIR/compressed_logs"
mkdir -p "$ARCHIVE_DIR"

# creating a temp dir.
TEMP_DIR=$(mktemp -d)

# finding the logs which are not been modified in 7 days and move them into temp dir
echo "Finding and compressing old logs in $LOGDIR..."
find "$LOGDIR" -type f -name "*.log" -mtime +7 -exec mv {} "$TEMP_DIR/" +

# Check if any files were moved
if [ -z "$(ls -A "$TEMP_DIR")" ]; then
    echo "No old logs to compress. Exiting."
    rm -rf "$TEMP_DIR"
    exit 0
fi

ARCHIVE_NAME="$ARCHIVE_DIR/logs_$DATE.tar.gz"
echo "Compressing logs into $ARCHIVE_FILE..."
tar -czf "$ARCHIVE_NAME" -C "$TEMP_DIR" .
rm -rf "$TEMP_DIR"

echo "Compression done."

# uploading to S3
echo "uploading files to S3"

if aws s3 cp "$ARCHIVE_NAME" "s3://rev-terraform-state-akshat/logs_$DATE.tar.gz" --region "$REGION"; then
    echo "Upload completed successfully."
else
    echo "Upload failed!" >&2
    exit 1
fi


############## Explaining tar command
# tar - command-line utility for creating/extracting archives.

# Options: -czf
# c → create a new archive.
# z → compress with gzip (so the output will be .tar.gz).
# f → filename of the archive follows ("$ARCHIVE_NAME").

# "$ARCHIVE_NAME"
# Name of the archive you want to create.

# -C "$TEMP_DIR"
# Change directory to $TEMP_DIR before adding files.
# This ensures that the files inside the archive do not include the full path, only their relative path from $TEMP_DIR.
# Example: If $TEMP_DIR contains app.log and db.log, the archive will store just app.log and db.log, not /tmp/tmp1234/app.log.

# . (dot)
# Means “archive everything in the current directory” which, because of -C "$TEMP_DIR", refers to everything inside $TEMP_DIR.
# So Archive everything present in $TEMP_DIR