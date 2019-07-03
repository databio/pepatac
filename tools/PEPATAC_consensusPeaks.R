#! /usr/bin/env Rscript
###############################################################################
#05/20/2019
#Author: Jason Smith
#PEPATAC_consensusPeaks.R
#
#This program is meant to establish a consensus, reproducible peak set for the
#identified project when called by Looper summarize
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_consensusPeaks.R
#       /path/to/project_config.yaml
#
#requirements: argparser, data.table, pepr
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
p <- arg_parser("Produce consensus, reproducible peak set for project.")

# Add command line arguments
p <- add_argument(p, "config", 
                  help="PEPATAC project_config.yaml")

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("data.table", "pepr")
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
##### FUNCTIONS #####

# Helper function to build a file path to the correct output folder using a
# specified suffix
buildFilePath <- function(suffix, pep=prj) {
    file.path(config(pep)$metadata$output_dir, "summary",
              paste0(config(pep)$name, suffix))
}

# Efficiently split a data.table by a column in the table
# 
# @param  DT Data.table to split
# @param  splitFactor Column to split, which can be a character vector
#         or an integer.
# @return List of data.table objects, split by column
# @examples
#   DT = data.table(letters, grp = rep(c("group1", "group2"), 13))
#   splitDataTable(DT, "grp")
#   splitDataTable(DT, 2)
# @export
splitDataTable = function(DT, splitFactor) {
    if (is.numeric(splitFactor)) {
        splitFactor = colnames(DT)[splitFactor]
        message("Integer splitFactor, changed to: ", splitFactor)
    }
    lapply( split(1:nrow(DT), DT[, get(splitFactor)]), function(x) DT[x])
}

###############################################################################
##### Main #####

# Identify the project configuration file
configFile <- argv$config
prj        <- suppressWarnings(Project(configFile))

# warn about calling on variable width peaks
message("WARNING: PEPATAC_consensusPeaks is designed to produce a consensus peak
         set from *fixed* width peaks generated using the --peak_type fixed
         argument.")

# generate initial peak set
info <- capture.output({ 
  numSamples <- length(samples(prj)$sample_name)
})
peakList   <- data.table(peakFiles = list(numSamples))
genome     <- invisible(config(prj)$implied_attributes[[1]][[1]]$genome)
cPath      <- file.path(paste0(Sys.getenv("GENOMES"),
                        genome, "/",
                        genome, ".chrom.sizes"))
if (file.exists(cPath)) {
    cSize  <- fread(cPath)
    colnames(cSize) <- c("chrom", "size")
} else {
    message("PEPATAC_consensusPeaks.R was unable to load the chromosome sizes file.")
    message(paste0("Confirm that ", cPath, " is present before continuing."))
    quit()
}

# generate paths to peak files
info <- capture.output({ 
  peakList[,peakFiles:=.(list(unique(file.path(config(prj)$metadata$output_dir,
            paste0("results_pipeline/", samples(prj)$sample_name),
            paste0("peak_calling_", genome),
            paste0(samples(prj)$sample_name,
            "_peaks_fixedWidth_normalized.narrowPeak")))))]
})

final <- data.table(chrom=character(),
                    chromStart=integer(),
                    chromEnd=integer(),
                    name=character(),
                    score=numeric(),
                    strand=character(),
                    signalValue=numeric(),
                    pValue=numeric(),
                    qValue=numeric(),
                    peak=integer())

fileList  <- peakList$peakFiles[[1]]

if (length(fileList) > 1) {
    finalList <- character()
    for (i in 1:length(fileList)) {
        if(file.exists(file.path(fileList[i]))) {
            finalList <- append(finalList,fileList[i])
        }
    }
} else if (length(fileList) == 1 ) {
    message("PEPATAC_consensusPeaks.R found only a single peak file.")
    message("Does your project include more than one sample?")
    quit()
} else {
    message("PEPATAC_consensusPeaks.R was unable to find any peak files.")
    message("Check that individual peak files exist for your samples.")
    quit()
}

if (length(finalList) >= 1) {
    # create combined peaks
    peaks           <- rbindlist(lapply(finalList, fread))
    colnames(peaks) <- c("chrom", "chromStart", "chromEnd", "name", "score",
                         "strand", "signalValue", "pValue", "qValue", "peak")
    setkey(peaks, chrom, chromStart, chromEnd)
    # keep highest scored peaks
    hits    <- foverlaps(peaks, peaks,
                         by.x=c("chrom", "chromStart", "chromEnd"),
                         type="any", which=TRUE, nomatch=0)
    scores  <- data.table(index=rep(1:nrow(peaks)), score=peaks$score)
    setkey(hits, xid)
    setkey(scores, index)
    out     <- hits[scores, nomatch=0]
    keep    <- out[out[,.I[which.max(score)],by=yid]$V1]
    indices <- unique(keep$xid)
    final   <- peaks[indices,]
    # trim any bad peaks (extend beyond chromosome)
    # can't be negative
    final[chromStart < 0, chromStart := 0]
    # can't extend past chromosome
    for (i in nrow(cSize)) {
        final[chrom == cSize$chrom[i] & chromEnd > cSize$size[i], chromEnd := cSize$size[i]]
    }

    # identify reproducible peaks
    peakSet <- copy(peaks)
    peakSet[,group := gsub("_peak.*","",name)]
    peakList <- splitDataTable(peakSet, "group")
    original <- copy(final)
    #TODO: find alternative to this for loop
    for (i in 1:length(peakList)) {
        setkey(final, chrom, chromStart, chromEnd)
        setkey(peakList[[i]], chrom, chromStart, chromEnd)
        hits <- foverlaps(peakList[[i]], final, by.x=c("chrom", "chromStart", "chromEnd"), type="any", which=TRUE, nomatch=0)
        # track the number of overlaps of final peak set peaks
        if (i == 1) {
            final[hits$yid, count := 1]
            final[is.na(get("count")), ("count") := 0]
        } else {
            final[hits$yid, count := get("count") + 1] 
        }
    }
    # keep peaks present in 2 or more individual peak sets
    # keep peaks with score per million >= 5
    final <- final[count >= 2 & score >= 5,]
    final[,count := NULL]

    # Produce output directory
    dir.create(
        suppressMessages(file.path(config(prj)$metadata$output_dir, "summary")),
        showWarnings = FALSE)

    if (exists("final")) {
        # save consensus peak set
        fwrite(final, buildFilePath("_consensusPeaks.narrowPeak", prj),
               sep="\t", col.names=FALSE)
    } else {
        message("PEPATAC_consensusPeaks.R failed to produce a consensus peak file.")
        message("Check that individual peak files exist for your samples.")
        quit()
    }
} else {
    message("PEPATAC_consensusPeaks.R was unable to produce a consensus peak file.")
    message("Check that individual peak files exist for your samples.")
    quit()
}

###############################################################################
