#! /usr/bin/env Rscript
###############################################################################
#8/29/18
#Last updated: 8/31/18
#Author: Jason Smith
#PEPATAC_annotation.R
#
#This program is meant to annotate called peaks or aligned reads by known or
#predicted genomic regions
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_annotation.R
#               /path/to/<genome>_annotations.bed
#               /path/to/*.narrowPeak OR *.bed (requires --reads flag)
#               "sample_name"
#               "genome_name"
#               /path/to/output_dir
#
#requirements: argparser, data.table, GenomicDistributions
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
p <- arg_parser("Produce peak annotation plots")

# Add command line arguments
p <- add_argument(p, "anno",    help="Annotation file")
p <- add_argument(p, "input",   help="Input file to be annotated")
p <- add_argument(p, "sample",  help="Sample name")
p <- add_argument(p, "genome",  help="Genome name")
p <- add_argument(p, "output",  help="Output directory")
p <- add_argument(p, "--reads", help="Annotate aligned reads", flag=TRUE)

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("data.table", "GenomicDistributions")
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

#### Load input file and convert to/ensure it is in BED6 format
inFile          <- fread(file.path(argv$input))
if (ncol(inFile) > 6) {
    inBed       <- inFile[,c(1,2,3,4,5,6)]
} else {inBed   <- inFile}
colnames(inBed) <- c("chromosome", "start", "end", "name", "score", "strand")

#counts <- data.frame(table(inBed$chromosome))

#### Convert to GRanges Object
query  <- makeGRangesFromDataFrame(inBed, keep.extra.columns=TRUE)

#### Chromosome distribution plot
x      <- aggregateOverGenomeBins(query, argv$genome)
gaPlot <- plotGenomeAggregate(x)

if (argv$reads) {
    outName <- "_reads_chr_dist"
} else {outName <- "_peaks_chr_dist"}

pdf(file = file.path(argv$output,
    paste(argv$sample, outName, ".pdf", sep="")),
    width= 7, height = 7, useDingbats=F)
gaPlot
invisible(dev.off())
png(file.path(argv$output,
    paste(argv$sample, outName, ".png", sep="")),
    width = 480, height = 480)
gaPlot
invisible(dev.off())

#### Feature distance distribution plots
TSSDist <- TSSDistance(query, argv$genome)
tssPlot <- plotFeatureDist(TSSDist, featureName="TSS")

if (argv$reads) {
    outName <- "_reads_TSS_dist"
} else {outName <- "_peaks_TSS_dist"}

pdf(file = file.path(argv$output,
    paste(argv$sample, outName, ".pdf", sep="")),
    width= 7, height = 7, useDingbats=F)
tssPlot
invisible(dev.off())
png(file.path(argv$output,
    paste(argv$sample, outName, ".png", sep="")),
    width = 480, height = 480)
tssPlot
invisible(dev.off())

#### Partition distribution plots
knownGenomes <- c('hg19', 'hg38', 'mm9', 'mm10')

fileType <- summary(file(paste0(argv$anno)))$class
if (fileType == "gzfile") {
    annoFile <- fread(sprintf('zcat %s', shQuote(file.path(argv$anno))))
} else {
    annoFile <- fread(file.path(argv$anno))
}
priority <- sapply(unique(annoFile$name), list)
dtList   <- splitDataTable(annoFile, "name")
dtList   <- dtList[names(priority)]
gl       <- GRangesList(lapply(dtList, makeGRangesFromDataFrame))

if (argv$genome %in% knownGenomes) {
    gp   <- suppressWarnings(
                assignPartitions(query, gl, remainder = "Intergenic"))
} else {
    gp   <- suppressWarnings(
                assignPartitions(query, gl, remainder = "Other"))
}
gpPlot   <- plotPartitions(gp)

if (argv$reads) {
    outName <- "_reads_partition_dist"
} else {outName <- "_peaks_partition_dist"}

pdf(file = file.path(argv$output,
    paste(argv$sample, outName, ".pdf", sep="")),
    width= 7, height = 7, useDingbats=F)
gpPlot
invisible(dev.off())
png(file.path(argv$output,
    paste(argv$sample, outName, ".png", sep="")),
    width = 480, height = 480)
gpPlot
invisible(dev.off())

if (argv$reads) {
    write("Read annotation complete!\n", stdout())
} else {
    write("Peak annotation complete!\n", stdout())
}
###############################################################################