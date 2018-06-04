###############################################################################
#5/18/17
#Last Updated 06/04/2018
#Original Author: Ryan Corces
#Updated by: Jason Smith
#ATAC_Looper_Summary_plot.R
#
#This program is meant to plot multiple summary graphs from the summary table 
#made by the Looper summarize command
#
#NOTES:
#usage: Rscript /path/to/Rscript/ATAC_Looper_Summary_plot.R 
#       /path/to/project_config.yaml
#       --pre human_alphasat rCRSd human_alu human_rDNA human_repeats
#
#requirements: argparser, ggplot2, gplots, grid, reshape2, data.table
#
###############################################################################

##### LOAD ARGUMENTPARSER #####
if(suppressPackageStartupMessages(!require(argparser))) {
    install.packages("argparser")
}
suppressPackageStartupMessages(library(argparser, quietly=TRUE))

# Create a parser
p <- arg_parser("Produce ATACseq Summary Plots")

# Add command line arguments
p <- add_argument(p, "config", 
                  help="PEPATAC project_config.yaml")
p <- add_argument(p, "--pre", 
                  help="[OPT] Specify names of prealignments used", nargs=Inf)

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
if(suppressPackageStartupMessages(!require(ggplot2))) {
    install.packages("ggplot2")
}
if(suppressPackageStartupMessages(!require(gplots))) {
    install.packages("gplots")
}
if(suppressPackageStartupMessages(!require(grid))) {
    install.packages("grid")
}
if(suppressPackageStartupMessages(!require(reshape2))) {
    install.packages("reshape2")
}
if(suppressPackageStartupMessages(!require(data.table))) {
    install.packages("data.table")
}
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(gplots))
suppressPackageStartupMessages(library(grid))
suppressPackageStartupMessages(library(reshape2))
suppressPackageStartupMessages(library(data.table))

###############################################################################
##### Global Variables #####

# Minimum TSS score to yield "passing"- This would need to be changed if
# you used a highly different TSS file.
TSS_CUTOFF <- 6

# Theme for all plots
alignTheme<-theme(
    plot.background  = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border     = element_rect(colour = "black", fill=NA, size=0.5),
    panel.background = element_blank(),
    axis.line    = element_blank(),
    axis.text.x  = element_text(face = "plain", color = "black", 
                                size = 20, hjust = 0.5),
    axis.text.y  = element_text(face = "plain", color = "black",
                                size = 20, hjust = 1),
    axis.title.x = element_text(face = "plain", color = "black", 
                                size = 22, hjust = 0.5, vjust=0.5),
    axis.title.y = element_text(face = "plain", color = "black", 
                                size = 22, hjust = 0.5),
    plot.title   = element_text(face="bold", color = "black", 
                                size=12, hjust=0.5),
    axis.ticks   = element_line(size = 0.5),
    axis.ticks.length = unit(2, "mm"),
    legend.background = element_rect(fill="transparent"),
    legend.text  = element_text(size=16),
    legend.title = element_blank()
)

###############################################################################

##### Functions #####

# Taken from https://stackoverflow.com/questions/6461209/how-to-round-up-to-the-nearest-10-or-100-or-x
roundUpNice <- function(x, nice=c(1,2,3,4,5,6,7,8,9,10)) {
    if(length(x) != 1) stop("'x' must be of length 1")
    10^floor(log10(x)) * nice[[which(x <= 10^floor(log10(x)) * nice)[[1]]]]
}

# Taken from https://github.com/baptiste/egg/blob/master/R/set_panel_size.r
set_panel_size <- function(p=NULL, g=ggplotGrob(p), file=NULL, 
                           margin=unit(1, "in"),
                           width=unit(4, "in"), 
                           height=unit(4, "in")){
    
    panels <- grep("panel", g$layout$name)
    panel_index_w <- unique(g$layout$l[panels])
    panel_index_h <- unique(g$layout$t[panels])
    nw <- length(panel_index_w)
    nh <- length(panel_index_h)
    
    if(getRversion() < "3.3.0"){
        
        # the following conversion is necessary
        # because there is no `[<-`.unit method
        # so promoting to unit.list allows standard list indexing
        g$widths  <- grid:::unit.list(g$widths)
        g$heights <- grid:::unit.list(g$heights)
        
        g$widths[panel_index_w]  <- rep(list(width), nw)
        g$heights[panel_index_h] <- rep(list(height), nh)
        
    } else {
        
        g$widths[panel_index_w]  <- rep(width, nw)
        g$heights[panel_index_h] <- rep(height, nh)
        
    }
    
    if(!is.null(file))
        ggsave(file, g, limitsize = FALSE,
               width=convertWidth(sum(g$widths) + margin, 
                                  unitTo="in", valueOnly=TRUE),
               height=convertHeight(sum(g$heights) + margin,  
                                    unitTo="in", valueOnly=TRUE))
    
    invisible(g)
}

###############################################################################

configFile <- argv$config
# read in project_config.yaml file
    configYaml <- fread(configFile, header=TRUE, check.names=FALSE,
                        sep="\t", quote="")
colnames(configYaml) <- "config"

# expand output directory location to identify the stats_summary.tsv file
summaryFile <- system(paste("echo ", paste(gsub("output_dir: ", "",
                      configYaml$config[grep("output_dir", configYaml$config)]),
                      "/*_stats_summary.tsv", sep=""), sep=""), intern=TRUE)
setwd(dirname(summaryFile))

# read in stats summary file
stats <- fread(summaryFile, header=TRUE, check.names=FALSE, sep="\t", quote="")

# get prealignments
if (!is.na(argv$pre)) {
    prealignments <- argv$pre
} else {
    prealignments <- gsub("Aligned_reads_", "",
                          grep("Aligned_reads_.*", colnames(stats),
                          value=TRUE))
}

# confirm the provided prealignments exist in stats_summary.tsv
for (i in 1:length(prealignments)) {
    # get number of prealignments in stats_summary.tsv file
    if(length(grep("Aligned_reads_.*", colnames(stats))) != length(prealignments)){
        cat("\n")
        errorMessage <- paste("There are additional prealignments present in ", 
                              summaryFile, ".  ",
                              "\nConfirm the prealignments you performed.",
                              sep="", collapse="\n")
        stop(errorMessage)
    } else if (!(paste("Aligned_reads", prealignments[i], sep="_") 
                 %in% colnames(stats))) {
        errorMessage <- paste(prealignments[i],  
                              " is not present in ", summaryFile, ".  ",
                              "\nConfirm the prealignments you performed.",
                              sep="", collapse="\n")
        stop(errorMessage)
    }
}

write(paste("\nGenerating plots in pdf format with ", 
            summaryFile, "\n", sep=""), stdout())

# Set absent values in table to zero
stats[is.na(stats)]   <- 0
stats[is.null(stats)] <- 0
stats[stats==""]      <- 0
stats$Picard_est_lib_size[stats$Picard_est_lib_size=="Unknown"] <- 0

###############################################################################

##### ALIGN RAW PLOT #####
Unaligned <- stats$Fastq_reads - stats$Aligned_reads
for (i in 1:length(prealignments)) {
    Unaligned <- Unaligned - 
        stats[, (paste("Aligned_reads", prealignments[i], sep="_")),
              with=FALSE][[1]]
}
alignRaw <- data.table(sample = stats$sample_name,
                       Unaligned = Unaligned,
                       Duplicates = as.integer(stats$Duplicate_reads))

# Split counts based on genome name
genomeNames <- unique(stats$Genome)
for (i in 1:length(genomeNames)) {
    rowPos    <- grep(genomeNames[i], stats$Genome)
    readCount <- rep(0,nrow(stats))
    reads     <- stats$Aligned_reads[stats$Genome==genomeNames[i]]
    for (j in 1:length(reads)) {
        readCount[rowPos[j]] <- reads[j]
    }
    alignRaw[, (genomeNames[i]) := as.integer(readCount)]
}

for (i in 1:length(prealignments)) {
    alignRaw[, (prealignments[i]) := 
                 stats[, (paste("Aligned_reads", prealignments[i], sep="_")),
                       with=FALSE][[1]]]
}

setcolorder(alignRaw, c("sample", "Unaligned", paste(prealignments),
                        "Duplicates", paste(unique(stats$Genome))))

alignRaw$sample <- factor(alignRaw$sample, levels = alignRaw$sample)

meltAlignRaw <- melt(alignRaw, id.vars = "sample")
maxReads     <- max(rowSums(alignRaw[,2:ncol(alignRaw)]))
upperLimit   <- roundUpNice(maxReads/1000000)
chartHeight  <- (length(unique(alignRaw$sample))) * 0.75

plotColors <- data.table(Unaligned="gray15")
moreColors <- colorpanel(length(prealignments), 
                         low="#FFE595", mid="#F6CAA6", high="#F6F2A6")
for (i in 1:length(prealignments)) {
    plotColors[, (prealignments[i]) := moreColors[i]]
}
plotColors[, Duplicates := "#FC1E25"]
moreColors <- colorpanel(length(genomeNames), 
                         low="#4876FF", mid="#94D9CE", high="#7648FF")
for (i in 1:length(genomeNames)) {
    plotColors[, (genomeNames[i]) := moreColors[i]]
}

alignRawPlot <- (
    ggplot(meltAlignRaw, aes(x=sample, y=as.numeric(value)/1000000)) +
        geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) + 
        guides(fill=guide_legend(reverse=TRUE)) +
        labs(x="", y="Number of reads (M)") +
        scale_x_discrete(limits=rev(levels(meltAlignRaw$sample))) +
        scale_y_continuous(limits=c(0,upperLimit), expand=c(0,0)) +
        scale_fill_manual(values=paste(plotColors)) +
        coord_flip() + 
        alignTheme)

set_panel_size(
    alignRawPlot, 
    file=gsub(pattern=".tsv", replacement=".alignmentRaw.pdf", x=summaryFile), 
    width=unit(8,"inches"), 
    height=unit(chartHeight,"inches"))

###############################################################################

##### ALIGN PERCENT PLOT #####
Unaligned <- 100 - stats$Alignment_rate
for (i in 1:length(prealignments)) {
    Unaligned <- Unaligned - 
        stats[, (paste("Alignment_rate", prealignments[i], sep="_")),
              with=FALSE][[1]]
}
alignPercent <- data.table(sample=stats$sample_name,
                           Unaligned=Unaligned,
                           Duplicates=stats$Alignment_rate - 
                               stats$Dedup_alignment_rate)

# Split percents based on genome name
genomeNames <- unique(stats$Genome)
for (i in 1:length(genomeNames)) {
    rowPos    <- grep(genomeNames[i], stats$Genome)
    readCount <- rep(0,nrow(stats))
    reads     <- stats$Dedup_alignment_rate[stats$Genome==genomeNames[i]]
    for (j in 1:length(reads)) {
        readCount[rowPos[j]] <- reads[j]
    }
    alignPercent[, (genomeNames[i]) := as.numeric(readCount)]
}
for (i in 1:length(prealignments)) {
    alignPercent[, 
                 (prealignments[i]) := 
                     stats[, (paste("Alignment_rate", prealignments[i],
                                    sep="_")), 
                           with=FALSE][[1]]]
}

setcolorder(alignPercent, c("sample", "Unaligned", paste(prealignments),
                            "Duplicates", paste(unique(stats$Genome))))

alignPercent$sample <- factor(alignPercent$sample, levels=alignPercent$sample)

meltAlignPercent <- melt(alignPercent, id.vars="sample")
upperLimit       <- 103
chartHeight      <- (length(unique(alignPercent$sample))) * 0.75

plotColors <- data.table(Unaligned="gray15")
moreColors <- colorpanel(length(prealignments), 
                         low="#FFE595", mid="#F6CAA6", high="#F6F2A6")
for (i in 1:length(prealignments)) {
    plotColors[, (prealignments[i]) := moreColors[i]]
}
plotColors[, Duplicates := "#FC1E25"]
moreColors <- colorpanel(length(genomeNames), 
                         low="#4876FF", mid="#94D9CE", high="#7648FF")
for (i in 1:length(genomeNames)) {
    plotColors[, (genomeNames[i]) := moreColors[i]]
}

alignPercentPlot <- (
    ggplot(meltAlignPercent, aes(x=sample, y=as.numeric(value))) +
        geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) + 
        guides(fill=guide_legend(reverse=TRUE)) +
        labs(x="", y="Percent of reads") +
        scale_x_discrete(limits=rev(levels(meltAlignPercent$sample))) +
        scale_y_continuous(limits=c(0,upperLimit), expand=c(0,0)) +
        scale_fill_manual(values=paste(plotColors)) +
        coord_flip() + 
        alignTheme)

set_panel_size(
    alignPercentPlot, 
    file=gsub(pattern=".tsv", replacement=".alignmentPercent.pdf", 
              x=summaryFile), 
    width=unit(8,"inches"), 
    height=unit(chartHeight,"inches"))


###############################################################################

##### TSS PLOT #####
#establish red/green color scheme
redMin <- 0
redMax <- TSS_CUTOFF-0.01
redBreaks <- seq(redMin,redMax,0.01)
redColors <- colorpanel(length(redBreaks), "#AF0000","#E40E00","#FF7A6A")
greenMin  <- TSS_CUTOFF
greenMax  <- 30
greenBreaks <- seq(greenMin,greenMax,0.01)
greenColors <- colorpanel(length(greenBreaks)-1, "#B4E896","#009405","#003B00")
TSScolors   <- c(redColors,greenColors)

#Organize data for plotting
TSSscore    <- cbind.data.frame(sample=stats$sample_name, 
                                TSS=round(stats$TSS_Score, digits=2), 
                                QCcolor=(TSScolors[round(stats$TSS_Score+0.01, 
                                                         digits=2)*100]))
maxTSS      <- max(stats$TSS_Score, na.rm=TRUE)
upperLimit  <- roundUpNice(maxTSS)
chartHeight <- (length(unique(TSSscore$sample))) * 0.75

TSSscore$sample <- factor(TSSscore$sample, levels=TSSscore$sample)

TSSPlot <- ggplot(
    TSSscore, aes(x=sample, y=as.numeric(TSS))) +
    geom_bar(colour="black", size=0.25, width=0.7, stat="identity", 
             fill=rev(TSSscore$QCcolor)) +
    geom_hline(yintercept=6, linetype=2, color="grey", size=0.25) +
    labs(x="", y="TSS Enrichment Score") +
    scale_x_discrete(limits=rev(TSSscore$sample)) +
    scale_y_continuous(limits=c(0,upperLimit), expand=c(0,0)) +
    coord_flip() + 
    alignTheme

set_panel_size(
    TSSPlot, file=gsub(pattern=".tsv", replacement=".TSS_Enrichment.pdf", 
                       x=summaryFile), 
    width=unit(8,"inches"), 
    height=unit(chartHeight,"inches"))

###############################################################################

##### LIBRARY SIZE PLOT #####
if (any(!is.na(stats$Picard_est_lib_size))) {
    PicardLibSize <- cbind.data.frame(
        sample=stats$sample_name, 
        LibSize=(as.numeric(stats$Picard_est_lib_size)/1000000))
    maxSize       <- max(PicardLibSize$LibSize)
    upperLimit    <- roundUpNice(maxSize)
    chartHeight   <- (length(unique(PicardLibSize$sample))) * 0.75
    
    PicardLibSize$sample <- factor(PicardLibSize$sample, 
                                   levels = PicardLibSize$sample)
    
    LibSizePlot <- ggplot(PicardLibSize, 
                          aes(x = sample, y = as.numeric(LibSize))) +
        geom_col(colour="black", size = 0.25, width=0.8, 
                 fill = "royalblue1") + 
        labs(x = "", y = "Picard Library Size (M)") +
        scale_x_discrete(limits = rev(levels(PicardLibSize$sample))) +
        scale_y_continuous(limits = c(0,upperLimit), expand=c(0,0)) +
        coord_flip() + 
        alignTheme
    
    set_panel_size(LibSizePlot, 
                   file=gsub(pattern=".tsv", replacement=".LibSize.pdf", 
                             x=summaryFile), 
                   width=unit(8,"inches"), 
                   height=unit(chartHeight,"inches"))
} else {
    quit()
}

###############################################################################