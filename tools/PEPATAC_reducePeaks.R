#! /usr/bin/env Rscript
###############################################################################
#05/16/2019
#Author: Jason Smith
#PEPATAC_reducePeaks.R
#
#This program is meant to keep only the most significant non-overlapping
#peaks.  It also trims peaks extending beyond the bounds of the chromosome.
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_reducePeaks.R
#       fixed_width_peaks.narrowPeak
#       <genome>.chrom.sizes
#       output_peaks.narrowPeak
#
#requirements: argparser, data.table
#
###############################################################################

##### LOAD ARGUMENTPARSER #####
loadLibrary <- tryCatch (
    {
        suppressWarnings(suppressPackageStartupMessages(library(argparser)))
    },
    error=function(e) {
        message("Error: Install the \"argparser\"",
                " R package before proceeding.")
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
p <- arg_parser("Keep most significant non-overlapping peaks.")

# Add command line arguments
p <- add_argument(p, "peaks", 
                     help="Peaks (narrowPeak)")
p <- add_argument(p, "chrsize", 
                     help="Chromosome sizes (chrName, chrSize)")
p <- add_argument(p, "output", 
                     help="Output file")

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("data.table")
for (i in required_libraries) {
    loadLibrary <- tryCatch (
        {
            suppressPackageStartupMessages(
                suppressWarnings(library(i, character.only=TRUE)))
        },
        error=function(e) {
            message("Error: Install the \"", i,
                    "\" R package before proceeding.")
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

info <- file.info(file.path(argv$peaks))
if (file.exists(file.path(argv$peaks)) && info$size != 0) {
    peaks <- fread(file.path(argv$peaks))
    colnames(peaks) <- c("chrom", "chromStart", "chromEnd", "name", "score",
                         "strand", "signalValue", "pValue", "qValue", "peak")
    setkey(peaks, chrom, chromStart, chromEnd)
} else {
    if (info$size == 0) {
        message("Peak file is empty.")
    } else {
        message("Peak file is missing.")
    }
}

info <- file.info(file.path(argv$chrsize))
if (file.exists(file.path(argv$chrsize)) && info$size != 0) {
    cSize <- fread(file.path(argv$chrsize))
    colnames(cSize) <- c("chrom", "size")
} else {
    if (info$size == 0) {
        message("Peak file is empty.")
    } else {
        message("Peak file is missing.")
    }
}
    
if (exists("peaks") & exists("cSize")) {
    hits  <- foverlaps(peaks, peaks,
                       by.x=c("chrom", "chromStart", "chromEnd"),
                       type="any", which=TRUE, nomatch=0)
    qVals <- data.table(index=rep(1:nrow(peaks)), qValue=peaks$qValue)
    setkey(hits, xid)
    setkey(qVals, index)
    out     <- hits[qVals, nomatch=0]
    keep    <- out[out[,.I[which.max(qValue)],by=yid]$V1]
    indices <- unique(keep$xid)
    final   <- peaks[indices,]
    # trim any bad peaks (extend beyond chromosome)
    # can't be negative
    final[chromStart < 0, chromStart := 0]
    # can't extend past chromosome
    for (i in nrow(cSize)) {
        final[chrom == cSize$chrom[i] & chromEnd > cSize$size[i], chromEnd := cSize$size[i]]
    }
    # normalize peak scores for cross sample comparison
    final[, score := .(score/(sum(score)/1000000))]
    final[score < 0, score := 0]
    # save final peak set
    fwrite(final, argv$output, sep="\t", col.names=FALSE)
} else {
    message("PEPATAC_reducePeaks.R failed. Check peak and chrom.sizes files.")
}

###############################################################################