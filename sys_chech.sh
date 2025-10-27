#!/bin/bash


echo "System Info"

system_check(){
	name=$(hostnamectl | grep "Operating System" | cut -d":" -f2)
	up_time=$(uptime -p | cut -d" " -f2-)
	up_since=$(uptime -s)
	cpu_usage=$(top -bn1| grep "Cpu(s)" | awk '{print " " 100 - $8 "%"}')
	mem_usage=$(free -h | grep -E "Mem|total" | cut -d":" -f2)
	disk_usage=$( df -h | grep -E "/dev/sda2|Filesystem" | cut -d" " -f2-)
	cat << EOF
-------------------------
    YOUR SYSTEM INFO
You're using ${name}
Your PC has been up for ${up_time} since ${up_since}
Your PC memory info:
${mem_usage}
Your CPU usage is ${cpu_usage}

Your disk usage info:
${disk_usage}
--------------------------
EOF
}
system_check
