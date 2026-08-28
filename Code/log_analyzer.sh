#!/bin/bash

source colors.sh
source logger.sh

if [ "$EUID" -ne 0 ]
then
	echo -e "${RED}Please run as root.${NC}"
	exit
fi


view_logs(){

echo

	less /var/log/messages
	log_action "Viewed System Logs"

}

search_errors(){

echo

	grep -i error /var/log/messages
	log_action "Searched Errors"

echo

read -p "Press Enter..."

}


search_warnings(){

echo

	grep -i warnings /var/log/messages
	log_action "Searched Warnings"

echo
read -p "Press Enter..."

}


failed_login() {

echo

	grep "Failed" /var/log/secure

	log_action "viewed Failed Logins"

echo

read -p "Press Enter..."

}


successful_login() {

echo

	grep "Accepted" /var/log/secure

	log_action "Viewed Successful logins"

echo

read -p "Press Enter..."

}


search_keyword(){

read -p "Enter Keyword: " keyword

echo

	grep -i "$keyword" /var/log/messages

	log_action "Keyword Search: $keyword"

echo

read -p "press Enter..."

}


count_errors(){

count=$(grep -ic error /var/log/messages)

echo

echo "Total Errors: $count"

log_action "Counted Errors"

echo

read -p "Press Enter..."

}


export_report(){

REPORT="../Reports/log_report.txt"

echo "Log Report" > "$REPORT"

echo "Generated : $(data)" >> "$REPORT"

echo >> "$REPORT"

echo "Errors" >> "$REPORT"

grep -i error /var/log/messages >> "$REPORT"

echo >> "$REPORT"

echo "Warnings" >> "REPORT"

grep -i warning /var/log/messages >> "REPORT"

echo

echo -e "${GREEN}Report Saved${NC}"

echo "$REPORT"

log_action "Generated Log Report"

echo

read -p "Press Enter..."

}



while true
do 

clear

echo "==========================================="
echo "           LOG ANALYZER MODULE             "
echo "==========================================="


echo

echo "1. View Logs"
echo "2. Search Errors"
echo "3. Search Warnings"
echo "4. Failed Login"
echo "5. Successful Login"
echo "6. Search Keyword"
echo "7. Count Errors"
echo "8. Export Reoprt"
echo "9. Back"

echo

read -p "Choose Option: " choice

case $choice in

1)
	view_logs
	;;

2)
	search_errors
	;;

3)
	search_warnings
	;;

4)
	failed_login
	;;

5)
	successful_login
	;;

6)
	search_keyword
	;;

7)
	count_errors
	;;

8)
	export_report
	;;

9)
	break
	;;

*)
	echo "Invalid Option"
	sleep 2
	;;

esac

done
