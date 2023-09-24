#!/bin/bash

function check_input {
    if ! [[ $# -ne 6 ]]; then
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

function check_number {
    if ! [[ $1 =~  $number ]] || [[ $1 == 0 ]] ; then
    echo "Error: Parameter is not number or it is zero"
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
    if ! [[ $1 =~ $size ]] || [[ $1 =~ '0kb' ]] ; then
    echo "Error: File size (in kilobytes, but not more than 100)"
    exit 1
    fi
}

function memory_check {
    memory=$(df / | grep /$ | awk '{print $4}' )
    if  [[ $memory -lt 1048576 ]] ; then
    echo "Error: memory over"
    exit 1
    fi
}