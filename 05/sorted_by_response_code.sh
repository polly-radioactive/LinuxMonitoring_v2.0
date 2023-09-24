#!/bin/bash

function sorted_by_response_code {
    for day in {1..5}; do
        awk '{print}' "$path/day${day}_nginx.log" | sort -k 9
    done
}