# MAPK_Robustness_Project
Author: Purnima Kompella

These are a few scripts that were useful to me in figuring out how to work with Flow Cytometry data in R.

ExtractingStatsfromFCSfiles_Mar29.R and WithZerosStats.R get population level metrics for the samples.

FCStolog10CSV_Fortessa.R reads FCS files, converts the data to log10 and saves it as CSV such that it may be manipulated easily in a dataframe.

NormalizeGFPandBFPtoFSC-2-Multi.R, Three_Normalizations.R and NormalizetoPool.R were my attempts at normalizing the reporter fluorescence data to scatter intensities.

removeemptyrowsb1v1.R removes any rows with missing values for the two channels of interest, B1 (GFP) and V1 (BFP).

TransformingData.R changes the column names and layout of the data.
