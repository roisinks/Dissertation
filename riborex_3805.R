start_time <- Sys.time()
#load riborex library
library(riborex)
#input 2 read count tables from RNA and ribo seq data
#read in datasets
rna <- read.csv("MRNA_EXCEL.csv",sep="\t", row.names =1 )
mrna <- rna

rpf <- read.csv("RPF_EXCEL.csv",sep = "\t", row.names = 1)
#set conditions vectors
conditionrp <- c("Control","Control","Treated","Treated")
conditionrna <- c("Control","Control","Treated","Treated")
#check top 5 lines of files
head(rna,5)
head(rpf,5)

#choose which engine to use, deseq2 is default if dont want to specify engine
res.deseq1_3805 <- riborex(rna,rpf, conditionrp, conditionrna)
#res.deseq2 <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond)
#format of results is same when deseq2 used in RNA seq analysis
#check distribution of p-values
hist(res.deseq1_3805$pvalue, main = 'DESEQ2 unadjusted p-values', xlab='unadjusted p-values')
#the p-value distribuion is expected based on the DESEQ2 manual,which is uniformly distributed with DEG's enriched with small p-values
#summarise results
summary(res.deseq1_3805)
#save results
write.table(res.deseq1_3805,"riborex_3805_res_deseq.txt",quote = FALSE)

end_time <- Sys.time()
end_time - start_time
