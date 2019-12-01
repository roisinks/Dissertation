
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

#hist(res.deseq2$pvalue, main = 'DESEQ2 unadjusted p-values', xlab='unadjusted p-values')
#the p-value distribuion is expected based on the DESEQ2 manual,which is uniformly distributed with DEG's enriched with small p-values
#summarise results
summary(res.deseq1_3805)
#save results
write.table(res.deseq1_3805,"riborex_3805_res_deseq.txt",quote = FALSE)
#write.table(res.deseq2, "riborex_res_deseq.txt", quote = FALSE)
#edgeR engine
res.edgeR_3805 <- riborex(mrna, rpf, conditionrna, conditionrp, "edgeR")
write.table(res.edgeR_3805,"riborex_3805_res_edgeR.txt",quote = FALSE)

#res.edgeR <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond, "edgeR")
#format is same as in RNA-seq analysis
head(res.edgeR_3805$table)
#head(res.edgeR$table)
#choose to estimate dispersion of data separately by specifying engine as edgeRD
res.edgeRD_3805 <- riborex(mrna, rpf, conditionrna, conditionrp, "edgeRD")
write.table(res.edgeRD_3805,"riborex_3805_res_edgeRD.txt",quote = FALSE)


#res.edgeRD <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond, "edgeRD")
# using voom as engine
res.voom_3805 <- riborex(mrna, rpf, conditionrna, conditionrp, "Voom")

#res.voom <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond, "Voom")
#format the same as in RNA-seq analysis
head(res.voom_3805)

#setup allows for analysis information
#sessionInfo()

end_time <- Sys.time()
end_time - start_time
