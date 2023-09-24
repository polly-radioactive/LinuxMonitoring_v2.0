#!/bin/bash

function check_date {
    if [[ $1 =~ $yyyy_mm_dd_hh_mm ]] ; then
    day=$( echo $1 | cut -c 9 )$( echo $1 | cut -c 10 )
    mon=$( echo $1 | cut -c 6 )$( echo $1 | cut -c 7 )
    hour=$( echo $1 | cut -c 12 )$( echo $1 | cut -c 13 )
        if [[  "$day" == "00" || $day > 31 ]] ; then
        echo "Error: Incorrect day"
        exit 1
        fi
        if [[ "$mon" == "00" || $mon > 12 ]] ; then
        echo "Error: Incorrect month"
        exit 1
        fi
        if [[  $hour > 24 ]] ; then
        echo "Error: Incorrect hour"
        exit 1
        fi
    else
    echo "Incorrect input time"
    exit 1
    fi
}

function check_mask {
    if ! [[ $1 =~ $mask ]] ; then
    echo "Error: Incorrect mask"
    exit 1
    fi
}
