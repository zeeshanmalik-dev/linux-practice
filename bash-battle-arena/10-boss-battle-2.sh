#!/bin/bash

mkdir -p Arena_Boss
cd Arena_Boss

for i in 1 2 3 4 5; do
    LINES=$((RANDOM % 11 + 10))
    > file$i.txt
    for ((j=1; j<=LINES; j++)); do
        echo "Line $j of file$i" >> file$i.txt
    done
done

echo "Victory" >> file3.txt

echo "--- Files sorted by size ---"
ls -la *.txt | sort -k5 -n

mkdir -p ../Victory_Archive

for f in *.txt; do
    if grep -q "Victory" "$f"; then
        mv "$f" ../Victory_Archive/
        echo "Moved $f to Victory_Archive (contains 'Victory')"
    fi
done
