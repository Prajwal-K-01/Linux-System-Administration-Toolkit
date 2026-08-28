#!/bin/bash

clear

echo "==============================================="
echo " Linux System Administration Toolkit (LSAT)"
echo "==============================================="

echo
echo "1. User Management"
echo "2. Permission Management"
echo "3. Disk Usage Analyzer"
echo "4. Log Analyzer"
echo "5. Backup Manager"
echo "6. System Information"
echo "7. Exit"

echo
read -p "Enter your choice: " choice

case $choice in

1)
    ./user_management.sh
    ;;

2)
    ./permission_management.sh
    ;;

3)
    ./disk_usage.sh
    ;;

4)
    ./log_analyzer.sh
    ;;

5)
    ./backup.sh
    ;;

6)
    ./system_info.sh
    ;;

7)
    exit
    ;;

*)
    echo "Invalid Choice"
    ;;

esac
