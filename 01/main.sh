#!/bin/bash
start=$(date +%d%m%y)
source ./check.sh
source ./creator.sh

number='^[0-9]+$'
name_fo='^[a-zA-Z]{1,7}$'
name_fi='^[a-zA-Z]{1,7}[.][a-z]{1,3}$'
size='^[0-9]{1,2}kb$'

export path=$1
export number_subfolders=$2
export folder_names=$3
export number_files=$4
export files_names=$5
export file_size=$6

check_input
check_path $path
check_number $number_subfolders
check_names_folder $folder_names
check_number $number_files
check_names_files $files_names
check_size $file_size
creator_folder $path $number_subfolders $folder_names $number_files $files_names $file_size
