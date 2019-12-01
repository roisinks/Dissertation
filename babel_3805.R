start_time <- Sys.time()

#load data library
library(babel)
#read in datasets
mrna <- read.table("MRNA_EXCEL.csv",header = TRUE,row.names = 1)
rpf <- read.table("RPF_EXCEL.csv",header = TRUE,row.names = 1)
#get rna count data
RNA <- mrna
RPF <- rpf
print(RNA[1:5, ]) 
print(RPF[1:5, ])
#read in rp count data, if rownames/ colnames differ from rna count data adjust them so are they same
#estimate pvalues for RPF counts given the mRNA counts within every experiment.
#tests are one sided, highter than expected RPF counts lead to low pvalues and vice versa
#assign group labels - all tested pairwise
new_group = c("Control","Control","Treated","Treated")
#core number fixed to 1, 2 cores used by default however unless running windows. 
options(mc.cores = 1)
#set the seed so the result is reproducible
set.seed(12345)
#run with 100000 repetitions
babel_3805 <-babel(RNA,RPF,group = new_group,nreps=100000,min.rna = 10)
#test.babel <- babel(test.rna,test.rp,group = test.group,nreps=100000,min.rna = 10)
#extract bewteen group p-values
between_babel_3805 <- babel_3805$between
#between.babel <- test.babel$between
print(between_babel_3805[[1]][1:5, ])
#log_FDR and mRNA_FDR are based on tests for differential expression just on mRNA data
# genus with mRNA_FDR labelled <0.05 are both= change is in expression and translation, everything else is translational_only
between_babel_3805

#export plain text file
write.table(between_babel_3805,"babel_3805.txt",quote=F,sep = "\t")
#export xtail results to tab delim file
#write.xtail(xtail_test.results,"xtail_test_results.txt",quote=F,sep="\t")

end_time <- Sys.time()
end_time - start_time
