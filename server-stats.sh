#!/bin/bash

# Function to display a section header
print_section() {
    echo -e "\n===== $1 ====="
}

# Total CPU Usage
print_section "Total CPU Usage"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "CPU Usage: $cpu_usage"

# Total Memory Usage
print_section "Total Memory Usage"
memory_usage=$(free -m | awk 'NR==2{printf "Used: %s MB, Free: %s MB (%.2f%% used)", $3, $4, $3*100/$2 }')
echo "$memory_usage"

# Total Disk Usage
print_section "Total Disk Usage"
disk_usage=$(df -h --total | grep "total" | awk '{printf "Used: %s, Free: %s, Total: %s (%.2f%% used)", $3, $4, $2, $3*100/($3+$4) }')
echo "$disk_usage"

# Top 5 Processes by CPU Usage
print_section "Top 5 Processes by CPU Usage"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory Usage
print_section "Top 5 Processes by Memory Usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

# Stretch Goals
# OS Version
print_section "OS Version"
os_version=$(cat /etc/os-release | grep -w "PRETTY_NAME" | cut -d= -f2- | tr -d '"')
echo "OS Version: $os_version"

# Uptime
print_section "Uptime"
uptime_info=$(uptime -p)
echo "Uptime: $uptime_info"

# Load Average
print_section "Load Average"
load_average=$(uptime | awk -F 'load average: ' '{print $2}')
echo "Load Average: $load_average"

# Logged-in Users
print_section "Logged-in Users"
logged_in_users=$(who | wc -l)
echo "Number of logged-in users: $logged_in_users"

# Failed Login Attempts
print_section "Failed Login Attempts"
failed_logins=$(sudo grep "Failed password" /var/log/auth.log | wc -l)
echo "Failed login attempts: $failed_logins"

# End of script
echo -e "\n===== End of Stats ====="
