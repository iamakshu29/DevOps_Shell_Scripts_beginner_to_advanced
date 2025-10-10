#!/bin/bash

# This script will compress logs and upload to AWS S3 buckets

echo "Script Usage"
if [ $# -ne 2 ]; then
    echo "usage: $0 <path> <region>"
    exit 1
fi

LOGDIR=$1
REGION=$2 
DATE=$(date +"%Y-%m-%dT%H:%M:%S")

ARCHIVE_DIR="$LOGDIR/compressed_logs"
mkdir -p "$ARCHIVE_DIR"

TEMP_DIR=$(mktemp -d)
# find the logs which are not been modified in 7 days and compress them
echo "Finding and compressing old logs in $LOGDIR..."
find "$LOGDIR" -type f -name "*.log" -mtime +7 -exec mv {} "$TEMP_DIR/" \;

# Check if any files were moved
if [ -z "$(ls -A "$TEMP_DIR")" ]; then
    echo "No old logs to compress. Exiting."
    rm -rf "$TEMP_DIR"
    exit 0
fi

ARCHIVE_FILE="$ARCHIVE_DIR/logs_$DATE.tar.gz"
echo "Compressing logs into $ARCHIVE_FILE..."
tar -czf "$ARCHIVE_FILE" -C "$TEMP_DIR" .
rm -rf "$TEMP_DIR"

echo "Compression done."

# uploading to S3
echo "uploading files to S3"
aws s3 cp "$ARCHIVE_FILE" "s3://rev-terraform-state-akshat/logs_$DATE.tar.gz" --region "$REGION"
echo "Upload completed."