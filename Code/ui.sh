#!/bin/bash

# ==========================================================
# Linux System Administration Toolkit
# UI Module
# ==========================================================

# Load color definitions
source "$(dirname "$0")/colors.sh"


# ==========================================================
# Main Banner
# ==========================================================

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


# ==========================================================
# Success Message
# ==========================================================

success() {

    echo -e "${GREEN}[SUCCESS]${NC} $1"

}


# ==========================================================
# Error Message
# ==========================================================

error() {

    echo -e "${RED}[ERROR]${NC} $1"

}


# ==========================================================
# Warning Message
# ==========================================================

warning() {

    echo -e "${YELLOW}[WARNING]${NC} $1"

}


# ==========================================================
# Information Message
# ==========================================================

info() {

    echo -e "${BLUE}[INFO]${NC} $1"

}


# ==========================================================
# Horizontal Line
# ==========================================================

line() {

    echo "--------------------------------------------------------------"

}


# ==========================================================
# Section Header
# ==========================================================

header() {

    echo
    echo -e "${CYAN}==============================================================${NC}"
    echo -e "  $1"
    echo -e "${CYAN}==============================================================${NC}"
    echo

}


# ==========================================================
# Pause Screen
# ==========================================================

pause() {

    echo
    read -p "Press Enter to continue..."

}


# ==========================================================
# Main Menu
# ==========================================================

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


# ==========================================================
# Loading Message
# ==========================================================

loading() {

    echo -n "Loading"

    for i in {1..3}
    do
        echo -n "."
        sleep 0.5
    done

    echo

}


# ==========================================================
# Confirmation
# ==========================================================

confirm() {

    read -p "$1 (y/n): " answer

    case "$answer" in

        y|Y)
            return 0
            ;;

        n|N)
            return 1
            ;;

        *)
            echo "Please enter y or n."
            return 1
            ;;

    esac

}
