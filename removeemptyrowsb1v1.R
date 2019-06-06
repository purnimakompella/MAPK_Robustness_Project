rm(list=ls())
library(stringi)
#library(flowCore)
#library(flowStats)
#library(flowUtils)
#library(flowViz)
#library(flowWorkspace)

#install.packages("tools") #currently installed; need it for file_path_sans_ext
library (tools)

parent.dir <- "/valr/purnima/Ste50LibraryFACSData/2_log10CSV"
setwd(parent.dir)

filenames <- list.files(".", pattern=".csv", recursive = TRUE, include.dirs = TRUE)
filename <- NULL;
fewestrows=10000000;
fewestrowsfilename <- NULL;
i <- 0;

for (file in filenames)    
{
  #data <- read.csv(file, header=T)  
  #data <- data[!apply(is.na(data) | data == "", 1, all),]
    #print(paste("rows with empty:", nrow(data)))
  #data <- na.omit(data)
    #print(paste("rows without emptys:", nrow(data)))

  i<-i+1;
  filename[i] <- filenames[i]
  basename <- file_path_sans_ext(basename(filename[i]))
  name <- paste(basename,"_NoEmpty.csv") #get filename without path
  name <- gsub(" ","", name) #delete spaces
  
  data <- read.csv(file, header=T)  
  if (stri_detect_fixed(filename[i], "Vyb"))
  {
      finiteb1dataframe <- data[is.finite(data$`B1.A`),]
      finiteb1v1dataframe <- finiteb1dataframe[is.finite(finiteb1dataframe$`V1.A`),]
      write.csv(finiteb1v1dataframe, file=name, na="", row.names=FALSE)
      cat(paste("\nCurrent lowest # rows: ", fewestrows))
      cat(paste("\n\tName: ", basename, "\n\t\tCurrent number of rows: ", nrow(data)))
      cat(paste("\n\t\tCurrent Finite number of rows: ", nrow(finiteb1v1dataframe)))
      
      #data <- data[!apply(is.na(data) | data == "", 1, all),] #doesn't do anything
      #print(paste("rows with empty:", nrow(data)))
      #data <- na.omit(data)
      #print(paste("rows without emptys:", nrow(data)))
  }
  else if (stri_detect_fixed(filename[i], "Fortessa"))
  {
    finiteb1dataframe <- data[is.finite(data$`B_530.30.A`),]
    finiteb1v1dataframe <- finiteb1dataframe[is.finite(finiteb1dataframe$`V_450.50.A`),]
    
    write.csv(finiteb1v1dataframe, file=name, na="", row.names=FALSE)
    cat(paste("\nCurrent lowest # rows: ", fewestrows))
    cat(paste("\n\tName: ", basename, "\n\t\tCurrent number of rows: ", nrow(data)))
    cat(paste("\n\t\tCurrent Finite number of rows: ", nrow(finiteb1v1dataframe)))
  }
  
  if (nrow(finiteb1v1dataframe)<fewestrows)
  {
    fewestrows = nrow(finiteb1v1dataframe)
    fewestrowsfilename = basename
  }
}

cat (paste("\n~Fewest Rows: ",fewestrows, "\n~Name: ", fewestrowsfilename))


