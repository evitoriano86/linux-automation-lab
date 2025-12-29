#!/bin/bash
# =========================================
# Master Automation Script
# =========================================

BASE_DIR="/home/linux-lab/labs/linux-automation-lab"
SCRIPTS_DIR="$BASE_DIR/scripts"
LOG_DIR="$BASE_DIR/logs"
LOG_FILE="$LOG_DIR/master.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

mkdir -p "$LOG_DIR"

echo "=========================================" >> "$LOG_FILE"
echo "$DATE - Iniciando execução do MASTER" >> "$LOG_FILE"

# -----------------------------
# Check Disk
# -----------------------------
if [ -x "$SCRIPTS_DIR/check_disk.sh" ]; then
    echo "$DATE - Executando check_disk.sh" >> "$LOG_FILE"
    "$SCRIPTS_DIR/check_disk.sh" >> "$LOG_FILE" 2>&1
else
    echo "$DATE - ERRO: check_disk.sh não encontrado ou sem permissão" >> "$LOG_FILE"
fi

echo "$DATE - Finalizando execução do MASTER" >> "$LOG_FILE"

