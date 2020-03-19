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
prj <- invisible(suppressWarnings(pepr::Project(pep)))

# Produce output directory (if needed)
dir.create(
    suppressMessages(
        file.path(pepr::config(prj)$metadata$output_dir, "summary")),
    showWarnings = FALSE)

# Produce project summary plots
summarizer_flag <- PEPATACr::summarizer(pep)

# Produce library complexity summary plots
complexity_path <- PEPATACr::buildFilePath("_libComplexity.pdf", prj)
if (!file.exists(complexity_path)) {
    cc <- paste(suppressMessages(pepr::config(prj)$metadata$output_dir),
                "results_pipeline",
                suppressMessages(pepr::samples(prj)$sample_name),
                paste0("QC_", suppressMessages(pepr::samples(prj)$genome)),
                paste0(suppressMessages(pepr::samples(prj)$sample_name),
                       "_preseq_yield.txt"),
                sep="/")
    rc <- paste(suppressMessages(pepr::config(prj)$metadata$output_dir),
                "results_pipeline",
                suppressMessages(pepr::samples(prj)$sample_name),
                paste0("QC_", suppressMessages(pepr::samples(prj)$genome)),
                paste0(suppressMessages(pepr::samples(prj)$sample_name),
                       "_preseq_counts.txt"),
                sep="/")

    hasBoth <- file.exists(cc) & file.exists(rc)
    ccSub   <- cc[hasBoth]
    rcSub   <- rc[hasBoth]
    message(paste0(length(ccSub), " of ", length(cc), " files available"))
    if (sum(hasBoth) > 0){
        p <- PEPATACr::plotComplexityCurves(ccurves = ccSub, coverage = 0,
                                            read_length = 0,
                                            real_counts_path = rcSub,
                                            ignore_unique = FALSE)
        pdf(file = PEPATACr::buildFilePath("_libComplexity.pdf", prj),
            width= 10, height = 7, useDingbats=F)
        suppressWarnings(print(p))
        invisible(dev.off())
        png(filename = PEPATACr::buildFilePath("_libComplexity.png", prj),
            width = 686, height = 480)
        suppressWarnings(print(p))
        invisible(dev.off())
    } else {
        complexity_path <- NULL
        complexity_flag <- FALSE
        message("No samples have available library complexity files.")
    }
    if (!is.null(complexity_path)) {
        if (file.exists(complexity_path)) {
            complexity_flag <- TRUE
        }
    }
} else {
    complexity_flag <- TRUE
}

if (summarizer_flag & complexity_flag) {
    message("Successfully produced project summary plots.\n")
}

# Calculate consensus peaks
consensus_path <- PEPATACr::buildFilePath("_consensusPeaks.narrowPeak", prj)
if (!file.exists(consensus_path)) {
    consensus_path <- PEPATACr::consensusPeaks(pep)
    if (!is.null(consensus_path)) {
        if (file.exists(consensus_path)) {
            message("Consensus peak set: ", consensus_path, "\n")
            icon <- PEPATACr::fileIcon()
            png(filename = PEPATACr::buildFilePath("_consensusPeaks.png", prj),
                height = 275, width=275, bg="transparent")
            suppressWarnings(print(icon))
            invisible(dev.off())
        }
    }
} else {
    message("Consensus peak set: ", consensus_path, "\n")
}

# Create count matrix
counts_path <- PEPATACr::buildFilePath("_peaks_coverage.tsv", prj)
if (!file.exists(counts_path)) {
    counts_path <- PEPATACr::peakCounts(pep)
    if (!is.null(counts_path)) {
        if (file.exists(counts_path)) {
            message("Counts table: ", counts_path, "\n")
            icon <- PEPATACr::fileIcon()
            png(filename = PEPATACr::buildFilePath("_peaks_coverage.png", prj),
                height = 275, width=275, bg="transparent")
            suppressWarnings(print(icon))
            invisible(dev.off())
        }
    }
} else {
   message("Counts table: ", counts_path, "\n")
}

################################################################################