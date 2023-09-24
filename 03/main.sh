#!/bin/bash

fold='[a-zA-Z]{1,}_[[:digit:]]{6}'
yyyy_mm_dd_hh_mm='^[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9] [0-2][0-9]:[0-5][0-9]$'
mask='^[a-zA-Z]{1,7}_[0-3][0-9][0-1][0-9]{3}$'

source ./check.sh
source ./delete.sh

function main {
    space=" "
    if [[ $1 = 1 ]]; then
        if [[ $# -eq 1 ]] ; then 
        delete_by_log_file 
        else
        echo "Error: Incorrect input"
        exit 1
        fi
    elif [[ $1 = 2 ]] ; then
        if [[ $# -eq 1 ]] ; then 
        echo "Enter the start date and time (format: YYYY-MM-DD HH:MM):"
        read -r begin
        check_date "$begin"
        echo "Enter the end date and time (format: YYYY-MM-DD HH:MM):"
        read -r end
        check_date "$end"
        delete_by_date "$begin" "$end"
        elif [[ $# -eq 5 ]] ; then
        begin=$2$space$3
        check_date "$begin"
        end=$4$space$5
        check_date "$end"
        delete_by_date "$begin" "$end"
        else
        echo "Error: Incorrect input"
        exit 1
        fi
    elif [[ $1 = 3 ]] ; then
        if [[ $# -eq 1 ]] ; then 
        echo "Enter the name mask (format: characters_date, e.g. aaazz_110823):"
        read -r name_mask
        check_mask $name_mask
        delete_by_name_mask $name_mask
        elif [[ $# -eq 2 ]] ; then
        check_mask $name_mask
        delete_by_name_mask $3
        else
        echo "Error: Incorrect input"
        exit 1
        fi
    else
    echo "Error: Incorrect input"
    exit 1
    fi  
}

main $@