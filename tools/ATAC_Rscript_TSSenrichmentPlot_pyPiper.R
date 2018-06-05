###############################################################################
#5/18/17
#Last Updated 06/05/18
#Original Author: Ryan Corces
#Updated by: Jason Smith
#ATAC_Rscript_TSSenrichmentPlot_pyPiper.R
#
#This program is meant to plot multiple TSS enrichments on the same graph in R
#Produces both pdf and png for easy html embedding
#
#NOTES:
#usage: Rscript /path/to/Rscript/ATAC_Rscript_TSSenrichmentPlot.R --TSSfile
#       /path/to/file.TssEnrichment
#
#requirements: ggplot2
#
###############################################################################
#Global Variables
# Minimum TSS score to yield "passing" -- 
# This would need to be changed if you used a highly different TSS file
TSS_CUTOFF <- 6 
###############################################################################
## Load dependencies
# suppressPackageStartupMessages(require(optparse))
suppressPackageStartupMessages(require(ggplot2))
###############################################################################
## uses optparse package to read in command line arguments
# option_list <- list(
#   make_option(c("--TSSfile"), action="store", default=NULL),
#   make_option(c("--outputType"), action="store", default="pdf")
# )

# opt = parse_args(OptionParser(option_list=option_list))

args <- commandArgs(TRUE)

TSSfile <- args[1]
#outputType <- args[2]

if (is.null(TSSfile)) {
  # print usage information if .TssEnrichment file is not provided
  cat("\n Usage: Rscript /path/to/ATAC_Rscript_TSSenrichmentPlot.R 
      /path/to/file.TssEnrichment \n
      .TssEnrichment file is required \n\n")
}

#write(paste("\nGenerating TSS plot in ",outputType," format with ",
#            TSSfile, sep=""), stdout())
write(paste("\nGenerating TSS plot in with ", TSSfile, sep=""), stdout())

t1<-theme(
  plot.background  = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.border     = element_rect(colour = "black", fill=NA, size=0.5),
  panel.background = element_blank(),
  axis.line    = element_blank(),
  axis.text.x  = element_text(face = "plain", color = "black",
                              size = 20, hjust = 0.5),
  axis.text.y  = element_text(face = "plain", color = "black",
                              size = 20, hjust = 0.5),
  axis.title.x = element_text(face = "plain", color = "black", size = 22,
                              hjust = 0.5, vjust=0.5),
  axis.title.y = element_text(face = "plain", color = "black", size = 22,
                              hjust = 0.5),
  plot.title   = element_text(face="bold", color = "black", size=12,
                              hjust=0.5),
  legend.position="none",
  axis.ticks.length = unit(2, "mm")
)

insertionsMat <- read.table(TSSfile, header=FALSE, row.names=NULL,
                            as.is=TRUE, check.names=FALSE)
normTSS <- insertionsMat / mean(insertionsMat[1:200,])
colnames(normTSS) <- c("score")
TSSscore <- round(mean(normTSS[1950:2050,]),1)

lineColor <- "red2"
if (TSSscore > TSS_CUTOFF)
{
  lineColor <- "springgreen4"
}

png(filename = gsub(pattern=".TssEnrichment", replacement=".TssEnrichment.png",
                    x=TSSfile), width = 480, height = 480)
pre <- ggplot(normTSS, aes(x=(as.numeric(rownames(normTSS))-2000), y=score,
              group=1, colour="black")) +
              geom_hline(yintercept = 6, linetype = 2,
                         color = "grey", size = 0.25) +
              geom_smooth(method="loess", span=0.02,
                          se=FALSE, colour=lineColor) +
              labs(x = "Distance from TSS (bp)", y = "TSS Enrichment Score")
pre + t1 + scale_x_continuous(expand=c(0,0)) +
    scale_y_continuous(expand=c(0,0)) +
    coord_cartesian(xlim=c(-2300,2300), ylim=c(0,32)) +
    #ylim(0,30) + xlim(-2100,2100) + 
    annotate("rect", xmin=1200, xmax=2300, ymin=27, ymax=32,
             fill="gray95", size = 0.5) +
    annotate("text", x=1750, y=31, label="TSS Score", fontface = 1,
             size=6, hjust=0.5) + 
    annotate("text", x=1750, y=29, label=TSSscore, fontface = 2,
             size=10, hjust=0.5)

pdf(file = gsub(pattern=".TssEnrichment", replacement=".TssEnrichment.pdf",
                x=TSSfile), width= 7, height = 7, useDingbats=F)
pre <- ggplot(normTSS, aes(x=(as.numeric(rownames(normTSS))-2000), y=score,
              group=1, colour="black")) +
              geom_hline(yintercept = 6, linetype = 2,
                         color = "grey", size = 0.25) +
              geom_smooth(method="loess", span=0.02,
                          se=FALSE, colour=lineColor) +
              labs(x = "Distance from TSS (bp)", y = "TSS Enrichment Score")
pre + t1 + scale_x_continuous(expand=c(0,0)) +
    scale_y_continuous(expand=c(0,0)) +
    coord_cartesian(xlim=c(-2300,2300), ylim=c(0,32)) +
    #ylim(0,30) + xlim(-2100,2100) + 
    annotate("rect", xmin=1200, xmax=2300, ymin=27, ymax=32,
             fill="gray95", size = 0.5) +
    annotate("text", x=1750, y=31, label="TSS Score", fontface = 1,
             size=6, hjust=0.5) + 
    annotate("text", x=1750, y=29, label=TSSscore, fontface = 2,
             size=10, hjust=0.5)

invisible(dev.off())

write("Completed!\n", stdout())

###############################################################################
