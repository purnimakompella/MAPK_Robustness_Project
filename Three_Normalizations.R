library(flowCore)
library(ggplot2)
#set working directory
setwd("/Users/kompella/Documents/R/Data/TC4-6csv/Non-normalized")

#for (file in c("11-22.0002", "11-22.0003", "11-22.0004", "11-22.0005", "11-22.0006", "11-22.0007", "11-22.0008", "11-22.0009", "11-22.0010", "11-22.0011", "11-22.0012", "11-22.0013", "11-22.0014", "11-22.0015", "11-22.0016", "11-22.0017", "11-22.0018", "11-22.0019", "11-22.0020", "11-22.0021", "11-22.0022", "11-22.0023", "11-22.0024", "11-22.0025", "11-22.0026", "11-22.0027", "11-22.0028", "11-22.0029", "11-22.0030", "11-22.0031", "11-22.0032", "11-22.0033", "11-22.0034", "11-22.0035", "11-22.0036", "11-22.0037", "11-22.0038", "11-22.0039", "11-22.0040", "11-22.0041", "11-22.0042", "11-22.0043", "11-22.0044", "11-22.0045", "11-22.0046", "11-22.0047", "11-22.0048", "11-22.0049", "11-22.0050", "11-22.0051", "11-22.0052", "11-22.0053", "11-22.0054", "11-22.0055", "11-22.0056", "11-22.0057", "11-22.0058", "11-22.0059", "11-22.0060", "11-22.0061", "11-22.0062", "11-22.0063", "11-22.0064", "11-22.0065", "11-22.0066", "11-22.0067", "11-22.0068", "11-22.0069", "11-22.0070", "11-22.0071", "11-22.0072", "11-22.0073", "11-22.0074", "11-22.0075", "11-22.0076", "11-22.0077", "11-22.0078", "11-22.0079", "11-22.0080", "11-22.0081", "11-22.0082", "11-22.0083", "11-22.0084", "11-22.0085", "11-22.0086", "11-22.0087", "11-22.0088", "11-22.0089", "11-22.0090", "11-22.0091", "11-27.0002", "11-27.0003", "11-27.0004", "11-27.0005", "11-27.0006", "11-27.0007", "11-27.0008", "11-27.0009", "11-27.0010", "11-27.0011", "11-27.0012", "11-27.0013", "11-27.0014", "11-27.0015", "11-27.0016", "11-27.0017", "11-27.0018", "11-27.0019", "11-27.0020", "11-27.0021", "11-27.0022", "11-27.0023", "11-27.0024", "11-27.0025", "11-27.0026", "11-27.0027", "11-27.0028", "11-27.0029", "11-27.0030", "11-27.0031", "11-27.0032", "11-27.0033", "11-27.0034", "11-27.0035", "11-27.0036", "11-27.0037", "11-27.0038", "11-27.0039", "11-27.0040", "11-27.0041", "11-27.0042", "11-27.0043", "11-27.0044", "11-27.0045", "11-27.0046", "11-27.0047", "11-27.0048", "11-27.0049", "11-27.0050", "11-27.0051", "11-27.0052", "11-27.0053", "11-27.0054", "11-27.0055", "11-27.0056", "11-27.0057", "11-27.0058", "11-27.0059", "11-27.0060", "11-27.0061", "11-27.0062", "11-27.0063", "11-27.0064", "11-27.0065", "11-27.0066", "11-27.0067", "11-27.0068", "11-27.0069", "11-27.0070", "11-27.0071", "11-27.0072", "11-27.0073", "11-27.0074", "11-27.0075", "11-27.0076", "11-27.0077", "11-27.0078", "11-27.0079", "11-27.0080", "11-27.0081", "11-27.0082", "11-27.0083", "11-27.0084", "11-27.0085", "11-27.0086", "11-27.0087", "11-27.0088", "11-27.0089", "11-27.0090", "11-27.0091", "11-27.0092", "11-27.0093", "11-27.0094", "11-27.0095", "11-27.0096", "11-27.0097", "11-27.0098", "11-27.0099", "11-29.0091", "11-29.0092", "11-29.0093", "11-29.0094", "11-29.0095", "11-29.0096", "11-29.0097", "11-29.0098", "11-29.0099", "11-29.0100", "11-29.0101", "11-29.0102", "11-29.0103", "11-29.0104", "11-29.0105", "11-29.0106", "11-29.0107", "11-29.0108", "11-29.0109", "11-29.0110", "11-29.0111", "11-29.0112", "11-29.0113", "11-29.0114", "11-29.0115", "11-29.0116", "11-29.0117", "11-29.0118", "11-29.0119", "11-29.0120", "11-29.0121", "11-29.0122", "11-29.0123", "11-29.0124", "11-29.0125", "11-29.0126", "11-29.0127", "11-29.0128", "11-29.0129", "11-29.0130", "11-29.0131", "11-29.0132", "11-29.0133", "11-29.0134", "11-29.0135", "11-29.0136", "11-29.0137", "11-29.0138", "11-29.0139", "11-29.0140", "11-29.0141", "11-29.0142", "11-29.0143", "11-29.0144", "11-29.0145", "11-29.0146", "11-29.0147", "11-29.0148", "11-29.0149", "11-29.0150", "11-29.0151", "11-29.0152", "11-29.0153", "11-29.0154", "11-29.0155", "11-29.0156", "11-29.0157", "11-29.0158", "11-29.0159", "11-29.0160", "11-29.0161", "11-29.0162", "11-29.0163", "11-29.0164", "11-29.0165", "11-29.0166", "11-29.0167", "11-29.0168", "11-29.0169", "11-29.0170", "11-29.0171", "11-29.0172", "11-29.0173", "11-29.0174", "11-29.0175", "11-29.0176", "11-29.0177", "11-29.0178", "11-29.0179", "11-29.0180", "11-29.0181", "11-29.0182", "11-29.0183", "11-29.0184", "11-29.0185", "11-29.0186", "11-29.0187", "11-29.0188"))
for (file in c("11-22.0023", "11-22.0027", "11-22.0021", "11-22.0025", "11-22.0039", "11-22.0043", "11-22.0037", "11-22.0041", "11-22.0087", "11-22.0091", "11-22.0085", "11-22.0089", "11-29.0115", "11-29.0116", "11-29.0111", "11-29.0112", "11-29.0131", "11-29.0132", "11-29.0127", "11-29.0128", "11-29.0187", "11-29.0188", "11-29.0183", "11-29.0184"))
    
  {
  data <- read.csv(paste("PK2017-",file,".csv",sep=""))
  dataframe <- as.data.frame(data)
  newdataframe <- subset(dataframe, V1.A>0 & B1.A>0) #Create a subset without rows where either BFP/GFP=0
  
#Non-normalized values with zeros
  GFPmean <- mean(dataframe$B1.A)
  GFPsd <- sd(dataframe$B1.A)
  BFPmean <- mean(dataframe$V1.A)
  BFPsd <- sd(dataframe$V1.A)
  FSCmean <- mean(dataframe$FSC.A)
  FSCsd <- sd(dataframe$FSC.A)
  
#Non-normalized values without zeros
  GFPnozeromean <- mean(newdataframe$B1.A)
  GFPnozerosd <- sd(newdataframe$B1.A)
  BFPnozeromean <- mean(newdataframe$V1.A)
  BFPnozerosd <- sd(newdataframe$V1.A)
  FSCnozeromean <- mean(newdataframe$FSC.A)
  FSCnozerosd <- sd(newdataframe$FSC.A)
  
#Normalized to FSC
  #GFP
  GFPvFSC.lm = lm(B1.A ~ FSC.A, data=newdataframe) #Fit Linear Model
  GFPvFSC.res = resid(GFPvFSC.lm) #Store Residuals
  slopeGFPvFSC <- coef(GFPvFSC.lm)[2] #Store Slope
  rsquaredGFPvFSC <- summary(GFPvFSC.lm)$r.squared #store R-squared
  interceptGFPvFSC <- coef(GFPvFSC.lm)[1] #StoreIntercept
  
  newdataframe$FSCxGFPslope <- newdataframe$FSC.A*slopeGFPvFSC #Multiple FSC and slope and store it in the new column
  newdataframe$GFPResiduals <- newdataframe$FSCxGFPslope-interceptGFPvFSC #Subtract slope-normalized FSC and intercept from GFP and store it in the new column
  newdataframe$FSCNormGFP <- (newdataframe$B1.A-newdataframe$FSCxGFPslope)-interceptGFPvFSC

  #BFP
  BFPvFSC.lm = lm(V1.A ~ FSC.A, data=newdataframe) #Fit Linear Model
  BFPvFSC.res = resid(BFPvFSC.lm) #Store Residuals
  slopeBFPvFSC <- coef(BFPvFSC.lm)[2] #Store Slope
  rsquaredBFPvFSC <- summary(BFPvFSC.lm)$r.squared #store R-squared
  interceptBFPvFSC <- coef(BFPvFSC.lm)[1] #StoreIntercept
  
  newdataframe$FSCxBFPslope <- newdataframe$FSC.A*slopeBFPvFSC #Multiple FSC and slope and store it in the new column
  newdataframe$BFPResiduals <- newdataframe$FSCxBFPslope-interceptBFPvFSC #Subtract slope-normalized FSC and intercept from BFP and store it in the new column
  newdataframe$FSCNormBFP <- (newdataframe$V1.A-newdataframe$FSCxBFPslope)-interceptBFPvFSC #Subtract Residuals from BFP and store it in the new column
  
  #FSC normalized values
  FSCNormGFPmean <- mean(newdataframe$FSCNormGFP)
  FSCNormGFPsd <- sd(newdataframe$FSCNormGFP)
  FSCNormBFPmean <- mean(newdataframe$FSCNormBFP)
  FSCNormBFPsd <- sd(newdataframe$FSCNormBFP)


#Normalize GFP to BFP and vv
  newdataframe$GFPoverBFP <- newdataframe$B1.A/newdataframe$V1.A
  newdataframe$BFPoverGFP <- newdataframe$V1.A/newdataframe$B1.A
  
  #GFP/BFP and BFP/GFP Normalized values
  GFPoverBFPmean <- mean(newdataframe$GFPoverBFP)
  GFPoverBFPsd <- sd(newdataframe$GFPoverBFP)
  BFPoverGFPmean <- mean(newdataframe$BFPoverGFP)
  BFPoverGFPsd <- sd(newdataframe$BFPoverGFP)
  
#Log Normalized GFP/BFP and BFP/GFP
  newdataframe$logGFPoverBFP <- log10(newdataframe$GFPoverBFP)
  newdataframe$logBFPoverGFP <- log10(newdataframe$BFPoverGFP)
  
  #Log normalized values
  logGFPoverBFPmean <- mean(newdataframe$logGFPoverBFP)
  logGFPoverBFPsd <- sd(newdataframe$logGFPoverBFP)
  logBFPoverGFPmean <- mean(newdataframe$logBFPoverGFP)
  logBFPoverGFPsd <- sd(newdataframe$logBFPoverGFP)
  
#Normalize to Pool
  pooledGFPvFSCslope <- 0.868364276173913
  pooledGFPvFSCintercept <- -130.251787236825
  pooledBFPvFSCslope <- 0.518831370773989
  pooledBFPvFSCintercept <- -38.3960724873609
  
  newdataframe$FSCxGFPPoolslope <- newdataframe$FSC.A*pooledGFPvFSCslope
  newdataframe$PoolNormGFP <- (newdataframe$B1.A-newdataframe$FSCxGFPPoolslope)-pooledGFPvFSCintercept
  newdataframe$FSCxBFPPoolslope <- newdataframe$FSC.A*pooledBFPvFSCslope 
  newdataframe$PoolNormBFP <- (newdataframe$V1.A-newdataframe$FSCxBFPPoolslope)-pooledBFPvFSCintercept
  
  #Pool Normalized values
  PoolNormGFPmean <- mean(newdataframe$PoolNormGFP)
  PoolNormGFPsd <- sd(newdataframe$PoolNormGFP)
  PoolNormBFPmean <- mean(newdataframe$PoolNormBFP)
  PoolNormBFPsd <- sd(newdataframe$PoolNormBFP)


#print(paste("GFPmean:", GFPmean, "BFPmean:", BFPmean, "NormGFPmean:", normGFPmean, "NormBFPmean:", normBFPmean,"LogNormGFPmean:", lognormGFPmean,"LogNormBFPmean:", lognormBFPmean))
  pdf(paste(file, "3Norms.pdf"))
  
  plot(dataframe$FSC.A, dataframe$B1.A, main=file, xlab=paste("pFus1-GFP, mean:", round(GFPmean, digits=3), ", SD:", round(GFPsd, digits=3)), ylab=paste("FSC, mean:", round(FSCmean, digits=3), ", SD: ", round(FSCsd, digits=3)))
  plot(dataframe$FSC.A, dataframe$V1.A, main=file, xlab=paste("pStl-BFP, mean:", round(BFPmean, digits=3), ", SD:", round(BFPsd, digits=3)), ylab=paste("FSC, mean:", round(FSCmean, digits=3), ", SD: ", round(FSCsd, digits=3)))
  hist(dataframe$B1.A, main=file, xlab="pFus1-GFP")
  hist(dataframe$V1.A, main=file, xlab="pStl1-BFP")
  
  plot(newdataframe$FSC.A, newdataframe$B1.A, main = file, xlab=paste("pFus1-GFP (No zeros), mean:", round(GFPnozeromean, digits=3), ", SD:", round(GFPnozerosd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  plot(newdataframe$FSC.A, newdataframe$V1.A, main = file, xlab=paste("pStl-BFP (No zeros), mean:", round(BFPnozeromean, digits=3), ", SD:", round(BFPnozerosd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  hist(newdataframe$B1.A, main=file, xlab="pFus1-GFP (No zeros)")
  hist(newdataframe$V1.A, main=file, xlab="pStl1-BFP (No zeros)")
  
  plot(newdataframe$FSC.A, newdataframe$FSCNormGFP,  main = file, xlab=paste("FSC norm pFus1-GFP, mean:", round(FSCNormGFPmean, digits=3), ", SD:", round(FSCNormGFPsd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  plot(newdataframe$FSC.A, newdataframe$FSCNormBFP,  main = file, xlab=paste("FSC norm pStl1-BFP, mean:", round(FSCNormBFPmean, digits=3), ", SD:", round(FSCNormBFPsd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  hist(newdataframe$FSCNormGFP, main=file, xlab="FSC norm pFus1-GFP")
  hist(newdataframe$FSCNormBFP, main=file, xlab="FSC norm pStl1-BFP")
  
  plot(newdataframe$FSC.A, newdataframe$GFPoverBFP,  main = file, xlab=paste("pFus1-GFP/pStl1-BFP, mean:", round(GFPoverBFPmean, digits=3), ", SD:", round(GFPoverBFPsd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  plot(newdataframe$FSC.A, newdataframe$BFPoverGFP,  main = file, xlab=paste("pStl1-BFP/pFus1-GFP, mean:", round(BFPoverGFPmean, digits=3), ", SD:", round(BFPoverGFPsd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  hist(newdataframe$GFPoverBFP, main=file, xlab="pFus1-GFP/pStl1-BFP")
  hist(newdataframe$BFPoverGFP, main=file, xlab="pStl1-BFP/pFus1-GFP")
  
  plot(newdataframe$FSC.A, newdataframe$logGFPoverBFP,  main = file, ylim=c(-6,6), xlab=paste("Log(pFus1-GFP/pStl1-BFP), mean:", round(logGFPoverBFPmean, digits=3), ", SD:", round(logGFPoverBFPsd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  plot(newdataframe$FSC.A, newdataframe$logBFPoverGFP,  main = file, ylim=c(-6,6), xlab=paste("Log(pStl1-BFP/pFus1-GFP), mean:", round(logBFPoverGFPmean, digits=3), ", SD:", round(logBFPoverGFPsd, digits=3)), ylab=paste("FSC (No zeros), mean:", round(FSCnozeromean, digits=3), ", SD: ", round(FSCnozerosd, digits=3)))
  hist(newdataframe$logGFPoverBFP, main=file, xlab="Log(pFus1-GFP/pStl1-BFP)")
  hist(newdataframe$logBFPoverGFP, main=file, xlab="Log(pStl1-BFP/pFus1-GFP)")
  dev.off()


#pdf(paste(file, "3Norms.pdf"))

##plot(newdataframe$FSC.A, newdataframe$B1.A, xlab=paste("pFus1-GFP, mean:", round(GFPmean, digits=3), ", SD:", round(GFPsd, digits=3)), ylab=paste("FSC, mean:", round(FSCmean, digits=3), ", SD: ", round(FSCsd, digits=3)))
 #hist(GFPvFSC.res, main=paste("R-squared", round(rsquaredGFPvFSC, digits=3))) #Print histogram of residuals
 #plot(newdataframe$FSC.A, GFPvFSC.res, ylab="pFus1-GFPvFSC Residuals", xlab="Forward Scatter (Cell Size)", main="GFPvFSC Residuals") #Plot Residuals
##plot(newdataframe$FSC.A, newdataframe$NormGFP, xlab=paste("pFus1-GFP-FSC*slope-intercept, mean:", round(NormGFPmean, digits=3), ", SD:", round(NormGFPsd, digits=3), ylab="FSC"))
 
 #hist(newdataframe$B1.A, xlab="pFus1-GFP", ylab="Count") #draw a histogram of GFP intensity
 #hist(newdataframe$NormGFP, xlab="(pFus1-GFP)-FSC*Slope-Intercept", ylab="Count") #draw a histogram of normalized GFP intensity


#BFP Normalized to FSC
#BFPvFSC.lm = lm(V1.A ~ FSC.A, data=newdataframe) #Fit Linear Model
#BFPvFSC.res = resid(BFPvFSC.lm) #Store Residuals
#slopeBFPvFSC <- coef(BFPvFSC.lm)[2] #Store Slope
#rsquaredBFPvFSC <- summary(BFPvFSC.lm)$r.squared #store R-squared
#interceptBFPvFSC <- coef(BFPvFSC.lm)[1] #StoreIntercept

#newdataframe$FSCxBFPslope <- newdataframe$FSC.A*slopeBFPvFSC #Multiple FSC and slope and store it in the new column
#newdataframe$BFPResiduals <- newdataframe$FSCxBFPslope-interceptBFPvFSC #Subtract slope-normalized FSC and intercept from BFP and store it in the new column
#newdataframe$NormBFP <- (newdataframe$V1.A-newdataframe$FSCxBFPslope)-interceptBFPvFSC #Subtract Residuals from BFP and store it in the new column
#NormBFPmean <- mean(newdataframe$NormBFP)
#NormBFPsd <- sd(newdataframe$NormBFP)

#hist(BFPvFSC.res, main=rsquaredBFPvFSC) #Print histogram of residuals
#plot(newdataframe$FSC.A, BFPvFSC.res, ylab="pStl1-BFPvFSC Residuals", xlab="Forward Scatter (Cell Size)", main="BFPvFSC Residuals") #Plot Residuals
##plot(newdataframe$FSC.A, newdataframe$V1.A, xlab=paste("pStl1-BFP, mean:", round(BFPmean, digits=3), ", SD:", round(BFPsd, digits=3)), ylab=paste("FSC, mean:", round(FSCmean, digits=3), ", SD: ", round(FSCsd, digits=3)))
##plot(newdataframe$FSC.A, newdataframe$NormBFP, xlab=paste("pStl1-BFP-FSC*slope-intercept, mean:", round(NormBFPmean, digits=3), ", SD:", round(NormBFPsd, digits=3), ylab="FSC"))

# hist(newdataframe$B1.A, xlab="pFus1-GFP", ylab="Count") #draw a histogram of GFP intensity
# hist(newdataframe$NormBFP, xlab="(pStl1-BFP)-FSC*Slope-Intercept", ylab="Count") #draw a histogram of normalized GFP intensity
  
#write.table(newdataframe, file=paste("PK2017-",file,"NormGFPtoBFPvv.csv"), na="", sep="\t", row.files=FALSE)
}