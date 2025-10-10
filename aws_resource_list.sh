#!/bin/bash

# Script will list all the resource in AWS account
# Author: Akshat Verma
# Version: v0.0.1
# Date: 2024-06-10
#
# Supported services by Script
# EC2, S3, VPC, Lambda, .....
#
# Usage: ./example.sh <region> <service_name>
# Example: ./example.sh us-east-1 ec2

# Validate if the correct number of arguements are passed
if [ $# -ne 2 ]; then
    echo "usage: $0 <region> <service_name>"
    exit 1
fi

# Check if the aws cli is installed
if command -v aws >/dev/null 2>&1; then
    echo "AWS CLI is installed"

    echo "Checking if AWS CLI is configured"
    if [ ! -d ~/.aws ]; then
        echo "No, AWS CLI is not configured"
        echo "Configuring AWS CLI"
        aws configure
    else
        echo "Yes, AWS CLI is configured:"
    fi

else
    echo "Installing AWS CLI :"
    sudo apt update > /dev/null -y
    sudo apt install -y unzip curl > /dev/null
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip > /dev/null
    sudo ./aws/install

    echo "AWS CLI installed successfully"

    echo "Now Configuring AWS CLI too"
    aws configure
fi


# Checking the services.
case $2 in
    ec2)
        echo "Listing EC2 instances in $1"
        aws ec2 describe-instances --region $1
        ;;
    s3)
        echo "Listing S3 buckets in $1"
        aws s3api list-buckets --region $1
        ;;
    ebs)
        echo "Listing EBS in $1"
        aws ec2 describe-volumes --region $1
        ;;
    rds)
        echo "Listing RDS instances in $1"
        aws rds describe-db-instances --region $1
        ;;
    *)
        echo "Invalid, Enter valid service"
        exit 1
        ;;
esac