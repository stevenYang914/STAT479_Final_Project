#!/bin/bash

cat job1_*.csv | cut -d, -f3,4,5,6,7 | awk -F, '{ if (($1 > 42.073051 && $1 < 48.073051) && ($2 > -94.401230 && $2 < -84.401230)) {print $0} }' > wisconsin.csv