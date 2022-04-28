#!/bin/bash

cat job1_*.csv | cut -d, -f3 | awk '{ printf("%d\n", $1) }' > latitude.txt
cat job1_*.csv | cut -d, -f4 | awk '{ printf("%d\n", $1) }' > longitude.txt
paste -d',' latitude.txt longitude.txt > location.txt
sort location.txt | uniq -c | sort -nr > countByLocations