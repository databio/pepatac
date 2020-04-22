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
output_dir <- suppressMessages(
    file.path(pepr::config(prj)$looper$output_dir, "summary"))
output_dir <- system(paste0("echo ", output_dir), intern = TRUE)
dir.create(output_dir, showWarnings = FALSE)

# Produce project summary plots
summarizer_flag <- PEPATACr::summarizer(pep)
if (is.null(summarizer_flag)) {
    summarizer_flag <- FALSE
}

# Produce library complexity summary plots
complexity_path <- PEPATACr::buildFilePath("_libComplexity.pdf", prj)
complexity_path <- system(paste0("echo ", complexity_path), intern = TRUE)
if (!file.exists(complexity_path)) {
    cc <- paste(suppressMessages(pepr::config(prj)$looper$output_dir),
                "results_pipeline",
                suppressMessages(pepr::sampleTable(prj)$sample_name),
                paste0("QC_", suppressMessages(pepr::sampleTable(prj)$genome)),
                paste0(suppressMessages(pepr::sampleTable(prj)$sample_name),
                       "_preseq_yield.txt"),
                sep="/")
    cc <- system(paste0("echo ", cc), intern = TRUE)
    rc <- paste(suppressMessages(pepr::config(prj)$looper$output_dir),
                "results_pipeline",
                suppressMessages(pepr::sampleTable(prj)$sample_name),
                paste0("QC_", suppressMessages(pepr::sampleTable(prj)$genome)),
                paste0(suppressMessages(pepr::sampleTable(prj)$sample_name),
                       "_preseq_counts.txt"),
                sep="/")
    rc <- system(paste0("echo ", rc), intern = TRUE)

    hasBoth <- file.exists(cc) & file.exists(rc)
    ccSub   <- cc[hasBoth]
    rcSub   <- rc[hasBoth]
    message(paste0(length(ccSub), " of ", length(cc), " files available"))
    if (sum(hasBoth) > 0){
        p <- PEPATACr::plotComplexityCurves(ccurves = ccSub, coverage = 0,
                                            read_length = 0,
                                            real_counts_path = rcSub,
                                            ignore_unique = FALSE)
        output_file <- PEPATACr::buildFilePath("_libComplexity.pdf", prj)
        output_file <- system(paste0("echo ", output_file), intern = TRUE)
        pdf(file = output_file, width= 10, height = 7, useDingbats=F)
        suppressWarnings(print(p))
        invisible(dev.off())

        output_file <- PEPATACr::buildFilePath("_libComplexity.png", prj)
        output_file <- system(paste0("echo ", output_file), intern = TRUE)
        png(filename = output_file, width = 686, height = 480)
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
consensus_path <- system(paste0("echo ", consensus_path), intern = TRUE)
if (!file.exists(consensus_path)) {
    consensus_path <- PEPATACr::consensusPeaks(pep)
    consensus_path <- system(paste0("echo ", consensus_path), intern = TRUE)
    if (!is.null(consensus_path)) {
        if (file.exists(consensus_path)) {
            message("Consensus peak set: ", consensus_path, "\n")
            icon        <- PEPATACr::fileIcon()
            output_file <- PEPATACr::buildFilePath("_consensusPeaks.png", prj)
            output_file <- system(paste0("echo ", output_file), intern = TRUE)
            png(filename = output_file, height = 275, width=275,
                bg="transparent")
            suppressWarnings(print(icon))
            invisible(dev.off())
        }
    }
} else {
    message("Consensus peak set: ", consensus_path, "\n")
}

# Create count matrix
counts_path <- PEPATACr::buildFilePath("_peaks_coverage.tsv", prj)
counts_path <- system(paste0("echo ", counts_path), intern = TRUE)
if (!file.exists(counts_path)) {
    counts_path <- PEPATACr::peakCounts(pep)
    counts_path <- system(paste0("echo ", counts_path), intern = TRUE)
    if (!is.null(counts_path)) {
        if (file.exists(counts_path)) {
            message("Counts table: ", counts_path, "\n")
            icon <- PEPATACr::fileIcon()
            output_file <- PEPATACr::buildFilePath("_peaks_coverage.png", prj)
            output_file <- system(paste0("echo ", output_file), intern = TRUE)
            png(filename = output_file, height = 275, width=275,
                bg="transparent")
            suppressWarnings(print(icon))
            invisible(dev.off())
        }
    }
} else {
   message("Counts table: ", counts_path, "\n")
}

################################################################################