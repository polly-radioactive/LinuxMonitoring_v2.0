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
    random=$(($RANDOM%100))
    name=$1
    string=$2
    slash='/'
    line='_'
    dot='.'
    size=$(echo $3 | sed 's/.$//')
    while ! [ $count = $random ]
    do
        path=$(ls -d /* | grep -v bin | grep -v lost+found | grep -v root | grep -v proc | grep -v sys | grep -v swap.img | shuf -n1)
        give_name_folder $name $path$slash
        memory_check
        if ! [[ -d $path$slash$name$line$start ]] ; then
            mkdir $path$slash$name$line$start
            echo "$path$slash$name$line$start $( date +"%Y-%m-%d %H:%M:%S" )" | column -t >> list.log
        fi
        count_f=0
        random_f=$RANDOM 
        before="${string%%.*}"
        after="${string#*.}"
        while ! [ $count_f = $random_f ]
        do
            give_name_file $before $path$slash$name$line$start$slash
            memory_check
            if [[ -f $path$slash$name$line$start$slash$before$line$start$dot$after ]] ; then
            break
            fi
            $(head -c $size </dev/urandom>$path$slash$name$line$start$slash$before$line$start$dot$after)

            echo "$path$slash$name$line$start$slash$before$line$start$dot$after $( date +"%Y-%m-%d %H:%M:%S" )" $3| column -t >> list.log
            count_f=$(( count_f +1 ))
        done
        count=$(( count +1 ))
    done
}