start_time <- Sys.time()

#data preparation
#load library data
library(xtail)
#read in datasets
mrna <- read.table("WT_EMTAB6196.txt",header = TRUE, row.names = 1)
rpf <- read.table("RPF_EMTAB6196.txt",header = TRUE, row.names = 1)
#set conditions
condition <- c("GpB","GpB","GpA","GpA","GpA","GpA","GpA","GpA")
#create a variable for xtail results to go to 
test_6196_results <- xtail(mrna,rpf,condition)
#put results into table format
test.tab <- resultsTable(test_6196_results)
#export plain text file
write.table(test.tab,"test_6196_results.txt",quote=F,sep = "\t")
#export xtail results to tab delim file
write.xtail(test_6196_results,"test_6196_results.txt",quote=F,sep="\t")


end_time <- Sys.time()
end_time - start_time

