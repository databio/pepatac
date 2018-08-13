#! /usr/bin/env Rscript
###############################################################################
#8/13/18
#Author: Jason Smith
#PEPATAC_frip.R
#
#This program is meant to plot the fraction of reads in peaks against the
#number of total peaks.
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_frip.R /path/to/*_coverage.bed 
#               total_mapped_reads /path/to/outputFile
#
#requirements: argparser, ggplot2
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
p <- add_argument(p, "bed", 
                  help="Peak set coverage file")
p <- add_argument(p, "reads", 
                  help="Number of mapped reads")
p <- add_argument(p, "output", 
                  help="Output file")

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("ggplot2")
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

info = file.info(file.path(argv$bed))
if (file.exists(file.path(argv$bed)) && info$size != 0) {
    pepCov   <- read.table(file.path(argv$bed))
} else {
	outFile <- file.path(argv$output)
	system2(paste("touch"), outFile)
	quit()
}

colnames(pepCov) <- c("chromosome","start","end","count")
pepCov <- cbind(pepCov, size=(pepCov$end-pepCov$start))
pepCov <- pepCov[order(-pepCov$count),]
pepCov <- cbind(pepCov, cumsum=cumsum(pepCov$count))
pepCov <- cbind(pepCov, frip=pepCov$cumsum/as.numeric(argv$reads))
pepCov <- cbind(pepCov, numpeaks=as.numeric(1:nrow(pepCov)))

p <- ggplot() +
        geom_line(aes(x=numpeaks, y=frip), pepCov, size=0.25, color='red') +
        labs(x="number of peaks", y="FRiP") +
        geom_label(aes(x=0.9*(max(pepCov$numpeaks)), y=max(pepCov$frip)+0.01),
                   label=round(max(pepCov$frip),2), color='red') + 
        theme_classic()

pdf(file = paste(tools::file_path_sans_ext(argv$output), ".pdf", sep=""),
    width= 7, height = 7, useDingbats=F)
p 
png(filename = paste(tools::file_path_sans_ext(argv$output), ".png", sep=""),
    width = 480, height = 480)
p
invisible(dev.off())

write("FRiP plot completed!\n", stdout())

###############################################################################