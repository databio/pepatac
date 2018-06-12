###############################################################################
#06/04/18
#Last Updated 06/04/18
#Original Author: Jason Smith
#ATAC_Rscript_Runtime_plot.R
#
#This program is meant to plot a comparison of total runtime to a breakdown
#of the runtime for each pipeline subcommand
#
#NOTES:
#usage: Rscript /path/to/Rscript/ATAC_Rscript_Runtime_plot.R 
#       /path/to/ATACseq_profile.tsv
#       --output pdf
#
#requirements: argparser, ggplot2, stringr
#
################################################################################
####                              DEPENDENCIES                              ####
################################################################################
##### LOAD ARGUMENTPARSER #####
if(suppressPackageStartupMessages(!require(argparser))) {
    install.packages("argparser")
}
suppressPackageStartupMessages(library(argparser, quietly=TRUE))

# Create a parser
p <- arg_parser("Produce an ATACseq pipeline (PEPATAC) runtime plot")

# Add command line arguments
p <- add_argument(p, "stats", 
                  help="PEPATAC *_profile.tsv")
p <- add_argument(p, "--output", 
                  help="PNG or PDF",
                  default = "PDF")

# Parse the command line arguments
argv <- parse_args(p)

##### LOAD ADDITIONAL DEPENDENCIES #####
if(suppressPackageStartupMessages(!require(ggplot2))) {
    install.packages("ggplot2")
}
if(suppressPackageStartupMessages(!require(stringr))) {
    install.packages("stringr")
}
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(stringr))

################################################################################
####                               FUNCTIONS                                ####
################################################################################
# Convert Hours:Minutes:Seconds to Seconds 
toSeconds <- function(HMS){
    if (!is.character(HMS)) {
        stop("HMS must be a character string of the form H:M:S")
    }
    if (length(HMS)<=0){
        return(HMS)
    }
    unlist(
        lapply(HMS,
               function(i){
                   i <- as.numeric(strsplit(i,':',fixed=TRUE)[[1]])
                   if      (length(i) == 3) {i[1]*3600 + i[2]*60 + i[3]}
                   else if (length(i) == 2) {i[1]*60 + i[2]}
                   else if (length(i) == 1) {i[1]}
               }))
} 

# Convert seconds back to HMS format
secondsToString <- function(secs, digits=2){
    unlist(
        lapply(secs,
               function(i){
                   # includes fractional seconds
                   fs  <- as.integer(round((i - round(i))*(10^digits)))
                   fmt <- ''
                   if (i >= 3600)    {fmt <- '%H:%M:%S'}
                   else if (i >= 60) {fmt <- '%M:%S'}
                   else              {fmt <- '%OS'}
                   i   <- format(as.POSIXct(strptime("0:0:0","%H:%M:%S")) +
                                 i, format=fmt)
                   if (fs > 0) {sub('[0]+$','',paste(i,fs,sep='.'))}
                   else        {i}
               }))
}

################################################################################
####                               OPEN FILE                                ####
################################################################################
time.file <- argv$stats
setwd(dirname(time.file))

# Get just the first line to get pipeline start time
start.time  <- readLines(time.file, n=1)

# Extract just the starting time timestamp
start.time  <- word(start.time, -1, sep=" ")
# Convert to a time format
#start.time  <- format(as.POSIXct(start.time,format='%H:%M:%OS'),
#                      format='%H:%M:%OS')

# Get the run times for each pipeline command
time.stamps <- read.delim2(time.file, skip=2, header = FALSE, as.is=TRUE)

# Remove leading directory structure
for (i in 1:nrow(time.stamps)) {
    time.stamps[i,1]  <- sub('.*\\/', '', time.stamps[i,1])   
}
time.stamps           <- time.stamps[,-c(2,4)]
colnames(time.stamps) <- c("cmd","time")

time.stamps$time <- toSeconds(time.stamps$time)
total.time       <- sum(time.stamps$time)
finish.time      <- secondsToString(toSeconds(start.time) + total.time)

num.rows <- nrow(time.stamps)
time.stamps[num.rows+1, 1] <- "total.time"
time.stamps[num.rows+1, 2] <- as.character(total.time)

time.stamps$time  <- as.numeric(time.stamps$time)
time.stamps$cmd   <- as.character(time.stamps$cmd)
# Set order for plotting purposes
time.stamps$order <- as.factor(as.numeric(row.names(time.stamps)))

# Create plot
p <- ggplot(data=time.stamps, aes(x=order, y=time)) +
            geom_bar(stat="identity", position=position_dodge())+
            scale_fill_brewer(palette="Paired")+
            theme_minimal() +
            coord_flip() +
            labs(y = paste("Time (s)\n", "[Start: ", start.time, " | ", 
                           "End: ", finish.time, "]", sep=""),
                 x = "PEPATAC Command") +
            scale_x_discrete(labels=time.stamps$cmd) +
            theme(plot.title = element_text(hjust = 0.5))
# real.time=grobTree(textGrob(paste("[Start: ", start.time, " | ", 
#                                   "End: ", finish.time, "]", sep=""),
#                             x=0.720, y=0.04,hjust=0.25,
#                             gp=gpar(col="darkslategray",fontsize=12)))
# p <- p + annotation_custom(real.time)

if (argv$output == "png") {
    png(filename = gsub(pattern="profile.tsv", replacement="Runtime.png",
                        x=time.file), width = 800, height = 550)
    p
} else {
    pdf(file = gsub(pattern="profile.tsv", replacement="Runtime.pdf",
                    x=time.file), width= 8, height = 5.5, useDingbats=F)
    p
}
invisible(dev.off())

write("Completed!\n", stdout())