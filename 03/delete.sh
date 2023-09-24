#!/bin/bash

function delete_by_log_file {
    file=../02/list.log
    folder_path="$(cat $file | awk -F ' ' '{print $1}')"
    for folder in $folder_path
    do
        if [[ $folder =~ $fold ]]; then
        rm -r $folder &> /dev/null
        fi
    done
}

function delete_by_date {
    for something in $(find / -maxdepth 3 -type d -newerct "$1" ! -newerct "$2" 2>/dev/null)
    do
        if [[ $something =~ $fold ]]; then
        rm -rf $something
        fi
    done
}

function delete_by_name_mask {
    name_mask_ma=$(echo $1 | cut -d "_" -f1 )
    dd_mm_yy_ma=$(echo $1 | cut -d "_" -f2 )
    reg_pat=$(echo "^[$name_mask_ma]+$")
    dd_mm_yyF=$(echo "*_$dd_mm_yy_ma")
    for smth in $(find / -type d -name $dd_mm_yyF 2>/dev/null)
    do
        smt=${smth##*/}
        sm=${smt%_*}
        if [[ $sm =~ $reg_pat ]]; then
        rm -rf $smth
        fi
    done
}