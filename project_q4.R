rm(list=ls())

data <- read.csv('./wisconsin.csv', header=FALSE)
data <- na.omit(data)
colnames(data) <- c('source_latitude','source_longitude', 'source_depth_km', 
'source_distance_km', 'source_magnitude')

# Madison latitude: 43.073051, Madison longitude: -89.401230
# Latitude upper bound: +5
# Latitude lower bound: -1
# Longitude upper bound: +5
# Longitude lower bound: +5

mlr_dist <- lm(source_distance_km ~ source_latitude + source_longitude, data=data)
mlr_mag <- lm(source_magnitude ~ source_latitude + source_longitude, data=data)

sink('distance_mlr.txt')
print(summary(mlr_dist))
sink()

sink('magnitude_mlr.txt')
print(summary(mlr_mag))
sink()