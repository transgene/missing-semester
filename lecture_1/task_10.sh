/tmp/missing/semester | grep -i 'last-modified:*' | awk -F ': ' '{print $2}' > ~/last-modified.txt
cat ~/last-modified.txt
