#! /usr/bin/env Rscript
###############################################################################
#8/13/18
#Last updated: 9/05/18
#Author: Jason Smith
#PEPATAC_frip.R
#
#This program is meant to plot the fraction of reads in regions of interest
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_frip.R
#               /path/to/*_peaks_coverage.bed
#               total_mapped_reads 
#               /path/to/outputFile
#               --bed /path/to/*_coverage.bed file(s)
#
#requirements: argparser, GenomicDistributions, gplots, ggplot2, ggrepel, scales
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
argP <- arg_parser("Produce Fraction of Reads in Features (FRiF) plot(s)")

# Add command line arguments
argP <- add_argument(argP, "peaks", 
                     help="Peak coverage file")
argP <- add_argument(argP, "reads", 
                     help="Number of mapped reads")
argP <- add_argument(argP, "output", 
                     help="Output file")
argP <- add_argument(argP, "--bed", nargs=Inf,
                     help="Additional coverage file(s)")

# Parse the command line arguments
argv <- parse_args(argP)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("GenomicDistributions", "gplots", "ggplot2",
                        "ggrepel", "scales")
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

#### FUNCTIONS ####
calcFRiP <- function(bedFile) {
    colnames(bedFile) <- c("chromosome","start","end","count")
    grObj   <- makeGRangesFromDataFrame(bedFile)
    grObj   <- reduce(grObj)
    redBed  <- data.frame(chromosome=seqnames(grObj),
                          start=start(grObj), end=end(grObj))
    bedFile <- merge(redBed, bedFile, by=c("chromosome","start","end"))
    bedFile <- cbind(bedFile, size=(bedFile$end-bedFile$start))
    bedFile <- bedFile[order(-bedFile$count),]
    bedFile <- bedFile[apply(bedFile != 0, 1, all),]
    bedFile <- cbind(bedFile, cumsum=cumsum(bedFile$count))
    bedFile <- cbind(bedFile, cumSize=cumsum(bedFile$size))
    bedFile <- cbind(bedFile, frip=bedFile$cumsum/as.numeric(argv$reads))
    bedFile <- cbind(bedFile, numfeats=as.numeric(1:nrow(bedFile)))
    return(bedFile)
}

###############################################################################

labels <- data.frame(xPos=numeric(), yPos=numeric(), name=character(),
                     color=character(), stringsAsFactors=FALSE)

info   <- file.info(file.path(argv$peaks))
if (file.exists(file.path(argv$peaks)) && info$size != 0) {
    peaks      <- read.table(file.path(argv$peaks))
    peakCov    <- calcFRiP(peaks)
    labels[1,] <- c(0.95*max(log10(peakCov$cumSize)), max(peakCov$frip)+0.001,
                    paste0("Peaks: ", round(max(peakCov$frip),2)), "red")
    p <- ggplot() +
            geom_line(aes(x=log10(cumSize), y=frip), peakCov,
                      size=0.25, color='red') +
            labs(x="log(number of bases)", y="FRiF") +
            scale_x_continuous(labels = scales::comma) +
            theme_classic()
} else {
    if (info$size == 0) {
        message("Peak file is empty")
    } else {
        message("Peak file is missing")
    }
}

plotColors <- colorpanel(length(argv$bed),
                         low="#4876FF", mid="#94D9CE", high="#7648FF")
                
for (i in 1:length(argv$bed)) {
    name <- basename(tools::file_path_sans_ext(argv$bed[i]))
    name <- gsub("_coverage", "", name)
    name <- gsub("^.*?_", "", name)
    info <- file.info(file.path(argv$bed[i]))
    if (file.exists(file.path(argv$bed[i])) && info$size != 0) {
        bed     <- read.table(file.path(argv$bed[i]))
    } else {
        outFile <- file.path(argv$output)
        system2(paste("touch"), outFile)
        quit()
    }
    if (max(bed[,4] > 0)) {
        covFile <- calcFRiP(bed)
        
        if (exists("p")) {
            p <- p + geom_line(aes(x=log10(cumSize), y=frip), covFile,
                               size=0.25, color=plotColors[i])
            labels  <- rbind(labels,
                             c(0.95*max(log10(covFile$cumSize)),
                               max(covFile$frip)+0.001,
                               paste0(name, ": ", round(max(covFile$frip),2)),
                               plotColors[i]))
        } else {
            p <- ggplot() +
                    geom_line(aes(x=log10(cumSize), y=frip), covFile,
                              size=0.25, color=plotColors[i]) +
                    labs(x="log(number of bases)", y="FRiF") +
                    scale_x_continuous(labels = scales::comma) +
                    theme_classic()
            labels[1,]  <- c(0.95*max(log10(covFile$cumSize)),
                             max(covFile$frip)+0.001,
                             paste0(name, ": ", round(max(covFile$frip),2)),
                             plotColors[i])
        }
    } else {
        message("No reads found within ", gsub("^.*?_", "", name))
    }
}

# Add labels
if (length(argv$bed) == 0 &&
    file.exists(file.path(argv$peaks)) &&
    file.info(file.path(argv$peaks))$size != 0) {
    # Only peaks, plot traditionally
    p <- ggplot() +
            geom_line(aes(x=numfeats, y=frip), peakCov,
                      size=0.25, color='red') +
            labs(x="number of peaks", y="FRiP") +
            scale_x_continuous(labels = scales::comma) +
            theme_classic()
    p <- p + geom_label_repel(aes(x=0.95*max(peakCov$cumSize),
                                  y=max(peakCov$frip)+0.001,
                              label=paste0("Peaks: ",
                                           round(max(peakCov$frip),2)),
                              color="red"))
} else if (exists("p")) {
    p <- p + geom_label_repel(aes(x=as.numeric(xPos), y=as.numeric(yPos)),
                              data=labels, label=labels$name,
                              color=labels$color)
}

if (!exists("p")) {
    p <- ggplot()
}

pdf(file = paste0(tools::file_path_sans_ext(argv$output), ".pdf"),
    width= 7, height = 7, useDingbats=F)
p
invisible(dev.off())
png(filename = paste0(tools::file_path_sans_ext(argv$output), ".png"),
    width = 480, height = 480)
p
invisible(dev.off())

if (exists("p")) {
    if (length(argv$bed) == 0) {
        write("Cumulative FRiP plot completed!\n", stdout())
    } else {
        write("Cumulative FRiF plots completed!\n", stdout())
    }
} else {
    write("Unable to produce FRiF plot!\n", stdout())
}




###############################################################################