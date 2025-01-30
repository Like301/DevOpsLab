#!/bin/sh  

echo "Starting server analysis"
echo "========================================="
mpstat | awk '$12 ~ /[0-9.]+/{print "Total Cpu usage: "100-$12"%"}'
free -m | awk 'NR==2 {printf "Memory Usage: %sMb/%sMb (%.2f%)\n",$3, $2, $3*100/$2}'
df --total -h | awk 'END{printf "Disk usage: %s/%s (%s)\n", $3,$2,$5}'
echo "-----------------------------------------"
echo "Top 5 process by CPU usage:"
ps aux --sort -%cpu| head -6
echo "-----------------------------------------"
echo "Top 5 process by memory usage:"
ps aux --sort -%mem| head -6
echo "========================================="

