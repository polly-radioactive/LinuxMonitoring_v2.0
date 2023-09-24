#!/bin/bash

function give_name_folder {
    last=$(echo $1 | rev | cut -c1 )
    name=$1
    path_j=$2
    b=${#name}
    b_2=${#path_j}
    b_3=$(($b+$b_2))
    if [[ $b -lt 4 ]] ; then
    while [[ $b -le 4 ]]
    do
    name=$name$last
    b=${#name}
    done
    elif [[ $b_3 -le 248 ]] ; then
    name=$name$last
    fi
}

function give_name_file {
    last_f=$(echo $1 | rev | cut -c1)
    before=$1
    path_dir=$2
    c=${#before}
    c_2=${#path_dir}
    c_3=$(($c+$c_2))
    if [[ $c -lt 4 ]] ; then
    while [[ $c -le 4 ]]
    do
    before=$before$last_f
    c=${#before}
    done
    elif [[ $c_3 -le 248 ]] ; then
    before=$before$last_f
    fi
}


function creator_folder {
    count=0
    name=$3
    string=$5
    slash='/'
    line='_'
    dot='.'
    size=$(echo $6 | sed 's/.$//')
    while ! [ $count = $2 ]
    do
        give_name_folder $name $path$slash
        memory_check
        mkdir $1$slash$name$line$start
        echo "$1$slash$name$line$start $( date +"%Y-%m-%d %H:%M:%S" )" | column -t >> list.log
        count_f=0 
        before="${string%%.*}"
        after="${string#*.}"
        while ! [ $count_f = $4 ]
        do
            give_name_file $before $path$slash$name$line$start$slash
            memory_check
            $(head -c $size </dev/urandom>$1$slash$name$line$start$slash$before$line$start$dot$after)
            echo "$1$slash$name$line$start$slash$before$line$start$dot$after $( date +"%Y-%m-%d %H:%M:%S" )" $6| column -t >> list.log
            count_f=$(( count_f +1 ))
        done
        count=$(( count +1 ))
    done
}