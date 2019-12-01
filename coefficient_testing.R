#read in datasets
# read in dataset 3805
sig_table <- read.table("SIGNIFICANT_3805.csv",header = TRUE) 

#spearman
spear1 <- cor.test(sig_table$XTAIL,sig_table$BABEL, method = "spearman")
spear1 
spear2 <- cor.test(sig_table$XTAIL,sig_table$RIBOREX, method = "spearman")
spear2 
spear3 <- cor.test(sig_table$XTAIL,sig_table$RIBODIFF, method = "spearman")
spear3 
spear4 <- cor.test(sig_table$BABEL,sig_table$RIBOREX, method = "spearman")
spear4 
spear5 <- cor.test(sig_table$BABEL,sig_table$RIBODIFF, method = "spearman")
spear5 
spear6 <- cor.test(sig_table$RIBOREX,sig_table$RIBODIFF, method = "spearman")
spear6 

#kendall
ken1 <- cor.test(sig_table$XTAIL,sig_table$BABEL, method = "kendall")
ken1 
ken2 <- cor.test(sig_table$XTAIL,sig_table$RIBOREX, method = "kendall")
ken2 
ken3 <- cor.test(sig_table$XTAIL,sig_table$RIBODIFF, method = "kendall")
ken3 
ken4 <- cor.test(sig_table$BABEL,sig_table$RIBOREX, method = "kendall")
ken4 
ken5 <- cor.test(sig_table$BABEL,sig_table$RIBODIFF, method = "kendall")
ken5 
ken6 <- cor.test(sig_table$RIBOREX,sig_table$RIBODIFF, method = "kendall")
ken6 

#read in dataset 6196

sig_table2 <- read.table("SIGNIFICANT_6196.csv",header = TRUE) 

#spearman
spe1 <- cor.test(sig_table2$XTAIL,sig_table2$BABEL, method = "spearman")
spe1 
spe2 <- cor.test(sig_table2$XTAIL,sig_table2$RIBOREX, method = "spearman")
spe2 
spe3 <- cor.test(sig_table2$XTAIL,sig_table2$RIBODIFF, method = "spearman")
spe3 
spe4 <- cor.test(sig_table2$BABEL,sig_table2$RIBOREX, method = "spearman")
spe4 
spe5 <- cor.test(sig_table2$BABEL,sig_table2$RIBODIFF, method = "spearman")
spe5 
spe6 <- cor.test(sig_table2$RIBOREX,sig_table2$RIBODIFF, method = "spearman")
spe6 

#kendall
k1 <- cor.test(sig_table2$XTAIL,sig_table2$BABEL, method = "kendall")
k1 
k2 <- cor.test(sig_table2$XTAIL,sig_table2$RIBOREX, method = "kendall")
k2 
k3 <- cor.test(sig_table2$XTAIL,sig_table2$RIBODIFF, method = "kendall")
k3 
k4 <- cor.test(sig_table2$BABEL,sig_table2$RIBOREX, method = "kendall")
k4 
k5 <- cor.test(sig_table2$BABEL,sig_table2$RIBODIFF, method = "kendall")
k5 
k6 <- cor.test(sig_table2$RIBOREX,sig_table2$RIBODIFF, method = "kendall")
k6 