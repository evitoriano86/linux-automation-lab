#!/bin/bash


THRESHOLD=80
LOG_FILE="$HOME/labs/linux-automation-lab/logs/disk.log"

USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

DATE=$(date)

if [ "$USAGE" -ge "$THRESHOLD" ]; then
	echo "[$DATE] ALERTA: Disco em $USAGE%" >> "$LOG_FILE"
        echo "ALERTA: Disco acima de $THRESHOLD%"
else
        echo "[$DATE] OK: Disco em $USAGE%" >> "$LOG_FILE"
fi
