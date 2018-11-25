#!/bin/bash
function rm_cmd() {
	file_name=$1
	echo 
    echo "---------${file_name}---------"
    cat $file_name 
    echo '----------------------------------'
    echo
    rm -i $file_name 
    return 0
}

rm_cmd $1