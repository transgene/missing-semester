#!/bin/bash

dir=$1
if [ "$dir" = '' ] ; then
    echo 'You must supply directory with scripts'
    exit 400
fi

if [ ! -d "$dir" ] ; then
    echo "'$dir' is not a directory"
    exit 404
fi

scripts=`ls -v $dir`
echo "Found $(wc -w <<< $scripts) scripts to run"
echo

cd $dir
echo "Moved to $dir to run the scripts"

for script in $scripts ; do
    echo "Running $script:"
    cat $script
    echo
    echo "Results of $script:"
    sh $script
    echo
    read -p "Press Enter to continue"
done

cd
echo
echo "Execution finished"

