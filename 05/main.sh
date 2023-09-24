#!/bin/bash

path=$PWD/../04

source ./sorted_by_response_code.sh
source ./unique_ip.sh
source ./requests_with_errors.sh
source ./unique_ip_among_errors.sh

function main {
    if [[ $# -eq 1 ]] ; then
        if [[ $1 = 1 ]] ; then
            sorted_by_response_code >> list_1.log
        elif [[ $1 = 2 ]] ; then
            unique_ip >> list_2.log
        elif [[ $1 = 3 ]] ; then
            requests_with_errors >> list_3.log
        elif [[ $1 = 4 ]] ; then
            unique_ip_among_errors >> list_4.log
        fi
    else
        echo "Error: Incorrect input"
    fi
}
main $@