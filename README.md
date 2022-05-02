# STAT479_Final_Project

Oliver Chen ychen939
Steven Yang yang558
Sirui Chu schu46
Weiyu Xu wxu232

git clone git@github.com:stevenYang914/STAT479_Final_Project.git

## Install R and related packages
condor_submit -i interactive.sub

## Download data and split it into 50 .csv (i.e., data.csv.00)
./getData.sh

## Job1: Clean and filter the 50 .csv, output job1_*.csv
condor_submit project_job1.sub

## Question1: What locations have the most number of earthquakes from 1984-2018?
./project_q1.sh
cat top10Locations
