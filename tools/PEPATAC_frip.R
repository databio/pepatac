#! /usr/bin/env Rscript
###############################################################################
#8/13/18
#Last updated: 10/04/18
#Author: Jason Smith
#PEPATAC_frip.R
#
#This program is meant to plot the fraction of reads in regions of interest
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_frip.R
#               sample name
#               /path/to/*_peaks_coverage.bed
#               total_mapped_reads 
#               /path/to/outputFile
#               --bed /path/to/*_coverage.bed file(s)
#
#requirements: argparser, GenomicDistributions, ggplot2
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
argP <- add_argument(argP, "name",
                     help="Sample name")
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
required_libraries <- c("GenomicDistributions", "ggplot2")
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

labels  <- data.frame(xPos=numeric(), yPos=numeric(), name=character(),
                      val=numeric(), color=character(), stringsAsFactors=FALSE)
palette <- colorRampPalette(c("#999999", "#FFC107", "#27C6AB", "#004D40",
                              "#B97BC8", "#009E73", "#C92404", "#E3E550",
                              "#372B4C", "#E3DAC7", "#27CAE6", "#B361BC",
                              "#897779", "#6114F8", "#19C42B", "#56B4E9"))

info    <- file.info(file.path(argv$peaks))
if (file.exists(file.path(argv$peaks)) && info$size != 0) {
    peaks      <- read.table(file.path(argv$peaks))
    peakCov    <- calcFRiP(peaks)
    labels[1,] <- c(0.95*max(log10(peakCov$cumSize)), max(peakCov$frip)+0.001,
                    "Peaks", round(max(peakCov$frip),2), "#FF0703")
    peakCov$feature <- "Peaks"
}  else {
    if (info$size == 0) {
        message("Peak file is empty")
    } else {
        message("Peak file is missing")
    }
}

if (exists("peakCov")) {
    covDF <- peakCov
}

plotColors <- palette(length(argv$bed))

for (i in 1:length(argv$bed)) {
    name <- basename(tools::file_path_sans_ext(argv$bed[i]))
    name <- gsub("_coverage", "", name)
    name <- gsub(argv$name, "", name)
    name <- gsub("^.*?_", "", name)
    if (file.exists(file.path(argv$bed[i])) && info$size != 0) {
        bed     <- read.table(file.path(argv$bed[i]))
    }  else {
        outFile <- file.path(argv$output)
        system2(paste("touch"), outFile)
        quit()
    }
    if (max(bed[,4] > 0)) {
        if (exists("covDF")) {
            covFile <- calcFRiP(bed)
            covFile$feature <- name
            covDF   <- rbind(covDF, covFile)
            labels  <- rbind(labels, c(0.95*max(log10(covFile$cumSize)),
                                       max(covFile$frip)+0.001,
                                       name, round(max(covFile$frip),2),
                                       plotColors[i]))           
        } else {
            covDF         <- calcFRiP(bed)
            covDF$feature <- name
            labels        <- rbind(labels, c(0.95*max(log10(covDF$cumSize)),
                                             max(covDF$frip)+0.001,
                                             name, round(max(covDF$frip),2),
                                             plotColors[i]))
        }
    }
}

# Reorder to make peaks first if they are present
if (exists("covDF")) {
    covDF$feature <- factor(covDF$feature, levels=(labels$name))
}

if (length(argv$bed) == 0 &&
    file.exists(file.path(argv$peaks)) &&
    file.info(file.path(argv$peaks))$size != 0) {
    # Only plot FRiP
    p <- ggplot(covDF, aes(x=numfeats, y=frip,
                           group=feature, color=feature)) +
        geom_line() +
        labs(x="Number of peaks", y="FRiP") +
        #scale_x_continuous(labels = scales::comma) +
        theme_classic() +
        theme(panel.border = element_rect(colour = "black", fill=NA,
                                          size=0.5))
    p <- p + scale_color_manual(labels=paste0(labels$name, ": ", labels$val),
                                values=labels$color) +
             theme(legend.position=c(0.05,0.95),
                   legend.justification=c(0.1,0.9))
} else if (!is.null(argv$bed)) {
    # Produce plot with bed files
    p <- ggplot(covDF, aes(x=log10(cumSize), y=frip,
                           group=feature, color=feature)) +
        geom_line() +
        labs(x="log(number of bases)", y="FRiF") +
        #scale_x_continuous(labels = scales::comma) +
        theme_classic() +
        theme(panel.border = element_rect(colour = "black", fill=NA, size=0.5))
    
    # Recolor and reposition legend
    p <- p + scale_color_manual(labels=paste0(labels$name, ": ", labels$val),
                           values=labels$color) +
             theme(legend.position=c(0.05,0.95),
                   legend.justification=c(0.1,0.9))
} else {
    write("Unable to produce FRiF plot!\n", stdout())
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