# 🐧 Linux System Administration Toolkit

<p align="center">

<img src="https://img.shields.io/badge/OS-Red%20Hat%20Enterprise%20Linux-red?style=for-the-badge&logo=redhat&logoColor=white">

<img src="https://img.shields.io/badge/Language-Bash-green?style=for-the-badge&logo=gnubash&logoColor=white">

<img src="https://img.shields.io/badge/Automation-Shell%20Scripting-blue?style=for-the-badge&logo=linux&logoColor=white">

<img src="https://img.shields.io/badge/Project-Completed-success?style=for-the-badge">

</p>

<p align="center">

<b>A Modular Linux System Administration and Automation Toolkit Built with Bash</b>

</p>

<p align="center">

Manage Users • Control Permissions • Analyze Disk Usage • Analyze Logs • Backup Data • Monitor System

</p>

---

# 📌 About The Project

The **Linux System Administration Toolkit** is a modular command-line based administration project developed using **Bash Shell Scripting** on **Red Hat Enterprise Linux**.

The project combines multiple Linux system administration tasks into a single interactive toolkit.

Instead of manually executing multiple commands for different administrative tasks, administrators can use one centralized application to perform common operations.

The toolkit focuses on practical Linux administration, automation, monitoring, security, and troubleshooting.

---

# 🎯 Project Objective

The main objective of this project is to simplify repetitive Linux administration tasks by providing a structured and modular command-line toolkit.

The project demonstrates how Bash scripting can be used to automate and organize real-world Linux administration operations.

### Main Goals

- Automate common Linux administration tasks
- Provide a centralized command-line interface
- Manage Linux users
- Manage file and directory permissions
- Monitor disk usage
- Analyze system logs
- Create and restore backups
- Display system information
- Validate user input
- Maintain centralized activity logs
- Follow modular scripting practices

---

# ✨ Key Features

| Module | Description |
|---|---|
| 👤 User Management | Create, delete, verify and list Linux users |
| 🔐 Permission Management | View and modify file and directory permissions |
| 💽 Disk Usage Analyzer | Analyze filesystem and directory storage |
| 🔎 Log Analyzer | Search errors, warnings and authentication events |
| 📦 Backup Manager | Create, list, restore and delete backups |
| 🖥️ System Information | Display CPU, memory, disk, network and kernel information |
| ⚙️ Configuration Manager | Centralize project configuration |
| 📝 Activity Logger | Record important administrative operations |
| 🛡️ Input Validator | Validate usernames, paths and permissions |
| 🎨 CLI Interface | Provide an interactive terminal-based interface |

---

# 🏗️ System Architecture

```text
                         ┌──────────────────────┐
                         │       main.sh        │
                         │   Main Controller    │
                         └──────────┬───────────┘
                                    │
              ┌─────────────────────┼─────────────────────┐
              │                     │                     │
              ▼                     ▼                     ▼
      ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
      │     User     │      │  Permission  │      │     Disk     │
      │  Management  │      │  Management  │      │   Analyzer   │
      └──────────────┘      └──────────────┘      └──────────────┘
              │                     │                     │
              └─────────────────────┼─────────────────────┘
                                    │
              ┌─────────────────────┼─────────────────────┐
              │                     │                     │
              ▼                     ▼                     ▼
      ┌──────────────┐      ┌──────────────┐      ┌──────────────┐
      │     Log      │      │    Backup    │      │    System    │
      │   Analyzer   │      │   Manager    │      │ Information  │
      └──────────────┘      └──────────────┘      └──────────────┘
              │                     │                     │
              └─────────────────────┼─────────────────────┘
                                    │
                         ┌──────────▼──────────┐
                         │  Shared Components  │
                         ├─────────────────────┤
                         │ config.sh           │
                         │ logger.sh           │
                         │ validator.sh        │
                         │ ui.sh               │
                         │ colors.sh           │
                         └─────────────────────┘

