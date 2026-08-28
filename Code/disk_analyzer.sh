#!/bin/bash

source colors.sh
source logger.sh

if [ "$EUID" -ne 0 ]
then
    echo -e "${RED}Please run this program as root.${NC}"
    exit
fi


disk_usage(){

echo
echo -e "${BLUE}Disk Usage${NC}"
echo

df -h

log_action "Viewed Disk Usage"

echo
read -p "Press Enter..."

}




directory_size(){

read -p "Enter Directory Name: " dir

if [ -d "$dir" ]
then

    echo
    du -sh "$dir"

    log_action "Checked Directory Size : $dir"

else

    echo -e "${RED}Directory Not Found${NC}"

fi

echo
read -p "Press Enter..."

}


largest_files(){

echo
echo "Top 10 Largest Files"
echo

find / -type f -exec du -h {} + 2>/dev/null | sort -rh | head -10

log_action "Viewed Largest Files"

echo
read -p "Press Enter..."

}




largest_directories(){

echo
echo "Top 10 Largest Directories"
echo

du -h / 2>/dev/null | sort -rh | head -10

log_action "Viewed Largest Directories"

echo
read -p "Press Enter..."

}



mounted_filesystems(){

echo

lsblk

echo

mount | column -t

log_action "Viewed Mounted File Systems"

echo
read -p "Press Enter..."

}


inode_usage(){

echo

df -i

log_action "Viewed Inode Usage"

echo
read -p "Press Enter..."

}

disk_warning(){

usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo

echo "Current Disk Usage : $usage%"

if [ "$usage" -ge 90 ]
then

    echo -e "${RED}WARNING! Disk Usage Above 90%${NC}"

else

    echo -e "${GREEN}Disk Usage Normal${NC}"

fi

log_action "Checked Disk Warning"

echo

read -p "Press Enter..."

}

while true
do

clear

echo "========================================"
echo "      DISK USAGE ANALYZER MODULE"
echo "========================================"

echo
echo "1. View Disk Usage"
echo "2. Directory Size"
echo "3. Largest Files"
echo "4. Largest Directories"
echo "5. Mounted File Systems"
echo "6. Inode Usage"
echo "7. Disk Warning"
echo "8. Back"
echo

read -p "Choose Option : " choice

case $choice in

1)
    disk_usage
    ;;

2)
    directory_size
    ;;

3)
    largest_files
    ;;

4)
    largest_directories
    ;;

5)
    mounted_filesystems
    ;;

6)
    inode_usage
    ;;

7)
    disk_warning
    ;;

8)
    break
    ;;

*)
    echo -e "${RED}Invalid Option${NC}"
    sleep 2
    ;;

esac

done
