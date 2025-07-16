#!/bin/bash

LOG_DIR="./system_logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/sysinfo_$(date +'%Y-%m-%d_%H-%M-%S').log"

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
BOLD=$(tput bold)
RESET=$(tput sgr0)

draw_bar() {
    local label=$1
    local value=$2
    local max=$3
    local length=30
    local filled=$((value * length / max))
    local bar=$(printf "%-${length}s" "" | tr ' ' '#')
    echo -e "${BOLD}${label}:${RESET} [${GREEN}${bar:0:$filled}${RESET}${bar:$filled}] ${YELLOW}${value}%${RESET}"
}

{
echo -e "${BOLD}${CYAN}===== SYSTEM INFO =====${RESET}"
echo -e "${BOLD}Hostname:${RESET} ${GREEN}$(hostname)${RESET}"
echo -e "${BOLD}OS:${RESET} ${YELLOW}$(uname -srm)${RESET}"
echo -e "${BOLD}Uptime:${RESET} ${YELLOW}$(uptime -p)${RESET}"
echo

echo -e "${BOLD}${CYAN}===== RESOURCE USAGE =====${RESET}"
echo -e "${BOLD}Memory Usage:${RESET}"
free -h | awk -v green="$GREEN" -v reset="$RESET" 'NR==2 {printf green "Used:" reset " %s / %s\n", $3, $2}'
echo

echo -e "${BOLD}Disk Usage:${RESET}"
df -h --output=source,pcent | grep '^/' | awk -v green="$GREEN" -v reset="$RESET" '{ printf green "%s" reset ": %s\n", $1, $2 }'
echo

echo -e "${BOLD}CPU Load:${RESET}"
cpu_load=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d',' -f1 | xargs)
cpu_percent=$(echo "$cpu_load * 100 / $(nproc)" | bc)
draw_bar "CPU Load" "$cpu_percent" 100
echo

echo -e "${BOLD}${CYAN}Top 5 Memory-Using Processes:${RESET}"
ps aux --sort=-%mem | head -n 6 | awk -v bold="$BOLD" -v reset="$RESET" -v green="$GREEN" '{ printf green $1 reset " " bold $11 reset "\n" }'
echo

echo -e "${BOLD}${CYAN}===== GPU INFO =====${RESET}"
if command -v nvidia-smi &> /dev/null; then
    echo -e "${BOLD}NVIDIA GPU:${RESET}"
    nvidia-smi --query-gpu=name,memory.total,memory.used,temperature.gpu --format=csv,noheader,nounits | \
    while IFS=',' read -r name mem_total mem_used temp; do
        echo -e "${GREEN}Name:${RESET} $name"
        echo -e "${GREEN}Memory:${RESET} $mem_used / $mem_total MB"
        echo -e "${GREEN}Temp:${RESET} $temp°C"
        mem_percent=$(echo "$mem_used * 100 / $mem_total" | bc)
        draw_bar "GPU Memory" "$mem_percent" 100
    done
else
    echo -e "${YELLOW}No NVIDIA GPU detected.${RESET}"
    lspci | grep -i 'vga\|3d\|2d'
fi
} | tee "$LOG_FILE"
