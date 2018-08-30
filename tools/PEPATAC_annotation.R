#! /usr/bin/env Rscript
###############################################################################
#8/29/18
#Author: Jason Smith
#PEPATAC_annotation.R
#
#This program is meant to annotate called peaks by known or predicted regions
#
#NOTES:
#usage: Rscript /path/to/Rscript/PEPATAC_annotation.R
#               /path/to/<genome>_annotations.bed
#               /path/to/<sample_name>_peaks.narrowPeak
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
p <- add_argument(p, "anno",   help="Annotation file")
p <- add_argument(p, "peaks",  help="Called peaks file")
p <- add_argument(p, "sample", help="Sample name")
p <- add_argument(p, "genome", help="Genome name")
p <- add_argument(p, "output", help="Output directory")

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

#### Load peaks file and convert to BED6 format
peaks            <- read.table(argv$peaks)
pepBed           <- peaks[,c(1,2,3,4,5,6)]
colnames(pepBed) <- c("chromosome", "start", "end", "name", "score", "strand")

#peak_counts <- data.frame(table(peaks$chromosome))

#### Convert to GRanges Object
query  <- makeGRangesFromDataFrame(pepBed, keep.extra.columns=TRUE)

#### Chromosome distribution plot
x      <- aggregateOverGenomeBins(query, argv$genome)
gaPlot <- plotGenomeAggregate(x)

pdf(file = file.path(argv$output,
    paste(argv$sample, "_chr_distribution.pdf", sep="")),
    width= 7, height = 7, useDingbats=F)
gaPlot
invisible(dev.off())
png(file.path(argv$output,
    paste(argv$sample, "_chr_distribution.png", sep="")),
    width = 480, height = 480)
gaPlot
invisible(dev.off())

#### Feature distance distribution plots
TSSDist <- TSSDistance(query, argv$genome)
tssPlot <- plotFeatureDist(TSSDist, featureName="TSS")

pdf(file = file.path(argv$output,
    paste(argv$sample, "_distance_TSS.pdf", sep="")),
    width= 7, height = 7, useDingbats=F)
tssPlot
invisible(dev.off())
png(file.path(argv$output,
    paste(argv$sample, "_distance_TSS.png", sep="")),
    width = 480, height = 480)
tssPlot
invisible(dev.off())

#### Partition distribution plots
knownGenomes <- c('hg19', 'hg38', 'mm9', 'mm10')

annoFile <- fread(file.path(argv$anno))
priority <- sapply(unique(annoFile$feature), list)
dtList   <- splitDataTable(annoFile, "feature")
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

pdf(file = file.path(argv$output,
    paste(argv$sample, "_partition_distribution.pdf", sep="")),
    width= 7, height = 7, useDingbats=F)
gpPlot
invisible(dev.off())
png(file.path(argv$output,
    paste(argv$sample, "_partition_distribution.png", sep="")),
    width = 480, height = 480)
gpPlot
invisible(dev.off())

write("Peak annotation complete!\n", stdout())
###############################################################################