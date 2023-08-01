#!/bin/bash

limit='1'
dir=''

if (( $# > 2 )); then
    echo "Too many arguments"
    exit 1
elif (( $# == 0 )); then
    echo "You must at least specify a directory for traversing"
    exit 2
else
    for arg in $@; do
        if [ "$arg" = '-a' ]; then
            limit='-0'
        elif [ -d $arg ]; then
            dir=$arg
        else
            echo "$arg is not a directory"
            exit 3
        fi
    done
    if [ "$dir" = '' ]; then
        echo "You must specify a directory for traversing"
        exit 2
    fi
fi

head -n $limit <(sort -t'\0' -k2 -r <(find $dir -type f -printf "%p\0%C@\0%c\n") | awk -F '\0' '{print $1 "\t" $3}')

