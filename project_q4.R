rm(list=ls())

data <- read.csv('./wisconsin.csv', header=FALSE)
data <- na.omit(data)
# colnames(data) <- c('source_origin_time','source_latitude','source_longitude',
    # 'source_depth_km','source_magnitude','source_distance_km')
colnames(data) <- c('source_latitude','source_longitude', 'source_depth_km',
    'source_magnitude','source_distance_km')

# MADISON_LAT <- 43.073051
# MADISON_LONG <- -89.401230
# LAT_UPPER <- MADISON_LAT + 5
# LAT_LOWER <- MADISON_LAT - 1
# LONG_UPPER <- MADISON_LONG + 5
# LONG_LOWER <- MADISON_LONG - 5

# madison_data <- data[data$source_latitude > LAT_LOWER && data$source_latitude < LAT_UPPER
#     && data$source_longitude > LONG_LOWER && data$source_longitude < LONG_UPPER, ]

# mlr_dist <- lm(source_distance_km ~ source_latitude + source_longitude, data=madison_data)
# mlr_depth <- lm(source_depth_km ~ source_latitude + source_longitude, data=madison_data)

mlr_dist <- lm(source_distance_km ~ source_latitude + source_longitude, data=data)
mlr_mag <- lm(source_magnitude ~ source_latitude + source_longitude, data=data)

sink('distance_mlr.txt')
print(summary(mlr_dist))
# write(coef(mlr_dist), 'distance_mlr.txt')
sink()

sink('magnitude_mlr.txt')
print(summary(mlr_mag))
# write(coef(mlr_mag), 'magnitude_mlr.txt')
sink()