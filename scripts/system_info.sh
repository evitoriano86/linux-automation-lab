#!/bin/bash

echo "===== SYSTEM INFO ====="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "Uptime:"
uptime
echo
echo "Disk usage:"
df -h /
echo
echo "Memory usage:"
free -h
echo "======================="

