#!/bin/bash

dumb=$(df -m --total | grep total | awk ' { print $3} ')
dsp=$(df -h --total | grep total | awk ' { printf("%dGb", $2)} ')
dup=$(df -h --total | grep total | awk ' { print $5} ')

wall "#Architecture: $(uname -a)
#CPU physical: $(cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l)
#vCPU: $(nproc)
#Memory Usage: $(free --mega | awk '/Mem:/ { printf("%d/%dMB (%.2f%%)", $3, $2, $3/$2*100) }')
#Disk Usage: $dumb/$dsp ($dup)
#Cpu load: $(mpstat | grep all | awk ' { print 100-$13 } ')%
#Last boot: $(who -b | awk ' { print $3" "$4 } ') 
#LVM use: $(lsblk | grep -q lvm && echo "yes" || echo "no")
#Connections TCP: $(ss -t -a | grep ESTAB | sort -u | wc -l) ESTABLISHED
#User Log: $(users | wc -w)
#Network IP: $(hostname -I) ($(ip link | grep ether | awk ' { print $2 }'))
#Sudo: $(journalctl -q _COMM=sudo | grep COMMAND | wc -l) cmd
"
