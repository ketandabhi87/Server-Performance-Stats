#!/bin/bash
# ============================================================
# server-stats.sh — Basic Linux Server Performance Analyzer
# ============================================================

# Ensure script is run with bash
[ -z "$BASH_VERSION" ] && { echo "Please run this script using bash."; exit 1; }

echo "============================================================"
echo "        SERVER PERFORMANCE STATISTICS ($(hostname))"
echo "============================================================"
echo

# ---------- Stretch Goal: System Information ----------
echo "🔹 System Information"
echo "------------------------------------------------------------"
echo "Hostname        : $(hostname)"
echo "OS Version      : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d \")"
echo "Kernel Version  : $(uname -r)"
echo "Uptime          : $(uptime -p)"
echo "Load Average    : $(uptime | awk -F'load average:' '{ print $2 }' | xargs)"
echo "Logged in Users : $(who | wc -l)"
echo

# ---------- CPU Usage ----------
echo "🔹 CPU Usage"
echo "------------------------------------------------------------"
# Extract CPU idle percentage and calculate used
CPU_IDLE=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
CPU_USAGE=$(echo "scale=2; 100 - $CPU_IDLE" | bc)
echo "Total CPU Usage : $CPU_USAGE%"
echo

# ---------- Memory Usage ----------
echo "🔹 Memory Usage"
echo "------------------------------------------------------------"
MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/Mem:/ {print $4}')
MEM_PERC=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')
echo "Total Memory : ${MEM_TOTAL} MB"
echo "Used Memory  : ${MEM_USED} MB"
echo "Free Memory  : ${MEM_FREE} MB"
echo "Usage Percent: ${MEM_PERC}%"
echo

# ---------- Disk Usage ----------
echo "🔹 Disk Usage"
echo "------------------------------------------------------------"
df -h --total | grep -E 'Filesystem|total'
echo

# ---------- Top 5 Processes by CPU ----------
echo "🔹 Top 5 Processes by CPU Usage"
echo "------------------------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

# ---------- Top 5 Processes by Memory ----------
echo "🔹 Top 5 Processes by Memory Usage"
echo "------------------------------------------------------------"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo

# ---------- Stretch Goal: Security & Logs ----------
echo "🔹 Security and Login Info"
echo "------------------------------------------------------------"
echo "Failed login attempts (last 10):"
if command -v journalctl &>/dev/null; then
    journalctl -u ssh --no-pager -n 10 2>/dev/null | grep "Failed password" || echo "No recent failed attempts found."
else
    lastb 2>/dev/null | head -n 10 || echo "No 'lastb' command found."
fi
echo

echo "============================================================"
echo "Report generated on: $(date)"
echo "============================================================"
