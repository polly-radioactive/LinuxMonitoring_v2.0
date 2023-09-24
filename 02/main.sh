#!/bin/bash
start=$(date +%d%m%y)
fist=$(date +%s%N)
source ./check.sh
source ./creator.sh

name_fo='^[a-zA-Z]{1,7}$'
name_fi='^[a-zA-Z]{1,7}[.][a-z]{1,3}$'
size='^[0-9]{1,2}Mb$'

export folder_names=$1
export files_names=$2
export file_size=$3

check_input
check_names_folder $folder_names
check_names_files $files_names
check_size $file_size
creator_folder $folder_names $files_names $file_size
finish=$(date +%d.%m.%y_%H:%M:%S)
last=$(date +%s%N)
dif=$(( ($last - $fist)/1000000000 ))
echo "Finish time: $finish"
echo "Script execution time (in seconds) = $dif"