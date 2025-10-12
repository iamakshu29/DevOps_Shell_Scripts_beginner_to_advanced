#!/bin/bash

########################
# This script is used to Remove dangling images, stopped containers, old volumes.
# Author Akshat Verma
# Date 12 oct 2025
# version 0.0.1
########################

echo "Removing stopped containers, unused networks, dangling images and build cache"
docker system prune -a -f > /dev/null

echo "Removed unused volume"
docker volume prune -f > /dev/null

echo "Docker cleanup complete."

echo
echo "Checking memory now"
df -h