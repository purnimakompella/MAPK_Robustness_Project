rm(list=ls())
csv_file <- "/Users/kompella/Documents/PeisajovichLab/FACS/Mut 1-51 Round 1 mostlyCW/AllFCS/ExtractedStats_06182018.csv"
data_df <- read.csv(csv_file, header=T)

data_df <- data_df[order(data_df$Date, data_df$Sample, 
                         data_df$Condition, data_df$Time), ]

primary_colnames <- c("GFPmedian", "BFPmedian", "GFPmean",  "BFPmean",  "GFPcv", "BFPcv")
time_colnames <- seq(60, 360, 60)
condition_colnames <- c("Before", "NoPheromone", "NoSalt", "WithPheromone", "WithSalt")

transformed_colnames <- c()

for (pc in primary_colnames){
  for (cd in condition_colnames){
    if (cd == "Before") {
      transformed_colnames <- cbind(transformed_colnames, paste0(pc, "_", cd, "_", 0))
    }
    else {
      for (ti in time_colnames) {
        transformed_colnames <- cbind(transformed_colnames, paste0(pc, "_", cd, "_", ti))
      }
    }
  }
}

uni_sample_date <- unique(data_df[, c("Sample", "Date")])
row_names <- paste0(uni_sample_date$Sample, "_", uni_sample_date$Date)

transformed_df <- as.data.frame(matrix(0, 
                                       ncol=length(transformed_colnames), 
                                       nrow=length(row_names), 
                                       dimnames=list(row_names,
                                                     transformed_colnames)))

for (row in 1:nrow(data_df)){
  for (col in colnames(data_df)[2:9]){
    transformed_df[paste0(data_df[row, "Sample"], "_", data_df[row, "Date"]), 
                   paste0(col, "_", 
                          data_df[row, "Condition"], "_",
                          data_df[row, "Time"])] <- data_df[row, col]
  }
}

write.csv(transformed_df, file="TransformedData_06182018.csv", na="")

