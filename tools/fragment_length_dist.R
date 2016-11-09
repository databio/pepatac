args <- commandArgs(TRUE)

infile <- args[1]
infile_sort <- args[2]
outfile_pdf <- args[3]
outfile_txt <- args[4]

pdf(outfile_pdf)
dat <- read.table(infile_sort)
dat1 <- dat[dat$V2<=600,]
tmp <- seq(1:(dat1[1,2]-1))
dat0 <- data.frame(V1=rep(0,length(tmp)),V2=tmp)
dat2 <- rbind(dat0, dat1)
plot(dat1$V2, dat1$V1, type="l",col=2,lwd=2, xlab="Read length", ylab="Read counts", main="Insert size distribution")
dev.off()

dat <- read.table(infile)
summ <- data.frame(Min=min(dat$V1), Max=max(dat$V1), Median=median(dat$V1), Mean=mean(dat$V1), Stdev=sd(dat$V1))
write.table(summ, file=outfile_txt, row.names=F, quote=F, sep="\t")
