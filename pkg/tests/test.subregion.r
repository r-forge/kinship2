
### Beth received this bearded-Vulture data 5/18/2011

## it is so dense that you need to plot subregions.

library(kinship2, lib.loc="/people/biostat3/sinnwell/Rdir/library")

d1 <- read.table('/people/biostat4/atkinson/research/kinship/tests/bearded_vulture_R_input.txt',header=T)
d1$sex2 <- 'male'
d1$sex2[d1$sex==2] <- 'female'
d1$sex2[d1$sex==3] <- 'unknown'

fit <- pedigree(id=d1$id,dadid=d1$sire,momid=d1$dam,sex=d1$sex)
pdf('vultureSub.pdf')
#plot(fit)
#plot(fit, subregion=c(1,40,1,2), cex=0.2)
## show lower-left family, in generation 4-5.
plot(fit, subregion=c(1,50,4,5), cex=0.3)
dev.off()

I get an error with subregion:

plot(fit, subregion=c(-2.8,106,0.8,3.3))
Error in subset[3] : object of type 'closure' is not subsettable

