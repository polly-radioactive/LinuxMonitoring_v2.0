#!/bin/bash

function check_input {
    if ! [[ $# -ne 3 ]]; then
    echo "Error: Incorrect input"
    exit 1
    fi
}

function check_path {
    if ! [[ -d $1 ]] ; then
    echo "Error: Incorrect path"
    exit 1
    fi
}

function check_names_folder {
    if ! [[ $1 =~ $name_fo ]] ; then
    echo "Error: English alphabet letters should be used in folder names (no more than 7 characters)"
    exit 1
    fi
}

function check_names_files {
    if ! [[ $1 =~ $name_fi ]] ; then
    echo "Error:English alphabet letters should be used in folder names (no more than 7 characters for the name, no more than 3 characters for the extension)"
    exit 1
    fi
}

function check_size {
    if ! [[ $1 =~ $size ]] || [[ $1 =~ '0Mb' ]] ; then
    echo "Error: File size (in Megabytes, but not more than 100)"
    exit 1
    fi
}

function memory_check {
    memory=$(df / | grep /$ | awk '{print $4}' )
    if  [[ $memory -lt 1048576 ]] ; then
    echo "Error: memory over"
    finish=$(date +%d.%m.%y_%H:%M:%S)
    last=$(date +%s%N)
    dif=$(( ($last - $fist)/1000000000 ))
    echo "Finish time: $finish"
    echo "Script execution time (in seconds) = $dif"
    exit 1
    fi
}