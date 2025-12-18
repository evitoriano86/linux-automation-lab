#!/bin/bash

# ===============================
# Monitoramento de serviços
# ===============================

SERVICES=("ssh" "cron")

LOG_FILE="$HOME/labs/linux-automation-lab/logs/services.log"
DATE=$(date)

for SERVICE in "${SERVICES[@]}"; do
    systemctl is-active --quiet "$SERVICE"

    if [ $? -eq 0 ]; then
        echo "[$DATE] Serviço $SERVICE está ATIVO" >> "$LOG_FILE"
    else
        echo "[$DATE] Serviço $SERVICE está INATIVO" >> "$LOG_FILE"
    fi
done

