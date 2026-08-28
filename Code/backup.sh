#!/bin/bash

source colors.sh
source logger.sh



if [ "$EUID" -ne 0 ]
then
    echo -e "${RED}Please run as root.${NC}"
    exit
fi


backup_directory(){

read -p "Enter Directory to Backup: " dir

if [ ! -d "$dir" ]
then
        echo -e "${RED}Directory Not Found${NC}"
        read -p "Press Enter..."
        return

fi


backup_name=$(basename "$dir")_$(date +%Y%n%d_%H%H%S).tar.gz

tar -czf ../Backups/$backup_name "$dir"

if [ $? -eq 0 ]
then
        echo -e "${GREEN}Backup Created Successfuly${NC}"
        echo "Backup File: $backup_name"

        log_action "Backup Created: $backup_name"
else
        echo -e "${RED}Backup Failed${NC}"
fi

read -p "Press Enter..."
-- INSERT -- W10: Warning: Changing a readonly file
