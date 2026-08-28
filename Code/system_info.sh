#!/bin/bash

source colors.sh
source logger.sh

if [ "$EUID" -ne 0 ]
then
    echo -e "${RED}Please run as root.${NC}"
    exit
fi


hostname_info(){

echo

hostname

log_action "Viewed Hostname"

echo
read -p "Press Enter..."

}


os_info(){

echo

cat /etc/os-release

log_action "Viewed OS Information"

echo
read -p "Press Enter..."

}



kernel_info(){

echo

uname -r

log_action "Viewed Kernel Version"

echo
read -p "Press Enter..."

}


kernel_info(){

echo

uname -r

log_action "Viewed Kernel Version"

echo
read -p "Press Enter..."

}

cpu_info(){

echo

lscpu

log_action "Viewed CPU Information"

echo
read -p "Press Enter..."

}

memory_info(){

echo

free -h

log_action "Viewed Memory Information"

echo
read -p "Press Enter..."

}


disk_info(){

echo

df -h

log_action "Viewed Disk Information"

echo
read -p "Press Enter..."

}


ip_info(){

echo

ip addr

log_action "Viewed IP Address"

echo
read -p "Press Enter..."

}


logged_users(){

echo

who

log_action "Viewed Logged Users"

echo
read -p "Press Enter..."

}


uptime_info(){

echo

uptime

log_action "Viewed Uptime"

echo
read -p "Press Enter..."

}


running_processes(){

echo

ps -ef | head -20

log_action "Viewed Running Processes"

echo
read -p "Press Enter..."

}

network_info(){

echo

ip link show

log_action "Viewed Network Interfaces"

echo
read -p "Press Enter..."

}



system_report(){

clear

echo "=========================================="
echo "        SYSTEM INFORMATION REPORT"
echo "=========================================="

echo
echo "Hostname"
hostname

echo
echo "Operating System"
grep PRETTY_NAME /etc/os-release

echo
echo "Kernel"
uname -r

echo
echo "CPU"
lscpu | grep "Model name"

echo
echo "Memory"
free -h

echo
echo "Disk"
df -h

echo
echo "IP Address"
hostname -I

echo
echo "Logged Users"
who

echo
echo "Uptime"
uptime

log_action "Generated System Report"

echo
read -p "Press Enter..."

}





while true
do

clear

echo "========================================"
echo "      SYSTEM INFORMATION MODULE"
echo "========================================"

echo
echo "1. Hostname"
echo "2. Operating System"
echo "3. Kernel Version"
echo "4. CPU Information"
echo "5. Memory Information"
echo "6. Disk Information"
echo "7. IP Address"
echo "8. Logged Users"
echo "9. Uptime"
echo "10. Running Processes"
echo "11. Network Interfaces"
echo "12. Complete System Report"
echo "13. Back"
echo

read -p "Choose Option : " choice

case $choice in

1)
hostname_info
;;

2)
os_info
;;

3)
kernel_info
;;

4)
cpu_info
;;

5)
memory_info
;;

6)
disk_info
;;

7)
ip_info
;;

8)
logged_users
;;

9)
uptime_info
;;

10)
running_processes
;;

11)
network_info
;;

12)
system_report
;;

13)
break
;;

*)
echo -e "${RED}Invalid Option${NC}"
sleep 2
;;

esac

done















generate_html_report(){

REPORT="../Reports/system_report.html"

cat > "$REPORT" <<EOF

<html>

<head>

<title>System Report</title>

</head>

<body>

<h1>Linux System Report</h1>

<h2>Hostname</h2>

<pre>

$(hostname)

</pre>

<h2>Kernel</h2>

<pre>

$(uname -r)

</pre>

<h2>Memory</h2>

<pre>

$(free -h)

</pre>

<h2>Disk</h2>

<pre>

$(df -h)

</pre>

</body>

</html>

EOF

echo "HTML Report Generated"

}
