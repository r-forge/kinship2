
#source("setup.s")
#library(Matrix)
#library(quadprog)

#sample.ped <- read.table("../data/sample.ped.tab")

#sample.ped[13,3:4] <- 0


#library(kinship2, lib.loc="/people/biostat3/sinnwell/Rdir/library")
data(sample.ped)
sample.ped[1:20,]

pedAll <- with(sample.ped, pedigree(id=id, dadid=father, momid=mother, 
                sex=sex, famid=ped, relation=matrix(c(113, 114, 4, 1),nrow=1)))


kinAll <- kinship(pedAll)

kinAll[1:20,1:20]
kinAll[40:43, 40:43]

kinAll[42:46, 42:46]
