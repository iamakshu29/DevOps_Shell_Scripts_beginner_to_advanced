#!/bin/bash

# Script will compress and delete all the logs which are more than X days
# Author: Akshat Verma
# Version: v0.0.1
# Date: 2025-09-10

echo "Checking the logs which are not modified for more than 7 days and deleting it"
find /var/log -type f -name "*.log" -mtime +7 -exec rm {} \;

echo "Listing the logs which are not modified for more than 1 days"
find /var/log -type f -name "*.log" -mtime +30 -exec ls {} \;

echo "Compressing the logs which are not modified for more than 1 days"
find /var/log -type f -name "*.log" -mtime +30 -exec gzip {} \;






######### Explanation of the find commands used:

# 1. Find files by name
# find /path/to/search -name "filename.txt"
# If finding current path use . => find . -name "filename.txt"

# 2. Find files by extension (-type flag) (f means files)
# find /home/user/Documents -type f -name "*.pdf"
# It will finds all PDF files in path.

# 3. Find directories by name ( d means dir)
# find /var/www -type d -name "html"
# Finds directories named html under /var/www.

# 4. Find all files modified in the last 7 days
# find /home/user -type f -mtime -7

# -mtime 7 exactly 7 days
# -mtime +7 more than 7 days
# -mtime -7 withing 7 days

# 5. Find commands not piped as it doesnot take the o/p of previous that why we can use multi filter in one commands
# find | find (not work, o/p is of the second find alone)

# Multi filter together in find command
# find /var/log -type f -name "*.log" -mtime +7
# (it will find the files of type ending with (.log), which has modified more than 7 days ago)

# 6. Execute a command on filtered files (-exec flag)
# find /var/log -type f -name "*.log" -mtime +7 -exec rm {} \;

# 1️⃣ How -exec works

# -exec lets you run a command on each file that find finds.
# Syntax:
# find <path> <conditions> -exec <command> {} \;

# Where:
# {} → is a placeholder for the filename that find found.
# \; → marks the end of the -exec command. (The backslash escapes the semicolon for the shell.)

# Instead of \; we can use, + why?
# It tells find to pass all the found files to the command at once, instead of one by one.
# Syntax :- find <path> <conditions> -exec <command> {} +