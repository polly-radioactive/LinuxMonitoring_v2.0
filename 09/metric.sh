#!/bin/bash

function cpu_usage {
    local cpu1=$(cat /proc/loadavg| awk '{print $1}')
    echo "#HELP mmetrics_cpu_1 CPU 1s "
    echo "#TYPE mmetrics_cpu_1 gauge"
    echo "mmetrics_cpu_1 $cpu1"
    local cpu5=$(cat /proc/loadavg | awk '{print $2}')
    echo "#HELP mmetrics_cpu_5 CPU 5s "
    echo "#TYPE mmetrics_cpu_5 gauge"
    echo "mmetrics_cpu_5 $cpu5"
    local cpu15=$(cat /proc/loadavg | awk '{print $3}')
    echo "#HELP mmetrics_cpu_15 CPU 15s "
    echo "#TYPE mmetrics_cpu_15 gauge"
    echo "mmetrics_cpu_15 $cpu15"
}

function total_ram {
    local totalram=$(cat /proc/meminfo | grep -i 'memtotal' | grep -o '[[:digit:]]*')
    echo "#HELP mmetrics_total_ram RAM "
    echo "#TYPE mmetrics_total_ram gauge"
    echo "mmetrics_total_ram $totalram"
}

function disk_usage {
    local diskfree=$( df / | tail -n 1 | awk '{print $4}' )
    echo "#HELP mmetrics_disk_free Disk Free Space "
    echo "#TYPE mmetrics_disk_free gauge"
    echo "mmetrics_disk_free $diskfree"
}

function html_creator {
    local path=$(echo "index.html")
    echo "$(cpu_usage)" >> $path
    echo "$(total_ram)" >> $path
    echo "$(disk_usage)" >> $path
    local file=$(echo "/var/www/metrics/index.html")
    if [[ -e $file ]]; then
        rm $file
    fi
    mv $path $file
}