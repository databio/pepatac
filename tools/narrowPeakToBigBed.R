#! /usr/bin/env Rscript
###############################################################################
#3/09/18
#Last Updated 7/15/18
#Jason Smith
#narrowPeakToBigBed.R
#
#This program is meant to convert MACS produced narrowPeak files to 
#bigNarrowPeak (i.e. bigBed) files compatible with UCSC track hubs
#
#NOTES:
#usage: Rscript /path/to/Rscript/narrowPeakToBigBed.R 
#       /path/to/*.narrowPeak /path/to/chrom.sizes /path/to/bedToBigBed
#       --outdir /path/to/output_directory (default = cwd)
#
#requirements: argparser, dplyr, rescale
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
p <- add_argument(p, "indir",      
                  help="        Parent directory containing narrowPeak files.")
p <- add_argument(p, "chromsizes", 
                  help="Accepts chromosome sizes file. <Chr> <Size>")
p <- add_argument(p, "ucsc",       
                  help="        Path to UCSC tool \"bedToBigBed\"")
p <- add_argument(p, "--outdir",   
                  help="Directory to save bigBed (bigNarrowPeak) files.",
                  default = getwd())
p <- add_argument(p, "--keep",   
                  help="Choose whether to keep human readable BED files",
                  flag = TRUE)

# Parse the command line arguments
argv <- parse_args(p)

###############################################################################

##### LOAD DEPENDENCIES #####
required_libraries <- c("dplyr", "scales")
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

if (file.exists(file.path(argv$chromsizes))) {
    chrom.sizes <- read.csv(file.path(argv$chromsizes), sep="\t",
                            header = FALSE,
                            colClasses = c("character", "integer"))
} else {
    errMsg = paste("Could not find: ", file.path(argv$chromsizes), sep = "")
    stop(errMsg)
}

fileList    <- list.files(path = argv$indir, 
                          pattern = "*.narrowPeak", 
                          recursive = TRUE)

for (i in 1:length(fileList)) {
    info = file.info(file.path(argv$indir, fileList[i]))
    if (file.exists(file.path(argv$indir, fileList[i])) && info$size != 0) {
        np   <- read.csv(file.path(argv$indir, fileList[i]), sep="\t",
                         header = FALSE, colClasses = c("character",
                         "integer", "integer", "character", "integer",
                         "character", "double", "double", "double",
                         "integer"))
    } else {break}   

    # some 'score' values are greater than 1000, 
    # that's more than BED format allows
    nineNine <- quantile(np$V5, 0.99)
    np       <- np %>% mutate(V5 = replace(V5, V5>nineNine, nineNine))
    np$V5    <- rescale(log(np$V5), to = c(0, 1000))
    name     <- unlist(strsplit(basename(fileList[i]), split="[.]"))[1]
    #np <- np %>% mutate(V5=replace(V5, V5>1000, 1000))  # simple fix version
    
    np <- inner_join(np, chrom.sizes, by="V1")
    colnames(np) <- c("V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11")
    
    # some 'chromEnd' positions are greater than the max chrom.size?
    for (j in 1:nrow(np)) {
        if (np$V3[j] > np$V11[j]) np$V3[j] <- np$V11[j]
    }
    np      <- np[,-11]
    np$V5   <- as.integer(np$V5)  # ensure score is an integer value
    tmpFile <- file.path(argv$outdir, paste(name, ".bed", sep=""))
    outName <- file.path(argv$outdir, paste(name, ".bigBed", sep=""))
    
    write.table(np, tmpFile, col.names=FALSE, row.names=FALSE, quote=FALSE)
    
    cat("table bigNarrowPeak\n", 
        "\"BED6+4 Peaks of signal enrichment based on pooled, normalized (interpreted) data.\"\n",
        "(\n",
        "     string chrom;        \"Reference sequence chromosome or scaffold\"\n",
        "     uint   chromStart;   \"Start position in chromosome\"\n",
        "     uint   chromEnd;     \"End position in chromosome\"\n",
        "     string name;	       \"Name given to a region (preferably unique). Use . if no name is assigned\"\n",
        "     uint   score;        \"Indicates how dark the peak will be displayed in the browser (0-1000) \"\n",
        "     char[1]  strand;     \"+ or - or . for unknown\"\n",
        "     float  signalValue;  \"Measurement of average enrichment for the region\"\n",
        "     float  pValue;       \"Statistical significance of signal value (-log10). Set to -1 if not used.\"\n",
        "     float  qValue;       \"Statistical significance with multiple-test correction applied (FDR -log10). Set to -1 if not used.\"\n",
        "     int   peak;          \"Point-source called for this peak; 0-based offset from chromStart. Set to -1 if no point-source called.\"\n",
        ")", sep="", file = file.path(argv$indir, "bigNarrowPeak.as"))
    
    system2(paste(argv$ucsc), 
            args=c(paste("-as=", argv$indir, "bigNarrowPeak.as", sep="/"), 
                   "-type=bed6+4", tmpFile, argv$chromsizes, outName, sep=" "))
    file.remove(file.path(argv$indir, "bigNarrowPeak.as"))
    if (!argv$keep) file.remove(tmpFile)
}