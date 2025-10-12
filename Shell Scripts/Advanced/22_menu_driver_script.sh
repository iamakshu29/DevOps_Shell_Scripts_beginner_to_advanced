#!/bin/bash

#########
# This script will let User selects options (start/stop service, check status, etc.).
# Author AKSHAT VERMA
# DATE 12-10-2025
##########

while true; do
    echo "Menu:"
    echo "1. Start Service"
    echo "2. Stop Service"
    echo "3. Check Service Status"
    echo "4. Exit"
    read -p "Enter your choice (1-4): " choice

    case $choice in
        1)
            read -p "Enter the service name to start: " serviceName
            sudo systemctl start "$serviceName"
            if [ $? -eq 0 ]; then
                echo "Service '$serviceName' started successfully."
            else
                echo "Failed to start service '$serviceName'. Please check the service name and try again."
            fi
            ;;
        2)
            read -p "Enter the service name to stop: " serviceName
            sudo systemctl stop "$serviceName"
            if [ $? -eq 0 ]; then
                echo "Service '$serviceName' stopped successfully."
            else
                echo "Failed to stop service '$serviceName'. Please check the service name and try again."
            fi
            ;;
        3)
            read -p "Enter the service name to check status: " serviceName
            sudo systemctl status "$serviceName"
            ;;
        4)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            ;;
    esac

    echo ""
done