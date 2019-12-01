start_time <- Sys.time()

#load data library
library(babel)
#read in datasets
mrna <- read.table("WT_EMTAB6196.txt",header = TRUE,row.names = 1)
rpf <- read.table("RPF_EMTAB6196.txt",header = TRUE,row.names = 1)
#get rna count data
rna1 <- mrna
rpf1 <- rpf
#test.rna <- ribo.prof$test.rna
print(rna1[1:5, ]) 
print(rpf1[1:5, ])
#read in rp count data, if rownames/ colnames differ from rna count data adjust them so are they same
#estimate pvalues for RPF counts given the mRNA counts within every experiment.
#tests are one sided, highter than expected RPF counts lead to low pvalues and vice versa
#assign group labels - all tested pairwise = conditions
test.group = c("GPB","GPB","GPA","GPA","GPA","GPA","GPA","GPA")
#core number fixed to 1, 2 cores used by default however unless running windows. 
options(mc.cores = 1)

#set the seed so the result is reproducible
set.seed(12345)
#run with 100000 repetitions
babel_6196 <-babel(rna1,rpf1,group = test.group,nreps = 100000,min.rna = 10)
#extract bewteen group p-values
between_babel <- babel_6196$between
#between.babel <- test.babel$between
print(between_babel[[1]][1:5, ])
#log_FDR and mRNA_FDR are based on tests for differential expression just on mRNA data
# genus with mRNA_FDR labelled <0.05 are both= change is in expression and translation, everything else is translational_only
between_babel

#export plain text file
write.table(between_babel,"babel_6196.txt",quote=F,sep = "\t")
#export xtail results to tab delim file
#write.xtail(xtail_test.results,"babel_test_results.txt",quote=F,sep="\t")

end_time <- Sys.time()
end_time - start_time
