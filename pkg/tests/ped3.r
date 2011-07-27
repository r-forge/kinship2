library(kinship2)
#
# A killer for drawing, courtesy Curt Oswald (this broke the routines)
#
data3 <- read.table('ped3.txt', header=T)
ped3 <- with(data3, pedigree(id, father.id, mother.id, sex))
plot(ped3, cex=.7, symbolsize=.7)

# rearrange some founders
temp <- 1:nrow(testped1)
temp[76] <- .1
temp[77] <- .2
temp[74] <- .3
temp[60] <- .4
temp[30] <- temp[8] + .1
temp[65] <- temp[4] + .1
temp[14] <- temp[3] + .1
ped3$hints <- autohint(ped3, temp)
plot(ped3, cex=.7)

