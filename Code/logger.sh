#!/bin/bash


source config.sh


log_action(){
	
	local action="$1"
	local status="${2:-SUCCESS}"

	local timestamp
	local username

	timestamp=$(date '+%Y-%m-%d %H:%M:%S')
	username=$(whoami)

	mkdir -p "$LOG_DIR"

	cat >> "$LOG_FILE" <<EOF

-----------------------------------------------
Date     :  $(date '+%Y-%m-%d')
Time     :  $(date '+%H:%M:%S')
User     :  $username
Action   :  $action
Status   :  $status
----------------------------------------------
EOF


}
