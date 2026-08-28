#!/bin/bash

source colors.sh
source logger.sh

if [ "$EUID" -ne 0 ]
then
    echo -e "${RED}Please run this program as root.${NC}"
    exit
fi


view_permission(){

read -p "Enter File Name : " file

if [ -e "$file" ]
then

    echo
    ls -l "$file"

else

    echo -e "${RED}File Not Found${NC}"

fi

read -p "Press Enter..."

}



change_permission(){

read -p "Enter File Name : " file

if [ ! -e "$file" ]
then

    echo -e "${RED}File Not Found${NC}"

else

    read -p "Enter Permission (Example:755): " permission

    chmod "$permission" "$file"

    if [ $? -eq 0 ]
    then

        echo -e "${GREEN}Permission Changed Successfully${NC}"

        log_action "Changed Permission of $file to $permission"

    else

        echo -e "${RED}Failed${NC}"

    fi

fi

read -p "Press Enter..."

}



change_owner(){

read -p "Enter File Name : " file

if [ ! -e "$file" ]
then

    echo -e "${RED}File Not Found${NC}"

else

    read -p "Enter New Owner : " owner

    chown "$owner" "$file"

    if [ $? -eq 0 ]
    then

        echo -e "${GREEN}Owner Changed Successfully${NC}"

        log_action "Changed Owner of $file to $owner"

    else

        echo -e "${RED}Invalid Owner${NC}"

    fi

fi

read -p "Press Enter..."

}



change_group(){

read -p "Enter File Name : " file

if [ ! -e "$file" ]
then

    echo -e "${RED}File Not Found${NC}"

else

    read -p "Enter Group Name : " group

    chgrp "$group" "$file"

    if [ $? -eq 0 ]
    then

        echo -e "${GREEN}Group Changed Successfully${NC}"

        log_action "Changed Group of $file to $group"

    else

        echo -e "${RED}Invalid Group${NC}"

    fi

fi

read -p "Press Enter..."

}



file_information(){

read -p "Enter File Name : " file

if [ -e "$file" ]
then

    echo

    stat "$file"

else

    echo -e "${RED}File Not Found${NC}"

fi

read -p "Press Enter..."

}



while true
do

clear

echo "================================="
echo " PERMISSION MANAGEMENT MODULE"
echo "================================="

echo
echo "1. View Permission"
echo "2. Change Permission"
echo "3. Change Owner"
echo "4. Change Group"
echo "5. File Information"
echo "6. Back"
echo

read -p "Choose Option : " choice

case $choice in

1)
    view_permission
    ;;

2)
    change_permission
    ;;

3)
    change_owner
    ;;

4)
    change_group
    ;;

5)
    file_information
    ;;

6)
    break
    ;;

*)
    echo -e "${RED}Invalid Option${NC}"
    sleep 2
    ;;

esac

done
