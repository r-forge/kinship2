library(kinship2)
data <- read.table('ped27_71.txt',
                 col.names=c('famid','id','dadid','momid','sex'))
plist <- with(data, pedigree(id, dadid, momid, sex, famid=famid))
ped71 <- plist['71']
n71 <- length(ped71$id)
plot(ped71, col=rep(1:5, length=n71), status=rep(c(0,0,1), length=n71),
     affected= rep(0:1, length=n71))

plot(plist['27'], cex=.6, )
