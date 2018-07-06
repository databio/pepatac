#! /usr/bin/env Rscript
###############################################################################
#5/18/17
#Last Updated 06/27/2018
#Original Author: Ryan Corces
#Updated by: Jason Smith
#PEPATAC_summarizer.R
#
#This program is meant to plot multiple summary graphs from the summary table 
#made by the Looper summarize command
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_summarizer.R 
#       /path/to/project_config.yaml
#
#requirements: argparser, ggplot2, gplots, grid, data.table, pepr
#
###############################################################################

##### LOAD ARGUMENTPARSER #####
loadLibrary <- tryCatch (
    {
        suppressWarnings(suppressPackageStartupMessages(library(argparser)))
    },
    error=function(e) {
        message("Error: Install the \"argparser\"",
                " library before proceeding.")
        return(NULL)
    },
    warning=function(e) {
        message(e)
        return(TRUE)
    }
)
if (length(loadLibrary)!=0) {
    suppressWarnings(library(argparser))
} else {
    quit()
}

# Create a parser
p <- arg_parser("Produce ATACseq Summary Plots")

# Add command line arguments
p <- add_argument(p, "config", 
                  help="PEPATAC project_config.yaml")

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("ggplot2", "gplots", "grid", "data.table", "pepr")
for (i in required_libraries) {
    loadLibrary <- tryCatch (
        {
            suppressPackageStartupMessages(
                suppressWarnings(library(i, character.only=TRUE)))
        },
        error=function(e) {
            message("Error: Install the \"", i,
                    "\" library before proceeding.")
            return(NULL)
        },
        warning=function(e) {
            message(e)
            return(1)
        }
    )
    if (length(loadLibrary)!=0) {
        suppressWarnings(library(i, character.only=TRUE))
    } else {
        quit()
    }
}

###############################################################################
##### Global Variables #####

# Minimum TSS score to yield "passing"- This would need to be changed if
# you used a highly different TSS file.
TSS_CUTOFF <- 6

# Theme for all plots
alignTheme <- theme(
    plot.background   = element_blank(),
    panel.grid.major  = element_blank(),
    panel.grid.minor  = element_blank(),
    panel.border      = element_rect(colour = "black", fill = NA, size = 0.5),
    panel.background  = element_blank(),
    axis.line         = element_blank(),
    axis.text.x       = element_text(face = "plain", color = "black", 
                                      size = 20, hjust = 0.5),
    axis.text.y       = element_text(face = "plain", color = "black",
                                      size = 20, hjust = 1),
    axis.title.x      = element_text(face = "plain", color = "black", 
                                      size = 22, hjust = 0.5, vjust = 0.5),
    axis.title.y      = element_text(face = "plain", color = "black", 
                                      size = 22, hjust = 0.5),
    plot.title        = element_text(face = "bold", color = "black", 
                                      size = 12, hjust = 0.5),
    axis.ticks        = element_line(size = 0.5),
    axis.ticks.length = unit(2, "mm"),
    legend.background = element_rect(fill = "transparent"),
    legend.text       = element_text(size = 16),
    legend.title      = element_blank()
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
    
    panels        <- grep("panel", g$layout$name)
    panel_index_w <- unique(g$layout$l[panels])
    panel_index_h <- unique(g$layout$t[panels])
    nw            <- length(panel_index_w)
    nh            <- length(panel_index_h)
    
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

# Helper function to build a file path to the correct output folder using a
# specified suffix
buildFilePath <- function(suffix, pep=prj) {
    file.path(config(pep)$metadata$output_dir, "summary",
              paste0(config(pep)$name, suffix))
}

# Return a list of prealignments from the stats_summary.tsv file if they exist
getPrealignments <- function(statsFile) {
    pre <- gsub("Aligned_reads_","",
                unique(grep("Aligned_reads_.*",
                colnames(statsFile), value=TRUE)))
    if (length(pre) > 0) {
        return(pre)
    } else {
        return(NULL)
    }
}

###############################################################################
##### Main #####

# Identify the project configuration file
configFile  <- argv$config
prj         <- suppressWarnings(Project(configFile))

# Build the stats summary file path
summaryFile <- file.path(config(prj)$metadata$output_dir,
                         paste0(config(prj)$name, "_stats_summary.tsv"))

# Produce output directory
dir.create(
    suppressMessages(
        file.path(config(prj)$metadata$output_dir, "summary")),
    showWarnings = FALSE)

# read in stats summary file
if (file.exists(summaryFile)) {
    stats <- suppressWarnings(fread(
        summaryFile, header=TRUE, check.names=FALSE))
} else {
    message("PEPATAC_summarizer.R was unable to find the summary file.")
    quit()
}

# Get prealignments if they exist
prealignments <- getPrealignments(stats)

message("Generating plots in both png and pdf format with ", summaryFile)

# Set absent values in table to zero
stats[is.na(stats)]   <- 0
stats[is.null(stats)] <- 0
stats[stats==""]      <- 0
stats$Picard_est_lib_size[stats$Picard_est_lib_size=="Unknown"] <- 0

###############################################################################
##### ALIGN RAW PLOT #####
Unaligned <- stats$Fastq_reads - stats$Aligned_reads
# If prealignments exist...include in Unaligned reads count
if (!is.null(prealignments)) {
    for (i in 1:length(unlist(prealignments))) {
        Unaligned <- Unaligned - stats[, (paste("Aligned_reads",
                                       unlist(prealignments)[i], sep="_")),
                                       with=FALSE][[1]]
    }
}

alignRaw <- tryCatch(
    {
        data.table(sample = stats$sample_name,
                   Unaligned = as.integer(Unaligned),
                   Duplicates = as.integer(stats$Duplicate_reads))
    },
    error=function(e) {
        message("The summary file values for Unaligned or Duplicate reads",
                " are missing.")
        message("Here's the original error message: ", e)
        return(NULL)
    },
    warning=function(e) {
        message("The summary file contains missing values for the number",
                " of Unaligned or Duplicate_reads.")
        message("Here's the original error message: ", e)
        return(NULL)
    }
)

if (is.null(alignRaw)) {
    quit()
}

# Split counts based on genome name
genomeNames   <- unique(stats$Genome)
for (i in 1:length(genomeNames)) {
    rowPos    <- grep(genomeNames[i], stats$Genome)
    readCount <- rep(0,nrow(stats))
    reads     <- stats$Aligned_reads[stats$Genome==genomeNames[i]]
    for (j in 1:length(reads)) {
        readCount[rowPos[j]] <- reads[j]
    }
    alignRaw[, (genomeNames[i]) := as.integer(readCount)]
}

# If prealignments exist...add to data.table
if (!is.null(prealignments)) {
    for (i in 1:length(unlist(prealignments))) {
        alignRaw[, unlist(prealignments)[i] := as.integer(
           stats[, (paste("Aligned_reads", unlist(prealignments)[i], sep="_")),
           with=FALSE][[1]])]
    }
    setcolorder(alignRaw, c("sample", "Unaligned",
                            paste(unlist(prealignments)),
                            "Duplicates", paste(unique(stats$Genome))))
} else {
    setcolorder(alignRaw, c("sample", "Unaligned", "Duplicates",
                            paste(unique(stats$Genome))))
}

alignRaw$sample <- factor(alignRaw$sample, levels = alignRaw$sample)

meltAlignRaw <- melt(alignRaw, id.vars = "sample")
maxReads     <- max(rowSums(alignRaw[,2:ncol(alignRaw)]))
upperLimit   <- roundUpNice(maxReads/1000000)
chartHeight  <- (length(unique(alignRaw$sample))) * 0.75

plotColors <- data.table(Unaligned="gray15")
if (!is.null(prealignments)) {
    moreColors <- colorpanel(length(unlist(prealignments)),
                             low="#FFE595", mid="#F6CAA6", high="#F6F2A6")
    for (i in 1:length(unlist(prealignments))) {
        plotColors[, unlist(prealignments)[i] := moreColors[i]]
    }
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

# Produce full-size PDF
set_panel_size(
    alignRawPlot,
    file=buildFilePath("_alignmentRaw.pdf", prj),
    width=unit(8,"inches"),
    height=unit(chartHeight,"inches"))

# Produce snap-shot thumbnail PNG for HTML display
# Limit to 25 samples max
if (length(alignRaw$sample) > 25) {
    alignRawThumb <- alignRaw[1:25]
    moreToSee     <- data.frame(t(c("...", rep(0, (ncol(alignRawThumb)-1)))))
    colnames(moreToSee)   <- colnames(alignRawThumb)
    alignRawThumb         <- rbind(alignRawThumb, moreToSee)
    alignRawThumb$sample  <- droplevels(alignRawThumb)$sample
    meltAlignRawThumb     <- melt(alignRawThumb, id.vars="sample")
} else {meltAlignRawThumb <- meltAlignRaw}

chartHeight  <- (length(unique(alignRawThumb$sample))) * 0.75
thumbRawPlot <- (
    ggplot(meltAlignRawThumb, aes(x=sample, y=as.numeric(value)/1000000)) +
        geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) +
        guides(fill=guide_legend(reverse=TRUE)) +
        labs(x="", y="Number of reads (M)") +
        scale_x_discrete(limits=rev(levels(meltAlignRawThumb$sample))) +
        scale_y_continuous(limits=c(0,upperLimit), expand=c(0,0)) +
        scale_fill_manual(values=paste(plotColors)) +
        coord_flip() +
        alignTheme)

set_panel_size(
    thumbRawPlot,
    file=buildFilePath("_alignmentRaw.png", prj),
    width=unit(8,"inches"),
    height=unit(chartHeight,"inches"))

###############################################################################
##### ALIGN PERCENT PLOT #####
Unaligned <- 100 - stats$Alignment_rate
if (!is.null(prealignments)) {
    for (i in 1:length(unlist(prealignments))) {
        Unaligned <- Unaligned - stats[, (paste("Alignment_rate",
                                       unlist(prealignments)[i], sep="_")),
                                       with=FALSE][[1]]
    }
}
# If the pipeline hasn't performed duplicate removal yet, or there are actually
# no duplicates, set the duplicate alignment rate to zero
Duplicates <- list()
for (i in 1:length(stats$Alignment_rate)) {
    if (stats$Dedup_alignment_rate[i] == 0) {
        Duplicates[[i]] <- as.numeric(0)
    } else {
        Duplicates[[i]] <- as.numeric(stats$Alignment_rate[i] -
                                      stats$Dedup_alignment_rate[i])
    }
}

alignPercent <- data.table(sample=stats$sample_name,
                           Unaligned=Unaligned,
                           Duplicates=as.numeric(Duplicates))

# Split percents based on genome name
genomeNames   <- unique(stats$Genome)
for (i in 1:length(genomeNames)) {
    rowPos    <- grep(genomeNames[i], stats$Genome)
    readCount <- rep(0, nrow(stats))
    reads     <- stats$Dedup_alignment_rate[stats$Genome==genomeNames[i]]
    for (j in 1:length(grep('^0', reads))) {
        # If the pipeline has yet to remove duplicates, or there are actually
        # no duplicates, use the Alignment_rate parameter instead
        rowNum        <- grep('^0', reads)[j]
        reads[rowNum] <- stats$Alignment_rate[stats$Genome==genomeNames[i]][rowNum]
    }
    for (k in 1:length(reads)) {
        readCount[rowPos[k]] <- reads[k]
    }
    alignPercent[, (genomeNames[i]) := as.numeric(readCount)]
}

if (!is.null(prealignments)) {
    for (i in 1:length(unlist(prealignments))) {
        alignPercent[, unlist(prealignments)[i] := as.double(
            stats[, (paste("Alignment_rate",
                  unlist(prealignments)[i], sep="_")),
                  with=FALSE][[1]])]
    }
    setcolorder(alignPercent, c("sample", "Unaligned",
                                paste(unlist(prealignments)),
                                "Duplicates", paste(unique(stats$Genome))))
} else {
    setcolorder(alignPercent, c("sample", "Unaligned", "Duplicates",
                                paste(unique(stats$Genome))))
}

alignPercent$sample <- factor(alignPercent$sample, levels=alignPercent$sample)

# Warn user if sample has aberrant values
for (i in 1:nrow(alignPercent)) {
    for (j in 2:ncol(alignPercent)) {
        aberrant <- FALSE
        if (alignPercent[i][[j]] < 0 || alignPercent[i][[j]] > 100) {
            alignPercent[i, j] <- 0
            aberrant <- TRUE
        }
    }
    if (aberrant) {
        message(alignPercent$sample[i], " has aberrant alignment rates.")
        message("Rates have been set to 0.  Check the sample log file.")
    }
}

meltAlignPercent <- melt(alignPercent, id.vars="sample")
upperLimit       <- 103
chartHeight      <- (length(unique(alignPercent$sample))) * 0.75

plotColors <- data.table(Unaligned="gray15")

if (!is.null(prealignments)) {
    moreColors <- colorpanel(length(unlist(prealignments)), 
                             low="#FFE595", mid="#F6CAA6", high="#F6F2A6")
    for (i in 1:length(unlist(prealignments))) {
        plotColors[, unlist(prealignments)[i] := moreColors[i]]
    }
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

# Produce full-size PDF     
set_panel_size(
    alignPercentPlot, 
    file=buildFilePath("_alignmentPercent.pdf", prj), 
    width=unit(8,"inches"), 
    height=unit(chartHeight,"inches"))

# Produce snap-shot thumbnail PNG for HTML display
# Limit to 25 samples max
if (length(alignPercent$sample) > 25) {
    alignPercentThumb <- alignPercent[1:25]
    moreToSee         <- data.frame(t(c("...",
                                    rep(0, (ncol(alignPercentThumb)-1)))))
    colnames(moreToSee)       <- colnames(alignPercentThumb)
    alignPercentThumb         <- rbind(alignPercentThumb, moreToSee)
    alignPercentThumb$sample  <- droplevels(alignPercentThumb)$sample
    meltAlignPercentThumb     <- melt(alignPercentThumb, id.vars="sample")
} else {meltAlignPercentThumb <- meltAlignPercent}

chartHeight      <- (length(unique(alignPercentThumb$sample))) * 0.75
thumbPercentPlot <- (
    ggplot(meltAlignPercentThumb, aes(x=sample, y=as.numeric(value))) +
        geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) + 
        guides(fill=guide_legend(reverse=TRUE)) +
        labs(x="", y="Percent of reads") +
        scale_x_discrete(limits=rev(levels(meltAlignPercentThumb$sample))) +
        scale_y_continuous(limits=c(0,upperLimit), expand=c(0,0)) +
        scale_fill_manual(values=paste(plotColors)) +
        coord_flip() +
        alignTheme)

set_panel_size(
    thumbPercentPlot, 
    file=buildFilePath("_alignmentPercent.png", prj), 
    width=unit(8,"inches"), 
    height=unit(chartHeight,"inches"))

###############################################################################
##### TSS PLOT #####

# Establish red/green color scheme
redMin      <- 0
redMax      <- TSS_CUTOFF-0.01
redBreaks   <- seq(redMin,redMax,0.01)
redColors   <- colorpanel(length(redBreaks), "#AF0000","#E40E00","#FF7A6A")
greenMin    <- TSS_CUTOFF
greenMax    <- 30
greenBreaks <- seq(greenMin,greenMax,0.01)
greenColors <- colorpanel(length(greenBreaks)-1, "#B4E896","#009405","#003B00")
TSScolors   <- c(redColors,greenColors)

# Organize data for plotting
TSSscore <- tryCatch(
    {
        cbind.data.frame(sample=stats$sample_name, 
                         TSS=round(stats$TSS_Score, digits=2),
                         QCcolor=(TSScolors[round(stats$TSS_Score+0.01,
                                                  digits=2)*100]))
    },
    error=function(e) {
        message("The summary file value(s) for the TSS score(s)",
                " is/are missing.")
        message("Here's the original error message: ", e)
        return(NULL)
    },
    warning=function(e) {
        message("The summary file value(s) for the TSS score(s)",
                " is/are incomplete.")
        message("Here's the original warning message: ", e)
        return(NULL)
    }
)

if (is.null(TSSscore)) {
    quit()
}

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

# Produce both PDF and PNG   
set_panel_size(
    TSSPlot, file=buildFilePath("_TSSEnrichment.pdf", prj),
    width=unit(8,"inches"), 
    height=unit(chartHeight,"inches"))

# Produce snap-shot thumbnail PNG for HTML display
# Limit to 25 samples max
if (length(TSSscore$sample) > 25) {
    TSSscoreThumb <- TSSscore[1:25, ]
    chartHeight   <- (length(unique(TSSscoreThumb$sample))) * 0.75
    moreToSee     <- data.frame(t(c("...", "0", "#AF0000")))
    colnames(moreToSee) <- colnames(TSSscoreThumb)
    TSSscoreThumb       <- rbind(TSSscoreThumb, moreToSee)
} else {TSSscoreThumb   <- TSSscore}

TSSPlot <- ggplot(
    TSSscoreThumb, aes(x=sample, y=as.numeric(TSS))) +
    geom_bar(colour="black", size=0.25, width=0.7, stat="identity",
             fill=rev(TSSscoreThumb$QCcolor)) +
    geom_hline(yintercept=6, linetype=2, color="grey", size=0.25) +
    labs(x="", y="TSS Enrichment Score") +
    scale_x_discrete(limits=rev(TSSscoreThumb$sample)) +
    scale_y_continuous(limits=c(0,upperLimit), expand=c(0,0)) +
    coord_flip() +
    alignTheme

set_panel_size(
    TSSPlot, file=buildFilePath("_TSSEnrichment.png", prj),
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
    
    # Produce both PDF and PNG
    set_panel_size(LibSizePlot, 
                   file=buildFilePath("_LibSize.pdf", prj), 
                   width=unit(8,"inches"), 
                   height=unit(chartHeight,"inches"))
    set_panel_size(LibSizePlot, 
                   file=buildFilePath("_LibSize.png", prj), 
                   width=unit(8,"inches"), 
                   height=unit(chartHeight,"inches"))
} else {
    quit()
}

###############################################################################