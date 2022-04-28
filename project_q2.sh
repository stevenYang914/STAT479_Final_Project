#!/bin/bash

cat job1_*.csv | cut -d, -f2 | cut -d' ' -f2 | cut -d. -f1 | cut -d: -f1,2 | sort | uniq -c | sort -nr | head -10 > top10Time