rm(list=ls())
library(flowCore)
library(flowStats)
library(flowUtils)
library(flowViz)
library(flowWorkspace)

parent.dir <- "/Users/kompella/Documents/PeisajovichLab/FACS/2018.08.12_CB009_lines1to4/Renamed"
setwd(parent.dir)

filenames <- list.files(".", pattern=".fcs", recursive = TRUE, include.dirs = TRUE)
filename <- NULL;
GFPmedian <- NULL;
BFPmedian <- NULL;

#GFPmean <- NULL;
#BFPmean <- NULL;

#GFPcv <- NULL;
#BFPcv <- NULL;
i <- 0;
# is.finite.data.frame <- function(obj){
#   sapply(obj,FUN = function(x) all(is.finite(x)))
# }
for (file in filenames)    
{
  data <- read.FCS(file, transformation = FALSE)  
  dataframe <- exprs(data)
  dataframe[dataframe==0] <- NA
  dataframe <- dataframe[complete.cases(dataframe[,c("FSC-A", "V_450/50-A", "B_530/30-A")]),] #FORTESSA
  dataframe <- as.data.frame(dataframe) #uncheck for VYB
  #dataframe <- subset(dataframe, is.finite(dataframe$`B1-A`) & is.finite(dataframe$`V1-A`)) #VYB
  #dataframe <- dataframe[is.finite.data.frame(dataframe[,c("FSC-A", "V1-A", "B1-A")]),] #VYB
  
  
  i<-i+1;
  filename[i] <- filenames[i]
  #FORTESSA
   GFPmedian[i] <- log10(median(dataframe$`B_530/30-A`))
   BFPmedian[i] <- log10(median(dataframe$`V_450/50-A`))
  # 
  #GFPmean[i] <- log10(mean(dataframe$`B_530/30-A`))
  # BFPmean[i] <- log10(mean(dataframe$`V_450/50-A`))
  # 
  # GFPcv[i] <- log10(sd(dataframe$`B_530/30-A`)/mean(dataframe$`B_530/30-A`))
  # BFPcv[i] <- log10(sd(dataframe$`V_450/50-A`)/mean(dataframe$`V_450/50-A`))
  
  #VYB
  #GFPmedian[i] <- log10(median(dataframe$`B1-A`))
  #BFPmedian[i] <- log10(median(dataframe$`V1-A`))

  #GFPmean[i] <- log10(mean(dataframe$`B1-A`))
  #BFPmean[i] <- log10(mean(dataframe$`V1-A`))

  #GFPcv[i] <- log10(sd(dataframe$`B1-A`)/mean(dataframe$`B1-A`))
  #BFPcv[i] <- log10(sd(dataframe$`V1-A`)/mean(dataframe$`V1-A`))
}
newdataframe <- as.data.frame(cbind(filename,GFPmedian, BFPmedian)) #, GFPmean, BFPmean, GFPcv, BFPcv))
write.csv(newdataframe, file="ExtractedStats_08122018.csv", na="", row.names=FALSE)

