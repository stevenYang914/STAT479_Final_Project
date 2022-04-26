                                        # Oliver Chen,
                                        # ychen939@wisc.edu

rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if (length(args) == 1) {
    data_num = args[1]
} else {
    cat('usage: Rscript myscript.R <template spectrum> <data directory>\n', file=stderr())
    stop()
}

max_int <- as.integer(.Machine$integer.max)

dataFile <- paste('data.csv.', data_num, sep='')
data <- read.csv(dataFile, header=FALSE)
df <- data[, c(14, 16, 17, 21, 23, 28)]
colnames(df) <- c('source_origin_time','source_latitude','source_longitude',
    'source_depth_km','source_magnitude','source_distance_km')

dfSorted <- df[order(df$source_magnitude), ]
write_filename <- paste(data_num, '.csv', sep='')
write.table(dfSorted, write_filename, sep=',', col.names=FALSE)