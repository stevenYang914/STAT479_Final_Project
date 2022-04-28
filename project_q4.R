rm(list=ls())

data <- read.csv('./merge.csv', header=FALSE)
data <- na.omit(data)
colnames(data) <- c('source_origin_time','source_latitude','source_longitude',
    'source_depth_km','source_magnitude','source_distance_km')

mlr_dist <- lm(source_distance_km ~ source_latitude + source_longitude, data=data)
mlr_depth <- lm(source_depth_km ~ source_latitude + source_longitude, data=data)

write(summary(mlr_dist), 'distance_mlr.txt')
write(summary(mlr_depth), 'depth.txt')