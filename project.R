rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if (length(args) == 1) {
    data_num = args[1]
} else {
    cat('usage: Rscript myscript.R <data number>\n', file=stderr())
    stop()
}

max_int <- as.integer(.Machine$integer.max)

dataFile <- paste('data.csv.', data_num, sep='')
data <- read.csv(dataFile, header=FALSE)
colnames(data) <- c(
    'network_code','receiver_code','receiver_type',
    'receiver_latitude','receiver_longitude','receiver_elevation_m',
    'p_arrival_sample','p_status','p_weight','p_travel_sec',
    's_arrival_sample','s_status','s_weight','source_id',
    'source_origin_time','source_origin_uncertainty_sec',
    'source_latitude','source_longitude','source_error_sec',
    'source_gap_deg','source_horizontal_uncertainty_km',
    'source_depth_km','source_depth_uncertainty_km',
    'source_magnitude','source_magnitude_type','source_magnitude_author',
    'source_mechanism_strike_dip_rake','source_distance_deg',
    'source_distance_km','back_azimuth_deg','snr_db','coda_end_sample',
    'trace_start_time','trace_category','trace_name'
)
data <- na.omit(data)
var <- c('source_origin_time', 'source_latitude', 
         'source_longitude', 'source_depth_km', 
         'source_distance_km','source_magnitude')
df <- data[, var]
df <- df[!(df$source_origin_time == "" | df$source_latitude == "" | 
        df$source_longitude == "" | df$source_depth_km == "" |
        df$source_distance_km == "" | df$source_magnitude == ""), ]

# df <- data[, c(14, 16, 17, 21, 23, 28)]
# colnames(df) <- c('source_origin_time','source_latitude','source_longitude',
#     'source_depth_km','source_magnitude','source_distance_km')

dfSorted <- df[order(df$source_magnitude), ]
write_filename <- paste('job1_', data_num, sep='')
write_filename <- paste(write_filename, '.csv', sep='')
write.table(dfSorted, write_filename, sep=',', col.names=FALSE)