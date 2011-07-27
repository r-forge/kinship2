data(sample.ped)

affected <- sample.ped$affected - 1
affected[affected < 0] <- NA
sample.ped$affected <- affected

sample.ped2 <- data.frame(sample.ped[c("ped", "id", "father", "mother", "sex", "avail")], affected=affected)



pedAll <- pedigree(sample.ped$id, sample.ped$father, sample.ped$mother, 
       sample.ped$sex, affected=cbind(sample.ped$affected, sample.ped$avail), 
       famid=sample.ped$ped)

ped1 <- pedAll['1']
ped2 <- pedAll['2']
## set 2nd col of affected to NA
ped2$affected[c(7,9),2] <- NA

> ped2$affected
      [,1] [,2]
 [1,]    1    1
 [2,]   NA    0
 [3,]    1    1
 [4,]    0    1
 [5,]   NA    0
 [6,]    1    1
 [7,]    1   NA
 [8,]    0    0
 [9,]    0   NA
[10,]    0    0
[11,]    0    1
[12,]    0    1
[13,]    0    0
[14,]    1    1

pdf("ped2na.pdf")
plot(ped2)
title("sample.ped 2 with 2 affected columns with NA, 0, 1")
dev.off()
