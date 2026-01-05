#!/bin/bash

# Backup automatizado com log

SOURCE_DIR="$HOME"
PROJECT_DIR="$HOME/labs/linux-automation-lab"
BACKUP_DIR="$PROJECT_DIR/backups"
LOG_FILE="$PROJECT_DIR/logs/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

echo "[$(date)] Iniciando backup de $SOURCE_DIR" >> "$LOG_FILE"

tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>> "$LOG_FILE"

if [ $? -eq 0 ]; then
    echo "[$(date)] Backup concluído com sucesso: $BACKUP_FILE" >> "$LOG_FILE"
else
    echo "[$(date)] ERRO ao executar backup" >> "$LOG_FILE"
fi





























