test1 <- data.frame(id=101:111, 
                    sex=c('m', 'f')[c(1,2,1,2,1, 1,2, 2,1,2, 1)],
                    father=c(0,0,101,101,101, 0,0,106,106,106, 109),
                    mother=c(0,0,102,102,102, 0,0,107,107,107, 104))
temp <-pedigree(test1$id, test1$father, test1$mother, test1$sex)

align.pedigree(temp, hints=list(order=1:11), align=F)

test2 <- data.frame(id=c(1:13, 21:41),
                    dad=c(0,0, 1,1,1, 0,0, 6,6,6, 0, 11,11,
                          0,0,0,0,0,0, 21,21,21,23,23,25, 28,28,28,28, 
                          32,32,32,32,33),
                    mom=c(0,0, 2,2,2, 0,0, 7,7,7, 0, 5, 9, 0,0,0,0,0,0, 
                          22,22,22,24,24,26, 31,31,31,31, 29,29,29,29,13),
                    sex=c(1,2, 1,2,2, 1,2, 1,2,1, 1, 1,2,
                          1,2,1,2,1,2, 1,1,2,2,2,1, 1,1,2,2, 1,2,1,1,2))
ped2 <- pedigree(test2$id, test2$dad, test2$mom, test2$sex)

align.pedigree(ped2, hints=list(order=1:length(test2$id)), align=F)

itemp <- sort(unique(test2$id))
test3 <- data.frame(id=match(test2$id, itemp),
                    dad=match(test2$dad, itemp, nomatch=0),
                    mom=match(test2$mom, itemp, nomatch=0),
                    sex=test2$sex)
ped3 <- pedigree(test3$id, test3$dad, test3$mom, test3$sex)
