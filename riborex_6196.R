
start_time <- Sys.time()
#load riborex library
library(riborex)
#input 2 read count tables from RNA and ribo seq data
#data(riborexdata)
#RNACntTable <- rna
#RNACntTable
#RiboCntTable <- ribo
rna = read.table("WT_EMTAB6196.txt",header = TRUE,row.names = 1)
mrna <- rna
rpf <- read.table("RPF_EMTAB6196.txt",header = TRUE,row.names = 1)
#set conditions
conditionrp <- c("GPB","GPB","GPA","GPA","GPA","GPA","GPA","GPA")
conditionrna<- c("GPB","GPB","GPA","GPA","GPA","GPA","GPA","GPA")

#check first five lines of the tables
#head(RNACntTable,5)
#head(RiboCntTable,5)
#preprare 2 vectors indicating treatments of samples in RNA and ribo seq data, can have different number of samples in both

#choose which engine to use, deseq2 is default if dont want to specify engine
res.deseq1_6196 <- riborex(mrna,rpf,conditionrp, conditionrna)
#res.deseq2 <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond)
#format of results is same when deseq2 used in RNA seq analysis
#check distribution of p-values
hist(res.deseq1_6196$pvalue, main = 'DESEQ2 unadjusted p-values', xlab='unadjusted p-values')

#hist(res.deseq2$pvalue, main = 'DESEQ2 unadjusted p-values', xlab='unadjusted p-values')
#the p-value distribuion is expected based on the DESEQ2 manual,which is uniformly distributed with DEG's enriched with small p-values
#summarise results
summary(res.deseq1_6196)
#save results
write.table(res.deseq1_6196,"riborex_6196_res_deseq.txt",quote = FALSE)
#write.table(res.deseq2, "riborex_res_deseq.txt", quote = FALSE)
#edgeR engine
res.edgeR_6196 <- riborex(mrna, rpf, conditionrna, conditionrp, "edgeR")
write.table(res.edgeR_6196,"riborex_6196_res_edgeR.txt",quote = FALSE)

#res.edgeR <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond, "edgeR")
#format is same as in RNA-seq analysis
head(res.edgeR_6196$table)
#head(res.edgeR$table)
#choose to estimate dispersion of data separately by specifying engine as edgeRD
res.edgeRD_6196 <- riborex(mrna, rpf, conditionrna, conditionrp, "edgeRD")
write.table(res.edgeRD_6196,"riborex_6196_res_edgeRD.txt",quote = FALSE)


#res.edgeRD <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond, "edgeRD")
# using voom as engine
res.voom_6196 <- riborex(mrna, rpf, conditionrna, conditionrp, "Voom")

#res.voom <- riborex(RNACntTable, RiboCntTable, rnaCond, riboCond, "Voom")
#format the same as in RNA-seq analysis
head(res.voom_6196)
#'incorrect' p-value distribution
#rna.corrected <- WT_EMTAB6196.null
#mrna.corrected <- rna.null
#RNACntTable.corrected <- rna.null
#RiboCntTable.corrected <-ribo.null
#check first 5 lines
#head(RNACntTable.corrected)
#head(RiboCntTable.corrected)
#condition vectors created
#rnaCond.corrected <- c(rep('TO',3), rep('T24',3))
#riboCond.corrected <- rnaCond.corrected
#rnaCond.corrected
#riboCond.corrected
#results from DESeq2 
#res.deseq2.corrected <- riborex(RNACntTable.corrected, RiboCntTable.corrected, rnaCond.corrected, riboCond.corrected)
#check p-value distribution after correction
#hist(results.corrected$pvalue, main = 'DESeq2 unadjusted p-values after correction', xlab = 'Corrected unadjusted p-values')
#after the correction, distribution of p-values is as expected, and adjusted p values corrected also

#multi-factor experiment
#generate multi factor datsets in this scenario
#rna <- RNACntTable[,c(1,2,3,4,1,2,3,4)]
#ribo <- RiboCntTable[,c(1,2,3,4,1,2,3,4)]
#prepare 2 data frames to indicate treatment ie 3rd and 4th samples treated with drug1, 7th and 8th sample treated with drug2
#rnaCond <- data.frame(factor1=(c("control1", "control1", "treated1", "treated1", "control1", "control1", "control1", "control1")),factor2=(c("control2", "control2", "control2", "control2", "control2", "control2", "treated2", "treated2")))
#riboCond <- data.frame(factor1=(c("control1", "control1", "treated1", "treated1", "control1", "control1", "control1", "control1")),factor2=(c("control2", "control2", "control2", "control2", "control2", "control2", "treated2", "treated2")))
#prepare a contrast to specify comparison wanted. ie compare drug2 usage
#contrast = c("factor2", "control2", "treated2")
#riborex used with contrast specified
#res.deseq2 <- riborex(rna, ribo, rnaCond, riboCond, "DESeq2", contrast = contrast)
#summary of result
#summary(res.deseq2)
#edgeR and edgeRD used in similar way
#res.edgeR <- riborex(rna, ribo, rnaCond, riboCond, "edgeR", contrast = contrast)
#res.edgeRD <- riborex(rna, ribo, rnaCond, riboCond, "edgeRD", contrast = contrast)
#cant choose voom currentl in multi factor experiments

#setup allows for analysis information
#sessionInfo()

end_time <- Sys.time()
end_time - start_time
