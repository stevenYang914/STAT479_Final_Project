#!/bin/bash

numOfFiles=$(ls job2_depth_*.txt | wc -l)
sum=$(cat job2_depth_*txt | awk '{sum= sum+$1} END {print sum}')

echo "$sum / $numOfFiles" | bc -l