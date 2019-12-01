#installtion of Rsubread via BiocManager
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Rsubread")
#load Rsubread
library(Rsubread)
#input 3805 and 3815 separately using vector inputs to allow for multiple inputs into one variable
inputmRNA = c("E-MTAB-3805.MockRep1_pA.bam","E-MTAB-3805.MockRep1_totRNA.bam","E-MTAB-3805.MockRep2_pA.bam","E-MTAB-3805.MockRep2_totRNA.bam","E-MTAB-3805.shUNR_Rep1_pA.bam","E-MTAB-3805.shUNR_Rep1_totRNA.bam","E-MTAB-3805.shUNR_Rep2_pA.bam","E-MTAB-3805.shUNR_Rep2_totRNA.bam")
inputRPF = c("E-MTAB-3815.RPF1_KD.bam","E-MTAB-3815.RPF1_Mock.bam","E-MTAB-3815.RPF2_KD.bam","E-MTAB-3815.RPF2_Mock.bam","E-MTAB-3815.RPF3_KD.bam","E-MTAB-3815.RPF3_Mock.bam") 
#use the annot.ext file tophat UCSC hg19 to extract the gtf file needed which could be found in the protocol from both the 3805 and 3815 datset.
#first the output for the mrna (3805) dataset = 8 files present
#useMetaFeatures parameter is true as counts along the whole transcript
#strandSpecific =1 = forward strand
output <- featureCounts(inputmRNA,annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
write.csv(as.data.frame(output$counts),file="input.featureCounts")

#second the rpf(3815) dataset = 6 files present
#GTF.featuresType is CDS so will only count the CDS regions
output <- featureCounts(inputRPF,annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
write.csv(as.data.frame(output$counts),file="inputRPF.featureCounts")

#both files written to separate files- it extracts them 