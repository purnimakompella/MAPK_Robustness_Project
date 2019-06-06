parent.dir <- "/Users/kompella/Documents/PeisajovichLab/FACS/ExtractedStatsTCfromFCS"
setwd(parent.dir)
files <- list.files()
#subfiles <- files[grep("PK2017", files)] #grep is problematic, use with caution; grep gives you the index, indexing files from grep is what gives the data
read_subfiles <- lapply(files, read.csv)
merged_subfiles <- do.call(rbind, read_subfiles)
write.table(merged_subfiles, file="mergedfiles.csv", sep=",")