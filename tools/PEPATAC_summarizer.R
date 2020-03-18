#! /usr/bin/env Rscript
#
# PEPATAC_summarizer.R
#
# Interface to produce project level summary files and reports 
# for ATAC-seq output when called using `looper`
#
# Authors@R: as.person(c(
#    "Jason Smith <jasonsmith@virginia.edu> [aut, cre]", 
#    "Ryan Corces <mcorces@stanford.edu> [aut]"
# ))
#
# Created: 5/18/17
# Last updated: 03/12/2020
#
# usage: Rscript /path/to/Rscript/PEPATAC_summarizer.R 
#        /path/to/project_config.yaml
# Depends: R (>= 3.5.1)
# Imports: PEPATACr, argparser
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
p <- arg_parser("Produce ATAC-seq Summary Reports, Files, and Plots")

# Add command line arguments
p <- add_argument(p, "config", 
                  help="PEPATAC project_config.yaml")

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################
##### LOAD DEPENDENCIES #####
required_libraries <- c("PEPATACr")
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

################################################################################
##### MAIN #####

# Identify the project configuration file
pep <- argv$config
prj <- suppressWarnings(pepr::Project(pep))

# Produce output directory (if needed)
dir.create(
    suppressMessages(
        file.path(pepr::config(prj)$metadata$output_dir, "summary")),
    showWarnings = FALSE)

# Produce project summary plots
summarizerFlag <- PEPATACr::summarizer(pep)

if (summarizerFlag) {
    message("Successfully produced project summary plots.\n")
}

# Calculate consensus peaks
consensusPath <- PEPATACr::buildFilePath("_consensusPeaks.narrowPeak", prj)
if (!file.exists(consensusPath)) {
    consensusPath  <- PEPATACr::consensusPeaks(pep)
    if (!is.null(consensusPath)) {
        if (file.exists(consensusPath)) {
            message("Consensus peak set: ", consensusPath, "\n")
        }
    }
    icon <- PEPATACr::fileIcon()
    png(filename = PEPATACr::buildFilePath("_consensusPeaks.png", prj),
        height = 275, width=275, bg="transparent")
    suppressWarnings(print(icon))
    invisible(dev.off())
} else {
    message("Consensus peak set: ", consensusPath, "\n")
}

# Create count matrix
countsPath <- PEPATACr::buildFilePath("_peaks_coverage.tsv", prj)
if (!file.exists(countsPath)) {
    countsPath  <- PEPATACr::peakCounts(pep)
    if (!is.null(countsPath)) {
        if (file.exists(countsPath)) {
            message("Counts table: ", countsPath, "\n")
        }
    }
    icon <- PEPATACr::fileIcon()
    png(filename = PEPATACr::buildFilePath("_peaks_coverage.png", prj),
        height = 275, width=275, bg="transparent")
    suppressWarnings(print(icon))
    invisible(dev.off())
} else {
   message("Counts table: ", countsPath, "\n")
}

################################################################################