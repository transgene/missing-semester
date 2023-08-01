#!/bin/bash

touchFile() {
    touch source_dir/$1/`xxd -l 4 -c 4 -p < /dev/random`.$2
}

mkdir -p source_dir/{a..c}/{1,2}
for dir in {a..c}; do
    for inner in {1..2}; do
        touchFile "$dir/$inner" "html"
        touchFile "$dir/$inner" "not_html"
    done
    touchFile "$dir" "html"
    touchFile "$dir" "txt"
done

