#install packages
install.packages("devtools")
library(devtools)
install_github("vqv/ggbiplot")

#read in data
data <- read.table("rpm.counts.txt",header = TRUE, row.names = 1)
#create a data matrix
Mymatrix <- data.matrix(data)
#transpose the data matrix
TransposedMatrix <- t(Mymatrix)
#prcomp takes data as input, usually has SCALE=TRUE
results_pca <- prcomp(TransposedMatrix)
names <- rownames(TransposedMatrix)
#load function
library(ggbiplot)
#image compression to produce a pca jpeg
jpeg("PCA.jpg",quality=100,width = 800,height = 800)
#plot the pca
pca<-ggbiplot(results_pca,groups=names,labels = names,var.axes = FALSE)
dev.off()


ggbiplot(results_pca)
