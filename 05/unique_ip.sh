#!/bin/bash

function unique_ip {
    for day in {1..5}; do
        awk '{print $1}' "$path/day${day}_nginx.log" | sort -n | uniq
    done
}