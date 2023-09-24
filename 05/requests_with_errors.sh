#!/bin/bash

function requests_with_errors {
    for day in {1..5}; do
        awk -e '$9 ~ /^[45]..$/ {print}' "$path/day${day}_nginx.log"
    done
}