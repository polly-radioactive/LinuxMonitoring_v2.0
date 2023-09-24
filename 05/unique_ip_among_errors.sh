#!/bin/bash

function unique_ip_among_errors {
    for day in {1..5}; do
        awk -e '$9 ~ /^[45]..$/ {print $1}' "$path/day${day}_nginx.log" | sort -n | uniq
    done
}