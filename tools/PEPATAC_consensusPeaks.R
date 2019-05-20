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
#       fixed_width_peaks.narrowPeak
#       <genome>.chrom.sizes
#       output_peaks.narrowPeak
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

###############################################################################
##### Main #####

# Identify the project configuration file
configFile  <- argv$config
prj         <- suppressWarnings(Project(configFile))

# allocate data.table
numSamples <- length(samples(prj)$sample_name)  # sample names list
peakList <- data.table(peakFiles = list(numSamples))
genome   <- config(prj)$implied_columns[[1]][[1]]$genome

# generate paths to peak files
peakList[,peakFiles:=.(list(unique(file.path(config(prj)$metadata$output_dir,
                       paste0("results_pipeline/", samples(prj)$sample_name),
                       paste0("peak_calling_", genome),
                       paste0(samples(prj)$sample_name,
                       "_peaks_fixedWidth_normalized.narrowPeak")))))]



setkey(peaks, chrom, chromStart, chromEnd)
hits  <- foverlaps(peaks, peaks,
                       by.x=c("chrom", "chromStart", "chromEnd"),
                       type="any", which=TRUE, nomatch=0)
scores <- data.table(index=rep(1:nrow(peaks)), score=peaks$score)
setkey(hits, xid)
setkey(scores, index)
out     <- hits[scores, nomatch=0]
keep    <- out[out[,.I[which.max(score)],by=xid]$V1]
indices <- unique(keep$yid)
final   <- peaks[indices,]
# trim any bad peaks (extend beyond chromosome)
# can't be negative
final[chromStart < 0, chromStart := 0]
# can't extend past chromosome
for (i in nrow(cSize)) {
    final[chrom == cSize$chrom[i] & chromEnd > cSize$size[i], chromEnd := cSize$size[i]]
}
# save final peak set
fwrite(final, argv$output, sep="\t", col.names=FALSE)

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

###############################################################################
