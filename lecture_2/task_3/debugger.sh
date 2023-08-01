#!/bin/bash

outputDir=/tmp/missing_debug
out=$outputDir/std_out
err=$outputDir/std_err

if [ ! -d "$outputDir" ] ; then
    mkdir $outputDir
else
    rm -f $out
    rm -f $err
fi

successCount=0
while :
do
    $1 1>> $out 2>> $err 
    status=$?
    if [ $status = 0 ] ; then
        successCount=$((successCount + 1)) 
    else
        echo "The command managed to run successfully $successCount times before finally failed."
        echo
        echo "Standard output:"
        cat $out
        echo 
        echo "Standard error:"
        cat $err
        exit 0
    fi
done

