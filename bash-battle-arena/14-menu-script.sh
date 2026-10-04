#!/bin/bash

while true; do
    echo ""
    echo "=== System Task Menu ==="
    echo "1) Check disk space"
    echo "2) Show system uptime"
    echo "3) List users"
    echo "4) Exit"
    read -p "Choose an option: " CHOICE

    case $CHOICE in
        1)
            df -h
            ;;
        2)
            uptime
            ;;
        3)
            who
            ;;
        4)
            echo "Exiting."
            break
            ;;
        *)
            echo "Invalid option, try again."
            ;;
    esac
done
