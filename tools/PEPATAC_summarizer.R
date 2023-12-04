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
# Last updated: 05/10/2021
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
p <- add_argument(p, arg="config", short="-c",
                  help="PEPATAC project_config.yaml")
p <- add_argument(p, arg="output", short="-o",
                  help="Project parent output directory path")
p <- add_argument(p, arg="results", short="-r",
                  help="Project results output subdirectory path")
p <- add_argument(p, arg="--new-start", short="-N", flag=TRUE,
                  help=paste0("New start mode. This flag will tell the ",
                       "summarizer to start over, and run every command, even ",
                       "if its target output already exists."))
p <- add_argument(p, arg="--skip-consensus", short="-P", flag=TRUE,
                  help=paste0("Do not calculate consensus peaks."))
p <- add_argument(p, arg="--skip-table", short="-T", flag=TRUE,
                  help=paste0("Do not calculate peak counts table."))
p <- add_argument(p, arg="--poverlap", short="-V", flag=TRUE,
                  help=paste0("Calculate the percentage overlap of reads ",
                              "in peaks for the counts table."))
p <- add_argument(p, arg="--normalized", short="-Z", flag=TRUE,
                  help=paste0("Use normalized read counts in peak table."))
p <- add_argument(p, arg="cutoff", short="-m", default=2,
                  help=paste0("Only keep peaks present in at least this ",
                              "number of samples."))
p <- add_argument(p, arg="min-score", short="-s", default=5,
                  help=paste0("A minimum peak score to keep an",
                              " individual peak."))
p <- add_argument(p, arg="min-olap", short="-l", default=1,
                  help=paste0("A minimum number of overlapping bases to",
                              " defined peaks as overlapping."))
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

# Set the project configuration file
pep <- argv$config
# Load the project
prj <- invisible(suppressWarnings(pepr::Project(pep)))
# Convenience
project_name    <- pepr::config(prj)$name
project_samples <- pepr::sampleTable(prj)$sample_name
sample_table    <- data.table::data.table(
    sample_name=pepr::sampleTable(prj)$sample_name,
    genome=pepr::sampleTable(prj)$genome)

# Set the output directory
summary_dir <- suppressMessages(file.path(argv$output, "summary"))
# Produce output directory (if needed)
dir.create(summary_dir, showWarnings = FALSE)

# Get project genomes
genomes <- invisible(suppressWarnings(pepr::sampleTable(prj)$genome))

# Set the results subdirectory
if (dir.exists(argv$results)) {
    results_subdir <- suppressMessages(file.path(argv$results))
} else {
    warning(paste0("The project results subdirectory (", argv$results,
            ") does not exist."))
    quit()
}


# Generate stats summary
# stats  <- PEPATACr::createStatsSummary(project_samples, results_subdir)
# if (nrow(stats) == 0) {
    # quit()
# }
# project_stats_file <- file.path(argv$output,
                                # paste0(project_name, '_stats_summary.tsv'))
# message(sprintf("Summary (n=%s): %s",
        # length(unique(stats$sample_name)), project_stats_file))
# data.table::fwrite(stats, project_stats_file, sep="\t", col.names=TRUE)


# Generate assets
assets <- PEPATACr::createAssetsSummary(project_samples, results_subdir)
if (nrow(assets) == 0) {
    quit()
}
project_assets_file <- file.path(argv$output,
                                 paste0(project_name, '_assets_summary.tsv'))
message(sprintf("Summary (n=%s): %s",
        length(unique(assets$sample_name)), project_assets_file))
data.table::fwrite(assets, project_assets_file, sep="\t", col.names=FALSE)


# Produce project summary plots
summarizer_flag <- PEPATACr::summarizer(prj, argv$output)
if (is.null(summarizer_flag)) {
    summarizer_flag <- FALSE
}


# Produce library complexity summary plots
complexity_path <- file.path(summary_dir,
                             paste0(project_name, "_libComplexity.pdf"))
if (!file.exists(complexity_path) || argv$new_start) {
    cc <- paste(results_subdir,
                suppressMessages(pepr::sampleTable(prj)$sample_name),
                paste0("QC_", suppressMessages(pepr::sampleTable(prj)$genome)),
                paste0(suppressMessages(pepr::sampleTable(prj)$sample_name),
                       "_preseq_yield.txt"),
                sep="/")
    rc <- paste(results_subdir,
                suppressMessages(pepr::sampleTable(prj)$sample_name),
                paste0("QC_", suppressMessages(pepr::sampleTable(prj)$genome)),
                paste0(suppressMessages(pepr::sampleTable(prj)$sample_name),
                       "_preseq_counts.txt"),
                sep="/")

    hasBoth <- file.exists(cc) & file.exists(rc)
    ccSub   <- cc[hasBoth]
    rcSub   <- rc[hasBoth]
    message(paste0(length(ccSub), " of ", length(cc),
            " library complexity files available."))
    if (sum(hasBoth) > 0){
        p <- PEPATACr::plotComplexityCurves(ccurves = ccSub, coverage = 0,
                                            read_length = 0,
                                            real_counts_path = rcSub,
                                            ignore_unique = FALSE)
        output_file <- file.path(summary_dir,
                                 paste0(project_name, "_libComplexity.pdf"))
        pdf(file = output_file, width= 10, height = 7, useDingbats=F)
        suppressWarnings(print(p))
        invisible(dev.off())

        output_file <- file.path(summary_dir,
                                 paste0(project_name, "_libComplexity.png"))
        png(filename = output_file, width = 686, height = 480)
        suppressWarnings(print(p))
        invisible(dev.off())
    } else {
        complexity_path <- NULL
        complexity_flag <- FALSE
        message("No samples have available library complexity files.")
    }
    if (!is.null(complexity_path) && file.exists(complexity_path)) {
        complexity_flag <- TRUE
    }
} else {
    message("Project level library complexity plot already exists.")
    message(paste0("Project library complexity plot: ", complexity_path, "\n"))
    complexity_flag <- TRUE
}

if (summarizer_flag && complexity_flag) {
    message("Successfully produced project summary plots.\n")
}


# Report existing consensus peaks
for (genome in unique(genomes)) {
    file_name      <- paste0("_", genome,"_consensusPeaks.narrowPeak")
    consensus_path <- file.path(summary_dir, paste0(project_name, file_name))
    if (file.exists(consensus_path) && !argv$new_start) {
        message(paste0("Consensus peak set (", genome, "): ",
                       consensus_path, "\n"))
    }
}


# Calculate consensus peaks
if (!file.exists(consensus_path) || argv$new_start && !argv$skip_consensus) {
    #write(paste0("Creating consensus peak set..."), stdout())
    consensus_paths <- PEPATACr::consensusPeaks(sample_table,
                                                summary_dir,
                                                argv$results,
                                                assets,
                                                argv$cutoff,
                                                argv$min_score,
												argv$min_olap)
    if (!length(consensus_paths) == 0) {
        for (consensus_file in consensus_paths) {
            if (file.exists(consensus_file)) {
                message("Consensus peak set: ", consensus_file, "\n")
                icon        <- PEPATACr::fileIcon()
                file_name   <- paste0("_", genome,"_consensusPeaks.png")
                output_file <- file.path(summary_dir,
                                         paste0(project_name, file_name))
                png(filename = output_file, height = 275, width=275,
                    bg="transparent")
                suppressWarnings(print(icon))
                invisible(dev.off())
            }
        }
    }
}


# Report existing counts tables
# TODO: move genome handling out of the called function?
for (genome in unique(genomes)) {
    file_name   <- paste0("_", genome,"_peaks_coverage.tsv")
    counts_path <- file.path(summary_dir, paste0(project_name, file_name))
    if (file.exists(counts_path) && !argv$new_start) {
        message(paste0("Peak counts table (", genome, "): ",
                       counts_path, "\n"))
    }
}


# Create count matrix
if (!file.exists(counts_path) || argv$new_start && !argv$skip_table) {
    sample_table <- data.table::data.table(
        sample_name=pepr::sampleTable(prj)$sample_name,
        genome=pepr::sampleTable(prj)$genome)
    counts_paths <- PEPATACr::peakCounts(sample_table,
                                         summary_dir,
                                         argv$results,
                                         assets,
                                         argv$poverlap,
                                         argv$normalized,
                                         argv$cutoff,
										 argv$min_olap)
    if (!length(counts_paths) == 0) {
        for (counts_table in counts_paths) {
            if (file.exists(counts_table)) {
                message("Counts table: ", counts_table, "\n")
                icon        <- PEPATACr::fileIcon()
                output_file <- file.path(summary_dir,
                    paste0(project_name, "_", genome, "_peaks_coverage.png"))
                png(filename = output_file, height = 275, width=275,
                    bg="transparent")
                suppressWarnings(print(icon))
                invisible(dev.off())
            }
        }
    }
}

################################################################################