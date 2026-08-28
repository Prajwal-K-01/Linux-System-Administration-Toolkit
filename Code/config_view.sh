#!/bin/bash

# Load color definitions
source "$(dirname "$0")/colors.sh"

# Display the main project banner
banner() {

    clear

    echo -e "${CYAN}"
    echo "=============================================================="
    echo "           LINUX SYSTEM ADMINISTRATION TOOLKIT"
    echo "=============================================================="
    echo -e "${NC}"

    echo -e "${BLUE}User     :${NC} $(whoami)"
    echo -e "${BLUE}Hostname :${NC} $(hostname)"
    echo -e "${BLUE}Date     :${NC} $(date '+%Y-%m-%d %H:%M:%S')"

    echo
}

# Display a successful operation message
success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

# Display an error message
error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Display a warning message
warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Display an information message
info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

# Display a horizontal separator
line() {
    echo "--------------------------------------------------------------"
}

# Display a section header
header() {

    echo
    echo -e "${CYAN}==============================================================${NC}"
    echo -e "  $1"
    echo -e "${CYAN}==============================================================${NC}"
    echo
}

# Pause the program
pause() {

    echo
    read -p "Press Enter to continue..."
}

# Display the main menu
main_menu() {

    echo -e "${GREEN}1.${NC} User Management"
    echo -e "${GREEN}2.${NC} Permission Management"
    echo -e "${GREEN}3.${NC} Disk Usage Analyzer"
    echo -e "${GREEN}4.${NC} Log Analyzer"
    echo -e "${GREEN}5.${NC} Backup Manager"
    echo -e "${GREEN}6.${NC} System Information"
    echo -e "${GREEN}7.${NC} Configuration"
    echo -e "${GREEN}8.${NC} View Logs"
    echo -e "${GREEN}9.${NC} Exit"

    line
}
