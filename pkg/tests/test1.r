library(kinship2)
# test out subscripting of a pedigreeList

load('../data/breast.rda')

bped <- with(breast, pedigree(id, dadid, momid, sex, famid=family))

ped7 <- with(breast[breast$family==7,], pedigree(id, dadid, momid, sex))
temp <- bped['7']
temp$famid <- NULL
all.equal(temp, ped7)

plot(ped7)




