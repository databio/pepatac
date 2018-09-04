#! /usr/bin/env Rscript
###############################################################################
#8/13/18
#Last updated: 8/31/18
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
#requirements: argparser, gplots, ggplot2, ggrepel, scales
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
p <- arg_parser("Produce FRiP plot")

# Add command line arguments
p <- add_argument(p, "peaks", 
                  help="Peak coverage file")
p <- add_argument(p, "reads", 
                  help="Number of mapped reads")
p <- add_argument(p, "output", 
                  help="Output file")
p <- add_argument(p, "--bed", nargs=Inf,
                  help="Additional coverage file(s)")

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("gplots", "ggplot2", "ggrepel", "scales")
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
    bedFile <- cbind(bedFile, size=(bedFile$end-bedFile$start))
    bedFile <- bedFile[order(-bedFile$count),]
    bedFile <- cbind(bedFile, cumsum=cumsum(bedFile$count))
    bedFile <- cbind(bedFile, frip=bedFile$cumsum/as.numeric(argv$reads))
    bedFile <- cbind(bedFile, numfeats=as.numeric(1:nrow(bedFile)))
    return(bedFile)
}

###############################################################################

info <- file.info(file.path(argv$peaks))
if (file.exists(file.path(argv$peaks)) && info$size != 0) {
    peaks <- read.table(file.path(argv$peaks))
} else {
	outFile <- file.path(argv$output)
	system2(paste("touch"), outFile)
	quit()
}

peakCov <- calcFRiP(peaks)

plotColors <- colorpanel(length(argv$bed),
                         low="#4876FF", mid="#94D9CE", high="#7648FF")

p <- ggplot() +
        geom_line(aes(x=numfeats, y=frip), peakCov, size=0.25, color='red') +
        labs(x="number of features", y="FRiP") +
        scale_x_continuous(labels = scales::comma) +
        theme_classic()

labels     <- data.frame(xPos=numeric(), yPos=numeric(), name=character(),
                         color=character(), stringsAsFactors=FALSE)
labels[1,] <- c(0.95*max(peakCov$numfeats), max(peakCov$frip)+0.001,
                paste0("Peaks: ", round(max(peakCov$frip),2)), "red")
                
for (i in 1:length(argv$bed)) {
    name <- tools::file_path_sans_ext(argv$bed[i])
    name <- gsub("_coverage", "", name)
    info <- file.info(file.path(argv$bed[i]))
    if (file.exists(file.path(argv$bed[i])) && info$size != 0) {
        bed <- read.table(file.path(argv$bed[i]))
    } else {
        outFile <- file.path(argv$output)
        system2(paste("touch"), outFile)
        quit()
    }
    covFile <- calcFRiP(bed)
    labels  <- rbind(labels, c(0.95*max(covFile$numfeats),
                               max(covFile$frip)+0.001,
                               paste0(name, ": ", round(max(covFile$frip),2)),
                               plotColors[i]))
    p <- p + geom_line(aes(x=numfeats, y=frip), covFile,
                       size=0.25, color=plotColors[i])
}

p <- p + geom_label_repel(aes(x=as.numeric(xPos), y=as.numeric(yPos)),
                          data=labels, label=labels$name, color=labels$color)

pdf(file = paste(tools::file_path_sans_ext(argv$output), ".pdf", sep=""),
    width= 7, height = 7, useDingbats=F)
p 
png(filename = paste(tools::file_path_sans_ext(argv$output), ".png", sep=""),
    width = 480, height = 480)
p
invisible(dev.off())

write("Cumulative FRiP plot completed!\n", stdout())

###############################################################################