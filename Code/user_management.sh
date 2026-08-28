#!/bin/bash


source colors.sh
source logger.sh

if [ "$EUID" -ne 0 ]
then
	echo -e "${RED}Please run this program as root.${NC}"
	exit
fi

create_user(){

read -p "Enter Username : " username

id "$username" &>/dev/null

if [ $? -eq 0 ]
then
    echo
    echo "${YELLOW}User Already Exists${NC}"

else

    sudo useradd "$username"
    log_action "Created User: $username"

    if [ $? -eq 0 ]
    then
        echo
        echo -e "${GREEN}User Created Successfully${NC}"
    else
        echo
        echo "${RED}Failed to Create User${NC}"
    fi

fi

read -p "Press Enter..."

}


delete_user(){

read -p "Enter Username : " username

id "$username" &>/dev/null

if [ $? -ne 0 ]
then

    echo
    echo "User Does Not Exist"

else

    sudo userdel -rf "$username"

    log_action "Deleted User: $username
"



    if [ $? -eq 0 ]
    then
        echo
        echo "User Deleted Successfully"
    else
        echo
        echo "Failed to Delete User"
    fi

fi

read -p "Press Enter..."

}


list_users(){

echo

cut -d: -f1 /etc/passwd

echo

read -p "Press Enter..."
}


change_password(){

read -p "Enter Username : " username

id "$username" &>/dev/null


log_action "Changed Password: $username
"


if [ $? -ne 0 ]
then
    echo -e "${RED}User Does Not Exist${NC}"
else
    passwd "$username"
fi

read -p "Press Enter..."

}


lock_user(){

read -p "Enter Username : " username

id "$username" &>/dev/null

log_action "Locked User: $username
"

if [ $? -ne 0 ]
then
    echo -e "${RED}User Does Not Exist${NC}"
else

    passwd -l "$username"

fi

read -p "Press Enter..."

}



unlock_user(){

read -p "Enter Username : " username

id "$username" &>/dev/null


log_action "Unlocked User: $username
"




if [ $? -ne 0 ]
then

    echo -e "${RED}User Does Not Exist${NC}"

else

    passwd -u "$username"

fi

read -p "Press Enter..."

}



user_info(){

read -p "Enter Username : " username

id "$username" &>/dev/null

if [ $? -ne 0 ]
then

    echo -e "${RED}User Does Not Exist${NC}"

else

    echo

    id "$username"

    echo

    groups "$username"

fi

read -p "Press Enter..."

}


while true
do

clear

echo "=============================="
echo " USER MANAGEMENT MODULE"
echo "=============================="

echo

echo "1. Create User"
echo "2. Delete User"
echo "3. Change Password"
echo "4. List Users"
echo "5. Lock Users"
echo "6. Unlock User"
echo "7. User Information"
echo "8. Back"

echo

read -p "Choose Option : " choice

case $choice in

1)
    create_user
    ;;

2)
    delete_user
    ;;

3)
    change_password
    ;;

4)
    list_user
    ;;



5)
	lock_user
	;;

6)
	unlock_user
	;;

7)
	user_info
	;;

8)
    break
    ;;

*)
    echo "Invalid Choice"
    sleep 2
    ;;

esac

done
