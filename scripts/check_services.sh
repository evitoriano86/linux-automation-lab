#!/bin/bash

# ===============================
# Monitoramento de serviços (parametrizável)
# Uso: ./check_services.sh ssh cron docker
# ===============================

LOG_FILE="$HOME/labs/linux-automation-lab/logs/services.log"
DATE=$(date)

if [ $# -eq 0 ]; then
    echo "Uso: $0 <serviço1> <serviço2> ..." 
    exit 1
fi

for SERVICE in "$@"; do
    systemctl is-active --quiet "$SERVICE"

    if [ $? -eq 0 ]; then
        echo "[$DATE] Serviço $SERVICE está ATIVO" >> "$LOG_FILE"
    else
         echo "[$DATE] ALERTA: Serviço $SERVICE está INATIVO" >> "$LOG_FILE"
         echo "ALERTA: Serviço $SERVICE está INATIVO"
    fi
done



