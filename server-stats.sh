#!/bin/bash

total_cpu_usage="CPU usage: $(top -bn1 | grep "%Cpu(s)" | awk -F ',' '{print 100-$4}') %"
mem_total=$(top -bn1 | grep "MiB Mem" | awk -F '[ ,]'+ '{print $4}')
mem_free=$(top -bn1 | grep "MiB Mem" | awk -F '[ ,]'+ '{print $6}')
mem_usage="RAM usage: $(echo "$mem_total - $mem_free" | bc) MB"
mem_percentage="$(echo "scale=2; 100-($mem_free / $mem_total)*100"|bc) %"
disk_usage="Disk usage: $(df -h / | awk 'NR==2 {print $3 " | " $5}')"
top_mem_proc=$(ps -eo pid,comm,%mem --sort=-%mem | head -n 6)
top_cpu_proc=$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6)

echo $total_cpu_usage
echo "$mem_usage | $mem_percentage"
echo $disk_usage
echo $top_mem_process
echo -e "$top_mem_proc\n"
echo -e "$top_cpu_proc\n"
