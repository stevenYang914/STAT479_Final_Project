rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if (length(args) == 1) {
    data_num = args[1]
} else {
    cat('usage: Rscript project_q3.R <data number>\n', file=stderr())
    stop()
}

dataFile <- paste('job1_', data_num, sep='')
dataFile <- paste(dataFile, '.csv', sep='')
data <- read.csv(dataFile, header=FALSE)
data <- na.omit(data)
colnames(data) <- c('source_origin_time','source_latitude','source_longitude',
    'source_depth_km','source_magnitude','source_distance_km')
depth_avg <- mean(data$source_depth_km)
dist_avg <- mean(data$source_distance_km)
depth_filename <- paste('job2_depth_', data_num, sep='')
depth_filename <- paste(depth_filename, '.txt', sep='')
dist_filename <- paste('job2_dist_', data_num, sep='')
dist_filename <- paste(dist_filename, '.txt', sep='')
write.table(depth_avg, depth_filename)
write.table(dist_avg, dist_filename)