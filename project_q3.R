rm(list=ls())

# Name the input argument data_num.
args = (commandArgs(trailingOnly=TRUE))
if (length(args) == 1) {
    data_num = args[1]
} else {
    cat('usage: Rscript project_q3.R <data number>\n', file=stderr())
    stop()
}

# Read corresponding csv file and assign column names.
dataFile <- paste('job1_', data_num, sep='')
dataFile <- paste(dataFile, '.csv', sep='')
data <- read.csv(dataFile, header=FALSE)
data <- na.omit(data)
colnames(data) <- c('source_origin_time','source_latitude','source_longitude',
    'source_depth_km','source_magnitude','source_distance_km')

# Compute mean value of source_depth and source_distance. There are still NA values, so we write the txt file only when it is not NA.
depth_avg <- mean(data$source_depth_km)
dist_avg <- mean(data$source_distance_km)
if (depth_avg != 'NA' && depth_avg != '') {
    depth_filename <- paste('job2_depth_', data_num, sep='')
    depth_filename <- paste(depth_filename, '.txt', sep='')
    write(depth_avg, depth_filename)
}
if (dist_avg != 'NA' && dist_avg != '') {
    dist_filename <- paste('job2_dist_', data_num, sep='')
    dist_filename <- paste(dist_filename, '.txt', sep='')
    write(dist_avg, dist_filename)
}
