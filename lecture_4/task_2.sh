#!/usr/bin/env bash

awk "! /'s$/ && /(.*a.*){3,}/ {IGNORECASE=1; print $1}" /usr/share/dict/words |
tr "[:upper:]" "[:lower:]" |
tee >(awk "{nlines++} END {print nlines}" - > lines_count.txt) \
    1> \
    >(sed -E 's/(.*)(.{2}$)/\2/' | sort | uniq -c | sort -nr | 
    tee >(head -n3 > top_combinations.txt) \
        1> \
        >(wc -l > all_combinations_count.txt))
