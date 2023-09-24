#!/bin/bash
source ./info.sh

path=$PWD
for day in {1..5}; do
    number_of_records=$(( $RANDOM % 900 + 100 ))
    for ((records=0; records<$number_of_records; records++)); do
	    h=$( ip_info )
	    l=$(echo "-")
	    u=$( user_name )
	    t="$(date -d "today - $((5 - ${day})) days" "+%d/%b/%Y:%H:%M:%S %z")"
	    r=$( method_info )
	    s=$( status_info )
	    b=$()
	    Referer=$(url_info)
	    User_agent=$(agent_info)
        echo "$h $l $u [$t] \"$r\" $s $b \"$Referer\" \"$User_agent\"" >> "$path/day${day}_nginx.log" 
    done
done
