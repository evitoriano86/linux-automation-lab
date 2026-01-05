#!/bin/bash

CPU_LIMIT=80
MEM_LIMIT=80
LOAD_LIMIT=2

LOG_FILE="$HOME/labs/linux-automation-lab/logs/resource_alert.log"
HOST=$(hostname)
DATE=$(date "+%Y-%m-%d %H:%M:%S")

ALERT=false
MESSAGE=""

# ===== CPU =====
read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
TOTAL1=$((user + nice + system + idle + iowait + irq + softirq + steal))
IDLE1=$idle

sleep 1

read cpu user nice system idle iowait irq softirq steal guest guest_nice < /proc/stat
TOTAL2=$((user + nice + system + idle + iowait + irq + softirq + steal))
IDLE2=$idle

CPU_TOTAL=$((TOTAL2 - TOTAL1))
CPU_IDLE=$((IDLE2 - IDLE1))

if [ "$CPU_TOTAL" -gt 0 ]; then
  CPU_USAGE=$(( 100 * (CPU_TOTAL - CPU_IDLE) / CPU_TOTAL ))
else
  CPU_USAGE=0
fi

if [ "$CPU_USAGE" -ge "$CPU_LIMIT" ]; then
  ALERT=true
  MESSAGE+="CPU alto: ${CPU_USAGE}%\n"
fi

# ===== MEMÓRIA =====
MEM_USAGE=$(free -m | awk '/Mem:/ {print int($3*100/$2)}')

if [[ "$MEM_USAGE" =~ ^[0-9]+$ ]] && [ "$MEM_USAGE" -ge "$MEM_LIMIT" ]; then
  ALERT=true
  MESSAGE+="Memória alta: ${MEM_USAGE}%\n"
fi

# ===== LOAD =====
LOAD=$(awk '{print int($1)}' /proc/loadavg)

if [ "$LOAD" -ge "$LOAD_LIMIT" ]; then
  ALERT=true
  MESSAGE+="Load alto: ${LOAD}\n"
fi

# ===== LOG =====
mkdir -p "$(dirname "$LOG_FILE")"

if [ "$ALERT" = true ]; then
  echo -e "$DATE - ALERTA em $HOST\n$MESSAGE" >> "$LOG_FILE"
else
  echo "$DATE - OK: CPU/Memória/Load normais" >> "$LOG_FILE"
fi

exit 0

