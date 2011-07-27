#
# A test pedigree, with odd cross-ties
#  This originally put detph() into an infinite recursion
#
test1 <- data.frame(id  =c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14),
		    mom =c(0, 0, 0, 0, 2, 2, 4, 4, 6,  2,  0,  0, 12, 13),
		    dad =c(0, 0, 0, 0, 1, 1, 3, 3, 3,  7,  0,  0, 11, 10),
		    sex =c(0, 1, 0, 1, 0, 1, 0, 1, 0,  0,  0,  1,  1,  1))

kindepth(test1$id, test1$mom, test1$dad)
kindepth(test1$id, test1$mom, test1$dad, T)

test1.ped <- pedigree(test1$id, dadid=test1$dad, momid=test1$mom, test1$sex)

# Add a spouse with no children, and force them to be plotted
test2 <- rbind(test1,
               data.frame(id= 15, mom=0, dad=0, sex=1))

test2.ped <- pedigree(test2$id, momid=test2$mom, dadid=test2$dad, test2$sex,
                        relation=matrix(c(9,15,4), nrow=1))


#
# Add in a pair of twins, and an inbred marriage
#
test3 <- rbind(test1,
               data.frame(id=c(15,16,17,18,19), mom=c(0,15,15,15,14),
                          dad=c(0,9,9,9,17), sex=c(1, 0,0,1,0)))
test3.ped <- pedigree(test3$id, momid=test3$mom, dadid=test3$dad, test3$sex,
                      relation=matrix(c(16,17,17,18,1,2), nrow=2))
