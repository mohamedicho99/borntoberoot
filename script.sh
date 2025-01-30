#!/bin/bash

dumb=$(df -m --total | grep total | awk ' { print $3} ')
dsp=$(df -h --total | grep total | awk ' { print $2} ')
dup=$(df -h --total | grep total | awk ' { print $5} ')

wall "
Arch: $(uname -a)
CPU: $(cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l)
vCPU: $(nproc)
Memory Usage: $(free --mega | awk '/Mem:/ { printf("%d/%dMB (%.2f%%)", $3, $2, $3/$2*100) }')
Disk Usage: $dumb/$dsp ($dup)
Cpu load: $(top -bn1 | grep "%Cpu" | awk ' { gsub(",", " "); print 100-$8 } ')%
"
