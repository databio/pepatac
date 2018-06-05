###############################################################################
#Last Updated 06/05/18
#Original Author: ?
#Updated by: Jason Smith
#fragment_length_dist.R
#
#This program is meant to plot the fragment length distribution for a sample
#Produces both pdf and png for easy html embedding
#
#NOTES:
#   usage: Rscript /path/to/Rscript/fragment_length_distribution.R 
#          fragL fragL_count fragL_dis1 fragL_dis2
#
#   param fragL: infile containing single column of fragment lengths
#   type fragL: str
#   param fragL_count: counts of each fragment length identified
#   type fragL_count: str
#   param fragL_dis1: pdf filename
#   type fragL_dis1: str
#   param fragL_dis2: fragment length distribution stats file
#   type fragL_dis2: str
#
#requirements: none
#
###############################################################################

args        <- commandArgs(TRUE)
infile      <- args[1]
infile_sort <- args[2]
outfile_pdf <- args[3]
outfile_png <- gsub('pdf', 'png', outfile_pdf)
outfile_txt <- args[4]

dat  <- read.table(infile_sort)
dat1 <- dat[dat$V2<=600,]
tmp  <- seq(1:(dat1[1,2]-1))
dat0 <- data.frame(V1=rep(0,length(tmp)),V2=tmp)
dat2 <- rbind(dat0, dat1)

# Save plot to pdf file
pdf(outfile_pdf)
plot(dat1$V2, dat1$V1, type="l",col=2,lwd=2, xlab="Read length",
     ylab="Read counts", main="Insert size distribution")
     
# Save plot to png file
png(outfile_png)
plot(dat1$V2, dat1$V1, type="l",col=2,lwd=2, xlab="Read length",
     ylab="Read counts", main="Insert size distribution")

invisible(dev.off())

dat  <- read.table(infile)
summ <- data.frame(Min=min(dat$V1), Max=max(dat$V1), Median=median(dat$V1),
                   Mean=mean(dat$V1), Stdev=sd(dat$V1))
# Write summary table to stats file
write.table(summ, file=outfile_txt, row.names=F, quote=F, sep="\t")

###############################################################################
