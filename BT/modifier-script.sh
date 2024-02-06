#!/usr/bin/env sh
for i in $(seq 1 100); do
    echo "Counting from $i to 100" >>/data/index.html
    sleep 30
done
