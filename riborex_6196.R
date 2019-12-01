
start_time <- Sys.time()
#load riborex library
library(riborex)
#input 2 read count tables from RNA and ribo seq data
rna = read.table("WT_EMTAB6196.txt",header = TRUE,row.names = 1)
mrna <- rna
rpf <- read.table("RPF_EMTAB6196.txt",header = TRUE,row.names = 1)
#set conditions
conditionrp <- c("GPB","GPB","GPA","GPA","GPA","GPA","GPA","GPA")
conditionrna<- c("GPB","GPB","GPA","GPA","GPA","GPA","GPA","GPA")

#choose which engine to use, deseq2 is default if dont want to specify engine
res.deseq1_6196 <- riborex(mrna,rpf,conditionrp, conditionrna)
#format of results is same when deseq2 used in RNA seq analysis
#check distribution of p-values
hist(res.deseq1_6196$pvalue, main = 'DESEQ2 unadjusted p-values', xlab='unadjusted p-values')

#the p-value distribuion is expected based on the DESEQ2 manual,which is uniformly distributed with DEG's enriched with small p-values
#summarise results
summary(res.deseq1_6196)
#save results
write.table(res.deseq1_6196,"riborex_6196_res_deseq.txt",quote = FALSE)

end_time <- Sys.time()
end_time - start_time
