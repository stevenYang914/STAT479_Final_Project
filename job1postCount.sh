#!/bin/bash

#cat job1_*.csv | cut -d, -f3 | awk '{ printf("%d\n", $1) }' > latitude.txt
#cat job1_*.csv | cut -d, -f4 | awk '{ printf("%d\n", $1) }' > longitude.txt
#paste -d',' latitude.txt longitude.txt | sort | uniq -c | sort -nr | tail -n +2 | head -10 > top10Locations

cat job1_*.csv | cut -d, -f3,4 | sort | uniq -c | sort -nr | head -10 > top10Locations