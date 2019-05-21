#! /usr/bin/env Rscript
###############################################################################
#3/09/18
#Last Updated 7/16/18
#Jason Smith
#narrowPeakToBigBed.R
#
#This program is meant to convert MACS produced narrowPeak files to 
#bigNarrowPeak (i.e. bigBed) files compatible with UCSC track hubs
#
#NOTES:
#usage: Rscript /path/to/Rscript/narrowPeakToBigBed.R 
#       /path/to/*.narrowPeak /path/to/chrom.sizes /path/to/bedToBigBed
#       /path/to/*.bigBed
#
#requirements: argparser, scales
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
p <- arg_parser("Convert narrowPeak files to bigBed (bigNarrowPeak)")

# Add command line arguments
p <- add_argument(p, "infile",
                  help="Path to narrowPeak file.")
p <- add_argument(p, "chromSizes",
                  help="Genome chromosome sizes file. <Chr> <Size>")
p <- add_argument(p, "bigBed",
                  help="Path to UCSC tool \"bedToBigBed\"")
p <- add_argument(p, "outfile",
                  help="Path to output bigBed (bigNarrowPeak) file.")
p <- add_argument(p, "--keep",
                  help="Choose whether to keep human readable BED files",
                  flag = TRUE)

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("scales")
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

##### Convert narrowPeak files to bigNarrowPeak #####

if (file.exists(file.path(argv$chromSizes))) {
    chromSizes <- read.csv(file.path(argv$chromSizes), sep="\t",
                            header = FALSE,
                            colClasses = c("character", "integer"))
} else {
    errMsg = paste("Could not find: ", file.path(argv$chromSizes), sep = "")
    stop(errMsg)
}

# fileList    <- list.files(path = file.path(argv$infile),
                          # pattern = "*.narrowPeak",
                          # recursive = TRUE)

info = file.info(file.path(argv$infile))
if (file.exists(file.path(argv$infile)) && info$size != 0) {
    np   <- read.csv(file.path(argv$infile), sep="\t",
                     header = FALSE, colClasses = c("character",
                     "integer", "integer", "character", "numeric",
                     "character", "double", "double", "double",
                     "integer"))
} else {
  outFile <- file.path(argv$outfile)
  system2(paste("touch"), outFile)
  quit()
}   

# some 'score' values are greater than 1000 (more than BED format allows); 
# rescale the scores to 0-1000 based on the 99th percentile being 1000
nineNine <- quantile(np$V5, 0.99)
np$V5    <- replace(np$V5, np$V5 > nineNine, nineNine)
np$V5    <- rescale(log(np$V5), to = c(0, 1000))
name     <- unlist(strsplit(basename(argv$infile), split="[.]"))[1]

np <- merge(np, chromSizes, by="V1", sort=FALSE)
colnames(np) <- c("V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11")

# make sure 'chromEnd' positions are not greater than the max chrom.size
for (j in 1:nrow(np)) {
    if (np$V3[j] > np$V11[j]) np$V3[j] <- np$V11[j]
}
np      <- np[,-11]
np$V5   <- as.integer(np$V5)  # ensure score is an integer value
tmpFile <- file.path(dirname(argv$outfile), paste(name, ".bed", sep=""))
asFile  <- file.path(dirname(argv$infile), paste("bigNarrowPeak.as", sep=""))
outFile <- file.path(argv$outfile)

write.table(np, tmpFile, col.names=FALSE, row.names=FALSE,
            quote=FALSE, sep='\t')

cat("table bigNarrowPeak\n", 
    "\"BED6+4 Peaks of signal enrichment based on pooled, normalized (interpreted) data.\"\n",
    "(\n",
    "     string chrom;        \"Reference sequence chromosome or scaffold\"\n",
    "     uint   chromStart;   \"Start position in chromosome\"\n",
    "     uint   chromEnd;     \"End position in chromosome\"\n",
    "     string name;         \"Name given to a region (preferably unique). Use . if no name is assigned\"\n",
    "     uint   score;        \"Indicates how dark the peak will be displayed in the browser (0-1000) \"\n",
    "     char[1]  strand;     \"+ or - or . for unknown\"\n",
    "     float  signalValue;  \"Measurement of average enrichment for the region\"\n",
    "     float  pValue;       \"Statistical significance of signal value (-log10). Set to -1 if not used.\"\n",
    "     float  qValue;       \"Statistical significance with multiple-test correction applied (FDR -log10). Set to -1 if not used.\"\n",
    "     int   peak;          \"Point-source called for this peak; 0-based offset from chromStart. Set to -1 if no point-source called.\"\n",
    ")", sep="", file = asFile)

system2(paste(argv$bigBed),
        args=c(paste("-as=", asFile, sep=""), 
               "-type=bed6+4", tmpFile, argv$chromSizes, outFile, sep=" "))

file.remove(file.path(dirname(argv$infile), "bigNarrowPeak.as"))
if (!argv$keep) file.remove(tmpFile)
