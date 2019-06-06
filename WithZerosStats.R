#Clear memory
rm(list=ls())
options(warn=-1)


parent.dir <- "/Users/kompella/Documents/R/Data/TC1-6 scale csv/Non-Normalized/Renamed"
setwd(parent.dir)

filenames <- list.files(".", pattern=".csv", recursive = TRUE, include.dirs = TRUE)

filename <- "";
GFPmedianwith0 <- NULL;
BFPmedianwith0 <- NULL;
FSCmedianwith0 <- NULL;
GFPmeanwith0 <- NULL;
BFPmeanwith0 <- NULL;
FSCmeanwith0 <- NULL;
# files <- list.files()
# subfiles <- files[grep("PK2017", files)]
# cormeanGFP<-NULL;
# uncormeanGFP<-NULL;
# cormeanBFP<-NULL;
# uncormeanBFP<-NULL;
# GFPvFSCslope<-NULL;
# BFPvFSCslope<-NULL;
i<-0;
for (file in filenames)    
{
  data <- read.csv(file)  
  dataframe <- as.data.frame(data)
  i<-i+1;
  names(dataframe)[names(dataframe) == "V1-A"] <- "V1.A" 
  names(dataframe)[names(dataframe) == "B1-A"] <- "B1.A"
  names(dataframe)[names(dataframe) == "FSC-A"] <- "FSC.A"
  filename[i] <- file[i]
  GFPmedianwith0[i] <- log10(median(dataframe$B1.A))
  BFPmedianwith0[i] <- log10(median(dataframe$V1.A))
  FSCmedianwith0[i] <- log10(median(dataframe$FSC.A))
  GFPmeanwith0[i] <- log10(mean(dataframe$B1.A))
  BFPmeanwith0[i] <- log10(mean(dataframe$V1.A))
  FSCmeanwith0[i] <- log10(mean(dataframe$FSC.A))
}
newdataframe <- as.data.frame(cbind(filename,GFPmedianwith0, BFPmedianwith0, FSCmedianwith0, GFPmeanwith0, BFPmeanwith0, FSCmeanwith0))
write.csv(newdataframe, file="ExtractedStatsMar13.csv", na="", row.names=FALSE)
                              
                              