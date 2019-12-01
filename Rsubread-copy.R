### R code from vignette source 'Rsubread.Rnw'

###################################################
### code chunk number 1: Rsubread.Rnw:70-73
###################################################

library(Rsubread)
#
# ref <- system.file("extdata","reference.fa",package="Rsubread")
# buildindex(basename="reference_index",reference=ref)
# 

###################################################
### code chunk number 2: Rsubread.Rnw:90-92
###################################################
# reads <- system.file("extdata","reads.txt.gz",package="Rsubread")
# align.stat <- align(index="reference_index",readfile1=reads,output_file="alignResults.BAM",phredOffset=64)
# 
# 
# ###################################################
# ### code chunk number 3: Rsubread.Rnw:99-103
# ###################################################
# reads1 <- system.file("extdata","reads1.txt.gz",package="Rsubread")
# reads2 <- system.file("extdata","reads2.txt.gz",package="Rsubread")
# align.stat2 <- align(index="reference_index",readfile1=reads1,readfile2=reads2,
# output_file="alignResultsPE.BAM",phredOffset=64)
# 
# 
# ###################################################
# ### code chunk number 4: Rsubread.Rnw:125-135
# ###################################################
# ann <- data.frame(
# GeneID=c("gene1","gene1","gene2","gene2"),
# Chr="chr_dummy",
# Start=c(100,1000,3000,5000),
# End=c(500,1800,4000,5500),
# Strand=c("+","+","-","-"),
# stringsAsFactors=FALSE)
# ann
# fc_SE <- featureCounts("alignResults.BAM",annot.ext=ann)
# fc_SE


###################################################
### code chunk number 5: Rsubread.Rnw:142-144
# ###################################################
# fc_PE <- featureCounts("alignResultsPE.BAM",annot.ext=ann,isPairedEnd=TRUE)
# fc_PE
# 

###################################################
### code chunk number 6: Rsubread.Rnw:164-166

#x <- qualityScores(filename=reads,offset=64,nreads=1000)
#x[1:10,1:10]
###################################################
###################################################
### code chunk number 7: Rsubread.Rnw:191-192
###################################################
#propmapped("alignResults.BAM")

#looking into featurecounts: its a summariations function that assigns 
#mapped reads to genomic features ie genes and promoters
#takes input set of files with read mapping results, annotation file with genomic features
#SAM/bam files
#use getInbuiltAnnotation for hg19 annotation file
#annot.ext[1:5,]
#file <- data.frame(Sample_ID=c("GPB_1","GpB_2","GpA_1","GpA_2","GpA_3","GpA_4","GpA_5","GpA_6"))
#annot.ext = getInBuiltAnnotation(annotation="hg19")
inputmRNA = c("E-MTAB-3805.MockRep1_pA.bam","E-MTAB-3805.MockRep1_totRNA.bam","E-MTAB-3805.MockRep2_pA.bam","E-MTAB-3805.MockRep2_totRNA.bam","E-MTAB-3805.shUNR_Rep1_pA.bam","E-MTAB-3805.shUNR_Rep1_totRNA.bam","E-MTAB-3805.shUNR_Rep2_pA.bam","E-MTAB-3805.shUNR_Rep2_totRNA.bam")
inputRPF = c("E-MTAB-3815.RPF1_KD.bam","E-MTAB-3815.RPF1_Mock.bam","E-MTAB-3815.RPF2_KD.bam","E-MTAB-3815.RPF2_Mock.bam","E-MTAB-3815.RPF3_KD.bam","E-MTAB-3815.RPF3_Mock.bam") 

output <- featureCounts(inputmRNA,annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
write.csv(as.data.frame(output$counts),file="input.featureCounts")

output <- featureCounts(inputRPF,annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
write.csv(as.data.frame(output$counts),file="inputRPF.featureCounts")

# output <- featureCounts(files = E-MTAB-3805.MockRep1_pA.bam, 
#   
#   
#   "E-MTAB-3805.MockRep1_pA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.MockRep1_pA.featureCounts")
# output <- featureCounts("E-MTAB-3805.MockRep1_totRNA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.MockRep1_totRNA.featureCounts")
# output <- featureCounts("E-MTAB-3805.MockRep2_pA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.MockRep2_pA.featureCounts")
# output <- featureCounts("E-MTAB-3805.MockRep2_totRNA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.MockRep2_totRNA.featureCounts")
# output <- featureCounts("E-MTAB-3805.shUNR_Rep1_pA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.shUNR_Rep1_pA.featureCounts")
# output <- featureCounts("E-MTAB-3805.shUNR_Rep1_totRNA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.shUNR_Rep1_totRNA.featureCounts")
# output <- featureCounts("E-MTAB-3805.shUNR_Rep2_pA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.shRNA_Rep2_pA.featureCounts")
# output <- featureCounts("E-MTAB-3805.shUNR_Rep2_totRNA.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,useMetaFeatures=TRUE,strandSpecific = 1,primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3805.shUNR_Rep2_totRNA.featureCounts")
# 
# output <- featureCounts("E-MTAB-3815.RPF1_KD.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3815.RPF1_KD.featureCounts")
# output <- featureCounts("E-MTAB-3815.RPF1_Mock.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3815.RPF1_Mock.featureCounts")
# output <- featureCounts("E-MTAB-3815.RPF2_KD.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3815.RPF2_KD.featureCounts")
# output <- featureCounts("E-MTAB-3815.RPF2_Mock.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3815.RPF2_Mock.featureCounts")
# output <- featureCounts("E-MTAB-3815.RPF3_KD.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3815.RPF3_KD.featureCounts")
# output <- featureCounts("E-MTAB-3815.RPF3_Mock.bam",annot.ext="genes.gtf",isGTFAnnotationFile=TRUE,GTF.featureType="CDS",primaryOnly=TRUE)
# write.csv(as.data.frame(output$counts),file="E-MTAB-3815.RPF3_Mock.featureCounts")
# 

