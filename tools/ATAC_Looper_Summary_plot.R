################################################################################################################
#5/18/17
#Last Updated 6/22/17
#Ryan Corces
#ATAC_Looper_Summary_plot.R
#
#This program is meant to plot multiple summary graphs from the summary table made by the Looper summarize command
#NOTES:
#usage: Rscript /path/to/Rscript/ATAC_Looper_Summary_plot.R /path/to/ATACseq_stats_summary.tsv
#
#requirements: ggplot2
#
################################################################################################
## Load dependencies
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(gplots))
suppressPackageStartupMessages(require(grid))
suppressPackageStartupMessages(require(reshape2))
################################################################################################
#Global Variables

#Minimum TSS score to yield "passing"- This would need to be changed if you used a highly different TSS file
TSS_CUTOFF <- 6

#theme for all plots
alignTheme<-theme(
  plot.background = element_blank(),
  panel.grid.major = element_blank(),
  panel.grid.minor = element_blank(),
  panel.border = element_rect(colour = "black", fill=NA, size=0.5),
  panel.background = element_blank(),
  axis.line = element_blank(),
  axis.text.x = element_text(face = "plain", color = "black", size = 20, hjust = 0.5),
  axis.text.y = element_text(face = "plain", color = "black", size = 20, hjust = 1),
  axis.title.x = element_text(face = "plain", color = "black", size = 22, hjust = 0.5, vjust=0.5),
  axis.title.y = element_text(face = "plain", color = "black", size = 22, hjust = 0.5),
  plot.title = element_text(face="bold", color = "black", size=12, hjust=0.5),
  axis.ticks = element_line(size = 0.5),
  axis.ticks.length = unit(2, "mm"),
  legend.background = element_rect(fill="transparent"),
  legend.text = element_text(size=16),
  legend.title = element_blank()
)

#the colors used for the alignment plots. These colors get altered by the code if certain pre-alignments werent performed
alignColors <- data.frame(Unaligned="gray15",AlphaSat="gray45",Alu="gray60",rDNA="gray75",Repeats="grey90",Mito="#F9655D",Other="royalblue1", stringsAsFactors = FALSE)
################################################################################################
#Functions

#Taken from https://stackoverflow.com/questions/6461209/how-to-round-up-to-the-nearest-10-or-100-or-x
roundUpNice <- function(x, nice=c(1,2,3,4,5,6,7,8,9,10)) {
  if(length(x) != 1) stop("'x' must be of length 1")
  10^floor(log10(x)) * nice[[which(x <= 10^floor(log10(x)) * nice)[[1]]]]
}

#Taken from https://github.com/baptiste/egg/blob/master/R/set_panel_size.r
set_panel_size <- function(p=NULL, g=ggplotGrob(p), file=NULL, 
                           margin = unit(1,"in"),
                           width=unit(4, "in"), 
                           height=unit(4, "in")){
  
  panels <- grep("panel", g$layout$name)
  panel_index_w<- unique(g$layout$l[panels])
  panel_index_h<- unique(g$layout$t[panels])
  nw <- length(panel_index_w)
  nh <- length(panel_index_h)
  
  if(getRversion() < "3.3.0"){
    
    # the following conversion is necessary
    # because there is no `[<-`.unit method
    # so promoting to unit.list allows standard list indexing
    g$widths <- grid:::unit.list(g$widths)
    g$heights <- grid:::unit.list(g$heights)
    
    g$widths[panel_index_w] <-  rep(list(width),  nw)
    g$heights[panel_index_h] <- rep(list(height), nh)
    
  } else {
    
    g$widths[panel_index_w] <-  rep(width,  nw)
    g$heights[panel_index_h] <- rep(height, nh)
    
  }
  
  if(!is.null(file))
    ggsave(file, g, limitsize = FALSE,
           width = convertWidth(sum(g$widths) + margin, 
                                unitTo = "in", valueOnly = TRUE),
           height = convertHeight(sum(g$heights) + margin,  
                                  unitTo = "in", valueOnly = TRUE))
  
  invisible(g)
}

################################################################################################
args <- commandArgs(TRUE)
summaryFile <- args[1]

setwd(dirname(summaryFile))

if (is.null(summaryFile)) {
  # print usage information if summary.tsv file is not provided
  cat("\n Usage: Rscript /path/to/ATAC_Looper_Summary_plot.R /path/to/ATACseq_stats_summary.tsv \n")
}

write(paste("\nGenerating plots in pdf format with ", summaryFile, sep=""), stdout())

#read in stats summary file
stats <- read.delim(summaryFile, header=TRUE, row.names=NULL, as.is=TRUE, check.names=FALSE, sep="\t", quote="")

#Fix absent values in table to zero
stats[is.na(stats)] <- 0
stats[is.null(stats)] <- 0
stats[stats==""] <- 0
stats$Picard_est_lib_size[stats$Picard_est_lib_size=="Unknown"] <- 0
#if pre-alignments were not performed, add columns containing 0 to avoid missing values
#AlphaSat
if (is.null(stats$Aligned_reads_human_alphasat))
{
  stats <- cbind.data.frame(stats,Aligned_reads_human_alphasat=rep(0,nrow(stats)))
  alignColors$AlphaSat <- "white"
}
if (is.null(stats$Alignment_rate_human_alphasat))
{
  stats <- cbind.data.frame(stats,Alignment_rate_human_alphasat=rep(0,nrow(stats)))
}
#rCDRS
if (is.null(stats$Aligned_reads_rCRSd))
{
  stats <- cbind.data.frame(stats,Aligned_reads_rCRSd=rep(0,nrow(stats)))
  alignColors$Mito <- "white"
}
if (is.null(stats$Alignment_rate_rCRSd))
{
  stats <- cbind.data.frame(stats,Alignment_rate_rCRSd=rep(0,nrow(stats)))
}
#Alu
if (is.null(stats$Aligned_reads_human_alu))
{
  stats <- cbind.data.frame(stats,Aligned_reads_human_alu=rep(0,nrow(stats)))
  alignColors$Alu <- "white"
}
if (is.null(stats$Alignment_rate_human_alu))
{
  stats <- cbind.data.frame(stats,Alignment_rate_human_alu=rep(0,nrow(stats)))
}
#rDNA
if (is.null(stats$Aligned_reads_human_rDNA))
{
  stats <- cbind.data.frame(stats,Aligned_reads_human_rDNA=rep(0,nrow(stats)))
  alignColors$rDNA <- "white"
}
if (is.null(stats$Alignment_rate_human_rDNA))
{
  stats <- cbind.data.frame(stats,Alignment_rate_human_rDNA=rep(0,nrow(stats)))
}
#Repeats
if (is.null(stats$Aligned_reads_human_repeats))
{
  stats <- cbind.data.frame(stats,Aligned_reads_human_repeats=rep(0,nrow(stats)))
  alignColors$Repeats <- "white"
}
if (is.null(stats$Alignment_rate_human_repeats))
{
  stats <- cbind.data.frame(stats,Alignment_rate_human_repeats=rep(0,nrow(stats)))
}

################################################################################################
#ALIGN RAW PLOT
alignRaw <- cbind.data.frame(sample=stats$sample_name,
                             Unaligned=(stats$Fastq_reads - stats$Aligned_reads_human_alphasat - stats$Aligned_reads_human_alu - stats$Aligned_reads_human_rDNA - stats$Aligned_reads_human_repeats - stats$Aligned_reads_rCRSd - stats$Aligned_reads),
                             AlphaSat=stats$Aligned_reads_human_alphasat,
                             Alu=stats$Aligned_reads_human_alu,
                             rDNA=stats$Aligned_reads_human_rDNA,
                             Repeats=stats$Aligned_reads_human_repeats,
                             Mito=stats$Aligned_reads_rCRSd,
                             Other=stats$Aligned_reads)

alignRaw$sample <- factor(alignRaw$sample, levels = alignRaw$sample)

meltAlignRaw <- melt (alignRaw, id.vars = "sample")
maxReads <- max(rowSums(alignRaw[,2:ncol(alignRaw)]))
upperLimit <- roundUpNice(maxReads/1000000)
chartHeight = ( length(unique(alignRaw$sample))) * 0.75

alignRawPlot <- ggplot(meltAlignRaw, aes(x = sample, y = as.numeric(value)/1000000)) +
  geom_col(aes(fill = variable), colour="black", size = 0.25, width=0.8) + labs(x = "", y = "Number of reads (M)") +
  scale_x_discrete(limits = rev(levels(meltAlignRaw$sample))) +
  scale_y_continuous(limits = c(0,upperLimit), expand=c(0,0)) +
  scale_fill_manual(values=c(Unaligned=alignColors$Unaligned,AlphaSat=alignColors$AlphaSat,Alu=alignColors$Alu,rDNA=alignColors$rDNA,Repeats=alignColors$Repeats,Mito=alignColors$Mito,Other=alignColors$Other)) +
  # scale_fill_manual(values=c(AlphaSat="gray45",Alu="gray60",rDNA="gray75",Repeats="grey90",Mito="#F9655D",Other="royalblue1")) +
  # scale_fill_manual(values=c(AlphaSat="#02AD74",Alu="#8027AF",rDNA="#F4912F",Repeats="grey78",Mito="#F9655D",Other="royalblue1")) +
  coord_flip() + alignTheme

set_panel_size(alignRawPlot, file=gsub(pattern=".tsv", replacement=".alignmentRaw.pdf", x=summaryFile), width=unit(8,"inches"), height=unit(chartHeight,"inches"))
################################################################################################
#ALIGN PERCENT PLOT
alignPercent <- cbind.data.frame(sample=stats$sample_name,
                                 Unaligned=(100 - stats$Alignment_rate_human_alphasat - stats$Alignment_rate_human_alu - stats$Alignment_rate_human_rDNA - stats$Alignment_rate_human_repeats - stats$Alignment_rate_rCRSd - stats$Alignment_rate),
                                 AlphaSat=stats$Alignment_rate_human_alphasat,
                                 Alu=stats$Alignment_rate_human_alu,
                                 rDNA=stats$Alignment_rate_human_rDNA,
                                 Repeats=stats$Alignment_rate_human_repeats,
                                 Mito=stats$Alignment_rate_rCRSd,
                                 Other=stats$Alignment_rate)
# alignPercent <- cbind.data.frame(Unaligned=(100 - rowSums(alignPercent[,2:ncol(alignPercent)])), alignPercent)
alignPercent$sample <- factor(alignPercent$sample, levels = alignPercent$sample)

meltAlignPercent <- melt (alignPercent, id.vars = "sample")
upperLimit <- 103
chartHeight = ( length(unique(alignPercent$sample))) * 0.75

alignPercentPlot <- ggplot(meltAlignPercent, aes(x = sample, y = as.numeric(value))) +
  geom_col(aes(fill = variable), colour="black", size = 0.25, width=0.8) + labs(x = "", y = "Percent of reads") +
  scale_x_discrete(limits = rev(levels(meltAlignPercent$sample))) +
  scale_y_continuous(limits = c(0,upperLimit), expand=c(0,0)) +
  scale_fill_manual(values=c(Unaligned=alignColors$Unaligned,AlphaSat=alignColors$AlphaSat,Alu=alignColors$Alu,rDNA=alignColors$rDNA,Repeats=alignColors$Repeats,Mito=alignColors$Mito,Other=alignColors$Other)) +
  # scale_fill_manual(values=c(Unaligned="gray30",AlphaSat="gray45",Alu="gray60",rDNA="gray75",Repeats="grey90",Mito="#F9655D",Other="royalblue1")) +
  # scale_fill_manual(values=c(Unaligned="gray28",AlphaSat="#02AD74",Alu="#8027AF",rDNA="#F4912F",Repeats="grey78",Mito="#F9655D",Other="royalblue1")) +
  coord_flip() + alignTheme

set_panel_size(alignPercentPlot, file=gsub(pattern=".tsv", replacement=".alignmentPercent.pdf", x=summaryFile), width=unit(8,"inches"), height=unit(chartHeight,"inches"))
################################################################################################
#TSS PLOT
#establish red/green color scheme
redMin = 0
redMax = TSS_CUTOFF-0.01
redBreaks = seq(redMin,redMax,0.01)
redColors = colorpanel(length(redBreaks), "#AF0000","#E40E00","#FF7A6A")
greenMin = TSS_CUTOFF
greenMax = 30
greenBreaks = seq(greenMin,greenMax,0.01)
greenColors = colorpanel(length(greenBreaks)-1, "#B4E896","#009405","#003B00")
TSScolors <- c(redColors,greenColors)

#Organize data for plotting
TSSscore <- cbind.data.frame(sample=stats$sample_name, TSS=round(stats$TSS_Score, digits = 2), QCcolor=(TSScolors[round(stats$TSS_Score+0.01, digits = 2)*100]))
maxTSS <- max(stats$TSS_Score, na.rm=TRUE)
upperLimit <- roundUpNice(maxTSS)
chartHeight = ( length(unique(TSSscore$sample))) * 0.75

TSSscore$sample <- factor(TSSscore$sample, levels = TSSscore$sample)

TSSPlot <- ggplot(TSSscore, aes(x = sample, y = as.numeric(TSS))) +
  geom_bar(colour="black", size = 0.25, width=0.7, stat="identity", fill = rev(TSSscore$QCcolor)) +
  geom_hline(yintercept = 6, linetype = 2, color = "grey", size = 0.25) +
  labs(x = "", y = "TSS Enrichment Score") +
  scale_x_discrete(limits = rev(TSSscore$sample)) +
  scale_y_continuous(limits = c(0,upperLimit), expand=c(0,0)) +
  coord_flip() + alignTheme

set_panel_size(TSSPlot, file=gsub(pattern=".tsv", replacement=".TSS_Enrichment.pdf", x=summaryFile), width=unit(8,"inches"), height=unit(chartHeight,"inches"))
################################################################################################
#LIBRARY SIZE PLOT
PicardLibSize <- cbind.data.frame(sample=stats$sample_name, LibSize=(as.numeric(stats$Picard_est_lib_size)/1000000))
maxSize <- max(PicardLibSize$LibSize)
upperLimit <- roundUpNice(maxSize)
chartHeight = ( length(unique(PicardLibSize$sample))) * 0.75

PicardLibSize$sample <- factor(PicardLibSize$sample, levels = PicardLibSize$sample)

LibSizePlot <- ggplot(PicardLibSize, aes(x = sample, y = as.numeric(LibSize))) +
  geom_col(colour="black", size = 0.25, width=0.8, fill = "royalblue1") + labs(x = "", y = "Picard Library Size (M)") +
  scale_x_discrete(limits = rev(levels(PicardLibSize$sample))) +
  scale_y_continuous(limits = c(0,upperLimit), expand=c(0,0)) +
  coord_flip() + alignTheme

set_panel_size(LibSizePlot, file=gsub(pattern=".tsv", replacement=".LibSize.pdf", x=summaryFile), width=unit(8,"inches"), height=unit(chartHeight,"inches"))
################################################################################################
