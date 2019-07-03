# PACKAGE DOCUMENTATION
#' PEPPRO R tools (PEPATACr)
#'
#'
#' PEPATACr is a collection of functions to generate QC and analysis plots
#' for ATAC-seq data analysis.
#'
#' @docType package
#' @name PEPATACr
#' @author Jason Smith
#'
#' @references \url{http://github.com/databio/pepatac}
NULL

################################################################################
# FUNCTIONS

#' Calculate the Fraction of Reads in Features (FRiF)
#'
#' This function calculates the fraction of reads in a feature and returns
#' a modified BED file with the cumulative sum of reads, cumulative size
#' of covered features, the fraction of reads in those features, and the
#' number of total features.
#'
#' @param BED_file A BED format file
#' @param reads Number of aligned reads
#' @keywords FRiF
#' @examples
#' calcFRiF()
calcFRiF <- function(BED_file, reads) {
    colnames(BED_file) <- c("chromosome","start","end","count")
    grObj   <- makeGRangesFromDataFrame(BED_file)
    grObj   <- reduce(grObj)
    redBed  <- data.frame(chromosome=seqnames(grObj),
                          start=start(grObj), end=end(grObj))
    BED_file <- merge(redBed, BED_file, by=c("chromosome","start","end"))
    BED_file <- cbind(BED_file, size=(BED_file$end-BED_file$start))
    BED_file <- BED_file[order(-BED_file$count),]
    BED_file <- BED_file[apply(BED_file != 0, 1, all),]
    BED_file <- cbind(BED_file, cumsum=cumsum(BED_file$count))
    BED_file <- cbind(BED_file, cumSize=cumsum(BED_file$size))
    BED_file <- cbind(BED_file, frip=BED_file$cumsum/as.numeric(reads))
    BED_file <- cbind(BED_file, numfeats=as.numeric(1:nrow(BED_file)))
    return(BED_file)
}


#' Plot Fraction of Reads in Features (FRiF)
#'
#' This function plots the fraction of reads in a set of features
#' and produces pdf/png output files.
#'
#' @param sample_name Name of sample
#' @param num_reads Number of aligned reads in sample
#' @param output_name Output file name
#' @param BED_file A BED format file
#' @keywords FRiP FRiF BED
#' @export
#' @examples
#' data("promoter")
#' data("promoter_flanking")
#' data("exon")
#' data("intron")
#' data("utr3")
#' data("utr5")
#' plotFRiF(sample_name="example", num_reads=87520,
#'          output_name="example_frif.pdf",
#'          BED_file = c("promoter", "promoter_flanking", "exon",
#'                      "intron", "utr3", "utr5"))
#' @export
plotFRiF <- function(sample_name, num_reads, output_name, BED_file) {
    labels  <- data.frame(xPos=numeric(), yPos=numeric(), name=character(),
                          val=numeric(), color=character(),
                          stringsAsFactors=FALSE)
    palette <- colorRampPalette(c("#999999", "#FFC107", "#27C6AB", "#004D40",
                                  "#B97BC8", "#009E73", "#C92404", "#E3E550",
                                  "#372B4C", "#E3DAC7", "#27CAE6", "#B361BC",
                                  "#897779", "#6114F8", "#19C42B", "#56B4E9"))
    plot_col   <- palette(length(BED_file))
    if (!exists(BED_file[1])) {
        info   <- file.info(file.path(BED_file[1]))
    }
    name       <- sample_name

    if (exists(BED_file[1])) {
        bed        <- get(BED_file[1])
        BED_cov    <- calcFRiF(bed, num_reads)
        name       <- BED_file[1]
        labels[1,] <- c(0.95*max(log10(BED_cov$cumSize)),
                        max(BED_cov$frip)+0.001, name,
                        round(max(BED_cov$frip),2), "#FF0703")
        BED_cov$feature <- name
    } else if (file.exists(file.path(BED_file[1])) && info$size != 0) {
        bed        <- read.table(file.path(BED_file[1]))
        BED_cov    <- calcFRiF(bed, num_reads)
        name       <- basename(tools::file_path_sans_ext(BED_file[1]))
        name       <- gsub(sample_name, "", name)
        name       <- gsub("^.*?_", "", name)
        num_fields <- 2
        for(i in 1:num_fields) name <- gsub("_[^_]*$", "", name)
        labels[1,] <- c(0.95*max(log10(BED_cov$cumSize)),
                        max(BED_cov$frip)+0.001, name,
                        round(max(BED_cov$frip),2), "#FF0703")
        BED_cov$feature <- name
    }  else {
        if (is.na(info[1])) {
            message(paste0(name, " coverage file is missing"))
        } else if (info$size == 0) {
            message(paste0(name, " coverage file is empty"))
        } else {
            message(paste0(name, " coverage file is missing"))
        }
    }

    if (exists("BED_cov")) {
        cov_df <- BED_cov
    }

    if (length(BED_file) > 1) {
        for (i in 2:length(BED_file)) {
            if (exists(BED_file[i])) {
                name       <- BED_file[i]
            } else {
                info       <- file.info(file.path(BED_file[i]))
                name       <- basename(tools::file_path_sans_ext(BED_file[i]))
                name       <- gsub(sample_name, "", name)
                name       <- gsub("^.*?_", "", name)
                num_fields <- 2
                for(j in 1:num_fields) name <- gsub("_[^_]*$", "", name)
            }

            if (exists(BED_file[i])) {
                bed      <- get(BED_file[i])
            } else if (file.exists(file.path(BED_file[i])) && info$size != 0) {
                bed      <- read.table(file.path(BED_file[i]))
            } else {
                out_file <- file.path(output_name)
                system2(paste("touch"), out_file)
                quit()
            }

            if (max(bed[,4] > 0)) {
                if (exists("cov_df")) {
                    cov_file         <- calcFRiF(bed, num_reads)
                    cov_file$feature <- name
                    cov_df <- rbind(cov_df, cov_file)
                    labels <- rbind(labels, c(0.95*max(log10(cov_file$cumSize)),
                                              max(cov_file$frip)+0.001,
                                              name, round(max(cov_file$frip),2),
                                              plot_col[i]))
                } else {
                    cov_df         <- calcFRiF(bed, num_reads)
                    cov_df$feature <- name
                    labels         <- rbind(labels,
                                            c(0.95*max(log10(cov_df$cumSize)),
                                              max(cov_df$frip)+0.001,
                                              name, round(max(cov_df$frip),2),
                                              plot_col[i]))
                }
            }
        }
    }

    # Reorder by labels
    if (exists("cov_df")) {
        cov_df$feature <- factor(cov_df$feature, levels=(labels$name))
    }

    if (!is.null(BED_file)) {
        # Produce plot with bed files
        p <- ggplot(cov_df, aes(x=log10(cumSize), y=frip,
                               group=feature, color=feature)) +
            geom_line() +
            labs(x="log(number of bases)", y="FRiF") +
            theme_classic() +
            theme(panel.border = element_rect(colour = "black",
                                              fill=NA,
                                              size=0.5))

        # Recolor and reposition legend
        p <- p + scale_color_manual(labels=paste0(labels$name, ": ",
                                                  labels$val),
                                    values=labels$color) +
                 theme(legend.position=c(0.05,0.95),
                       legend.justification=c(0.1,0.9))
    } else {
        write("Unable to produce FRiF plot!\n", stdout())
    }

    if (!exists("p")) {
        p <- ggplot()
    }

    pdf(file = paste0(tools::file_path_sans_ext(output_name), ".pdf"),
        width= 7, height = 7, useDingbats=F)
    print(p)
    invisible(dev.off())

    png(filename = paste0(tools::file_path_sans_ext(output_name), ".png"),
        width = 480, height = 480)
    print(p)
    invisible(dev.off())

    if (exists("p")) {
        write("Cumulative FRiF plot completed!\n", stdout())
    } else {
        write("Unable to produce FRiF plot!\n", stdout())
    }
}


#' Plot TSS enrichment
#'
#' This function plots the global TSS enrichment and produces pdf/png files.
#'
#' @param TSS_file TSS enrichment file
#' @keywords TSS enrichment
#' @export
#' @examples
#' data("tss")
#' plotTSS(TSS_file = "TSS_file")
#' @export
plotTSS <- function(TSS_file) {
    if (length(TSS_file) == 1) {
        write(paste0("\nGenerating TSS plot with ", TSS_file), stdout())
    } else {
        if (length(TSS_file) == 2) {
            write(paste0("\nGenerating TSS plot with ",
                         paste(TSS_file, collapse=" and ")),
                  stdout())
        } else {
            write(paste0("\nNot sure how to merge the following: ",
                         paste(TSS_file, collapse=", ")),
                  stdout())
            write(paste0("Did you mean to pass more than 2 files?"), stdout())
            quit()
        }
    }

    t1 <- theme(
        plot.background  = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border     = element_rect(colour = "black", fill=NA, size=0.5),
        panel.background = element_blank(),
        axis.line    = element_blank(),
        axis.text.x  = element_text(face = "plain", color = "black",
                                    size = 20, hjust = 0.5),
        axis.text.y  = element_text(face = "plain", color = "black",
                                    size = 20, hjust = 0.5),
        axis.title.x = element_text(face = "plain", color = "black", size = 22,
                                    hjust = 0.5, vjust=0.5),
        axis.title.y = element_text(face = "plain", color = "black", size = 22,
                                    hjust = 0.5),
        plot.title   = element_text(face="bold", color = "black", size=12,
                                    hjust=0.5),
        legend.position="none",
        axis.ticks.length = unit(2, "mm")
    )

    iMat <- data.table(V1 = numeric())
    if (length(TSS_file) == 1) {
        if (exists(TSS_file[i])) {
            iMat <- data.table(get(TSS_file))
        } else {
            iMat <- fread(TSS_file)
        }
    } else if (length(TSS_file) == 2) {
        for (i in 1:length(TSS_file)) {
            if (exists(TSS_file[i])) {
                if (i == 1) {
                    iMat <- data.table(get(TSS_file[i]))
                } else {
                    iMat <- list(iMat, data.table(get(TSS_file[i])))
                }
            } else {
                if (i == 1) {
                    iMat <- fread(TSS_file[i])
                } else {
                    iMat <- list(iMat, fread(TSS_file[i]))
                }
            }
        }
    } else {
        write(paste0("\nNot sure how to merge the following: ",
                     paste(TSS_file, collapse=", ")),
              stdout())
        write(paste0("Did you mean to pass more than 2 files?"), stdout())
        quit()
    }

    if (length(TSS_file) == 1) {
        plus_minus <- iMat
    } else {
        plus       <- iMat[[1]]
        minus      <- iMat[[2]]
    }

    if (exists("plus_minus")) {
        val       <- 0.05*nrow(plus_minus)
        #norm_TSS  <- (plus_minus / mean(plus_minus[c(1:val,
        #            (nrow(plus_minus)-val):nrow(plus_minus)), V1]))
        norm_TSS           <- plus_minus / mean(plus_minus[c(1:val), V1])
        colnames(norm_TSS) <- c("score")
        peak_pos  <- which.max(norm_TSS$score)
        TSS_score <- round(mean(norm_TSS[(max(0, peak_pos-50)):(min(nrow(norm_TSS),
                           peak_pos+50)), score]),1)
        if (is.nan(TSS_score)) {
            message(paste0("\nNaN produced.  Check ", TSS_file, "\n"))
            quit()
        }
    } else {
        val       <- 0.05*nrow(plus)
        #norm_TSS  <- (plus / mean(plus[c(1:val,
        #            (nrow(plus)-val):nrow(plus)), V1]))
        norm_TSS           <- plus / mean(plus[c(1:val), V1])
        colnames(norm_TSS) <- c("score")
        peak_pos  <- which.max(norm_TSS$score)
        TSS_score <- round(mean(norm_TSS[(max(0, peak_pos-50)):(min(nrow(norm_TSS),
                           peak_pos+50)), score]),1)
        if (is.nan(TSS_score)) {
            message(paste0("\nNaN produced.  Check ", TSS_file[1], "\n"))
            quit()
        }
    }
    
    line_col <- "red2"
    if (TSS_score > TSS_CUTOFF)
    {
        line_col <- "springgreen4"
    }

    # name        <- basename(tools::file_path_sans_ext(TSS_file[1]))
    # num_fields  <- 2
    # for(j in 1:num_fields) name <- gsub("_[^_]*$", "", name)
    # sample_name <- paste(dirname(TSS_file[1]), name, sep="/")
    sample_name <- sampleName(TSS_file[1])

    pre <- ggplot(norm_TSS, aes(x=(as.numeric(rownames(norm_TSS))-
                                 (nrow(norm_TSS)/2)),
                               y=score, group=1, colour="black")) +
        geom_hline(yintercept = 6, linetype = 2,
                   color = "grey", size = 0.25) +
        geom_smooth(method="loess", span=0.02,
                    se=FALSE, colour=line_col) +
        labs(x = "Distance from TSS (bp)", y = "TSS Enrichment Score")
    p <- pre + t1 +
         scale_x_continuous(expand=c(0,0)) +
         scale_y_continuous(expand=c(0,0)) +
         coord_cartesian(xlim=c(-2300,2300), ylim=c(0,32))
    if (exists("minus")) {
        val      <- 0.025*nrow(minus)
        # norm_TSS  <- (minus / mean(minus[c(1:val,
        #             (nrow(minus)-val):nrow(minus)), V1]))
        minus_norm_TSS           <- minus / mean(minus[c(1:val), V1])
        colnames(minus_norm_TSS) <- c("score")
        peak_pos        <- which.max(minus_norm_TSS$score)
        minus_TSS_score <- round(
            mean(minus_norm_TSS[(max(0, peak_pos-50)):(min(nrow(norm_TSS),
                               peak_pos+50)), score]),1)
        if (is.nan(minus_TSS_score)) {
            message(paste0("\nNaN produced.  Check ", TSS_file[2], "\n"))
            quit()
        }
        p <- p + geom_smooth(data=minus_norm_TSS,
                             aes(x=(as.numeric(rownames(minus_norm_TSS))-
                                   (nrow(norm_TSS)/2)),
                                 y=score, group=1, colour="black"),
                             method="loess", span=0.02,
                             se=FALSE, colour="blue") +
                 annotate("rect", xmin=1200, xmax=2300, ymin=25, ymax=32,
                          fill="gray95", size = 0.5) +
                 annotate("text", x=1750, y=31, label="TSS Score", fontface = 1,
                          size=6, hjust=0.5) +
                 annotate("text", x=1500, y=29, label="+", fontface = 2,
                          size=8, hjust=0.5, color=line_col) +
                 annotate("text", x=1500, y=27, label=TSS_score, fontface = 2,
                          size=8, hjust=0.5, color=line_col) +
                 annotate("text", x=2000, y=29, label="-",
                          fontface = 2, size=8, hjust=0.5, color="blue") +
                 annotate("text", x=2000, y=27, label=minus_TSS_score,
                          fontface = 2, size=8, hjust=0.5, color="blue")
    } else {
        p <- p + annotate("rect", xmin=1200, xmax=2300, ymin=27, ymax=32,
                          fill="gray95", size = 0.5) +
                 annotate("text", x=1750, y=31, label="TSS Score",
                          fontface = 1, size=6, hjust=0.5) +
                 annotate("text", x=1750, y=29, label=TSS_score, fontface = 2,
                          size=10, hjust=0.5)
    }

    png(filename = paste0(sample_name, "_TSS_enrichment.png"),
        width = 480, height = 480)
    print(p)
    invisible(dev.off())

    pdf(file = paste0(sample_name, "_TSS_enrichment.pdf"),
        width= 7, height = 7, useDingbats=F)
    print(p)
    invisible(dev.off())

    write("Completed TSS enrichment plot!\n", stdout())
}


#' Plot fragment length distribution
#'
#' This function plots the fragment length distribution of a paired-end sample
#' and produces pdf/png files.
#'
#' @param fragL infile containing single column of fragment lengths
#' @param fragL_count counts of each fragment length identified
#' @param fragL_dis1 pdf filename
#' @param ragL_dis2 fragment length distribution stats file
#' @keywords fragment distribution
#' @export
#' @examples
#' data("fragL")
#' data("fragL_count")
#' plotFLD(fragL = "fragL", fragL_count = "fragL_count",
#'         fragL_dis1 = "fragLenDistribution_example.pdf",
#'         fragL_dis2 = "fragLenDistribution_example.txt")
#' @export
plotFLD <- function(fragL, fragL_count,
                    fragL_dis1="fragLenDistribution.pdf",
                    fragL_dis2="fragLenDistribution.txt") {

    outfile_png <- gsub('pdf', 'png', fragL_dis1)

    dat  <- fread(fragL_count)
    dat1 <- dat[dat$V2<=600,]
    tmp  <- seq(1:as.numeric(dat1[1,2]-1))
    dat0 <- data.table(V1=rep(0,length(tmp)),V2=tmp)
    dat2 <- rbind(dat0, dat1)

    t1 = theme_classic(base_size=14) +
         theme(axis.line = element_line(size = 0.5)) +
         theme(panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               legend.position = "none",
               aspect.ratio = 1,
               panel.border = element_rect(colour = "black",
                                          fill=NA, size=0.5)) +
         theme(plot.title = element_text(hjust = 0.5))

    p <- ggplot(dat1, aes(x=V2, y=V1)) +
             geom_line(aes(color='red')) +
             xlab("Read length") + 
             ylab("Read counts") +
             ggtitle("Insert size distribution") +
             t1

    # Save plot to pdf file
    pdf(file=fragL_dis1, width= 7, height = 7, useDingbats=F)
    print(p)
    invisible(dev.off())
         
    # Save plot to png file
    png(filename=outfile_png, width = 480, height = 480)
    print(p)
    invisible(dev.off())

    dat  <- fread(fragL)
    summ <- data.table(Min=min(dat$V1), Max=max(dat$V1), Median=median(dat$V1),
                       Mean=mean(dat$V1), Stdev=sd(dat$V1))
    # Write summary table to stats file
    fwrite(summ, file=fragL_dis2, row.names=F, quote=F, sep="\t")
}


#' Efficiently split a data.table by a column in the table
#' 
#' @param  DT Data.table to split
#' @param  split_factor Column to split, which can be a character vector
#'         or an integer.
#' @return List of data.table objects, split by column
#' @examples
#'   DT = data.table(letters, grp = rep(c("group1", "group2"), 13))
#'   splitDataTable(DT, "grp")
#'   splitDataTable(DT, 2)
#' @export
splitDataTable = function(DT, split_factor) {
	if (is.numeric(split_factor)) {
		split_factor = colnames(DT)[split_factor]
		message("Integer split_factor, changed to: ", split_factor)
	}
	lapply( split(1:nrow(DT), DT[, get(split_factor)]), function(x) DT[x])
}


#' Assign the filetype to a variable and make sure we close the connection
#'
#' @param path A path to a file for which you wish to determine its class
filetype <- function(path){
    f = file(path)
    ext = summary(f)$class
    close.connection(f)
    ext
}


#' Derive the sample name from input file and return with full path
#'
#' @param path A path to a file for which you wish to extract the sample name
#' @param num_fields An integer representing the number of fields to strip
#' @param delim A delimiter for the fields splitting a path or string
sampleName <- function(path, num_fields=2, delim='_') {
    name <- basename(tools::file_path_sans_ext(path))
    for(n in 1:num_fields) name <- gsub(paste0(delim, "[^", delim, "]*$"), "", name)
    return(paste(dirname(path), name, sep="/"))
}


#' Plot read and peak annotations and distributions
#'
#' This function is meant to annotate called peaks or aligned reads by known or
#' predicted genomic regions
#'
#' @param feat BED6 file containing annotated features of interest
#' @param input input file to be annotated
#' @param peaks BED or narrowPeak format file of called peaks
#' @param genome genome identifier
#' @param output path to output directory
#' @keywords peak read annotation
#' @export
#' @examples
#' data("peaks")
#' data("feat")
#' plotAnno(feat = "feat", input="peaks", type = "np",
#'          genome = "hg38", output = ".")
#' @export
plotAnno <- function(input, type=c("np", "bed"), feat,
                     genome = "hg38", output=".") {

    sample_path = sampleName(input)

    if (type == "np") {
        output_type = "peaks"
    } else {
        output_type = "reads"
    }
    
    # load input file and convert to/ensure it is in BED6 format
    if (exists(input)) {
        in_file <- data.table(get(input))
    } else {
        info <- file.info(file.path(input))
        if (file.exists(file.path(input)) && info$size != 0) {
            in_file  <- fread(file.path(input))
        } else {
            out_file <- file.path(output, paste(basename(sample_path),
                                                output_type,
                                                "partition_dist.pdf",
                                                sep="_"))
            system2(paste("touch"), out_file)
            quit()
        }
    }

    if (ncol(in_file) >= 6) {
        in_bed <- in_file[,c(1,2,3,4,5,6)]
        colnames(in_bed) <- c("chromosome", "start", "end",
                              "name", "score", "strand")
    } else {
        in_bed <- in_file[,c(1,2,3)]
        colnames(in_bed) <- c("chromosome", "start", "end")
    } 

    # Convert to GRanges Object
    query  <- makeGRangesFromDataFrame(in_bed, keep.extra.columns=TRUE)

    # Chromosome distribution plot
    x      <- suppressMessages(aggregateOverGenomeBins(query, genome))
    # Don't plot lowest 10% represented chromosomes
    tbl    <- data.frame(table(x$chr))
    cutoff <- quantile(tbl$Freq, 0.1)
    keep   <- tbl[tbl$Freq > cutoff, 1]
    x      <- x[x$chr %in% keep,]
    if (nrow(x) > 0) {
        ga_plot <- plotGenomeAggregate(x)

        pdf(file = file.path(output,
            paste(basename(sample_path), output_type, "chr_dist.pdf", sep="_")),
            width= 7, height = 7, useDingbats=F)
        print(ga_plot)
        invisible(dev.off())

        png(file.path(output,
            paste(basename(sample_path), output_type, "chr_dist.png", sep="_")),
            width = 480, height = 480)
        print(ga_plot)
        invisible(dev.off())
    } else {
        message("Too few peaks to plot. Check the genome alignment rates.")
    }

    # Feature distance distribution plots
    TSS_dist <- TSSDistance(query, genome)
    if (!is.na(TSS_dist[1])) {
        TSS_plot <- plotFeatureDist(TSS_dist, featureName="TSS")

        pdf(file = file.path(output,
            paste(basename(sample_path), output_type, "TSS_dist.pdf", sep="_")),
            width= 7, height = 7, useDingbats=F)
        print(TSS_plot)
        invisible(dev.off())

        png(file.path(output,
            paste(basename(sample_path), output_type, "TSS_dist.png", sep="_")),
            width = 480, height = 480)
        print(TSS_plot)
        invisible(dev.off())
    } else {
        quit()
    }

    # Partition distribution plots
    knownGenomes <- c('hg19', 'hg38', 'mm9', 'mm10')
    if (exists(feat)) {
        anno_file <- data.table(get(feat))
    } else {
        if (filetype(paste0(feat)) == "gzfile") {
            anno_file <- fread(cmd=(sprintf('gzip -d -c %s', shQuote(file.path(feat)))))
            suppressWarnings(closeAllConnections())
        } else {
            anno_file <- fread(file.path(feat))
        }
    }
    
    colnames(anno_file) <- c("chromosome", "start", "end",
                             "name", "scores", "strand")
    priority <- sapply(unique(anno_file$name), list)
    dt_list  <- splitDataTable(anno_file, "name")
    dt_list  <- dt_list[names(priority)]
    gl       <- GRangesList(lapply(dt_list, makeGRangesFromDataFrame))

    if (genome %in% knownGenomes) {
        gp   <- suppressWarnings(
                    assignPartitions(query, gl, remainder = "Intergenic"))
    } else {
        gp   <- suppressWarnings(
                    assignPartitions(query, gl, remainder = "Other"))
    }

    gp_plot   <- plotPartitions(gp)

    pdf(file = file.path(output,
        paste(basename(sample_path), output_type, "partition_dist.pdf", sep="_")),
        width= 7, height = 7, useDingbats=F)
    print(gp_plot)
    invisible(dev.off())

    png(file.path(output,
        paste(basename(sample_path), output_type, "partition_dist.png", sep="_")),
        width = 480, height = 480)
    print(gp_plot)
    invisible(dev.off())

    write(paste0(output_type, " annotation complete!\n"), stdout())
}


#' Convert a narrowPeak file to a bigBED format file.
#'
#' @param input Path to narrowPeak file
#' @param chr_sizes Genome chromosome sizes file. <Chr> <Size>
#' @param ucsc_tool Path to UCSC tool "bedToBigBed"
#' @param keep Keep BED format intermediate file
#' @keywords narrowPeak bigBed
#' @export
narrowPeakToBigBed <- function(input=input, chr_sizes=chr_sizes,
                               ucsc_tool=ucsc_tool, keep=FALSE) {

    sample_path <- sampleName(input, 1)

    if (file.exists(file.path(chr_sizes))) {
        chrom_sizes <- fread(file.path(chr_sizes))
    } else {
        err_msg = paste0("Could not find: ", file.path(chr_sizes))
        stop(err_msg)
    }

    info = file.info(file.path(input))
    if (file.exists(file.path(input)) && info$size != 0) {
        np     <- fread(file.path(input))
    } else {
      out_file <- file.path(paste0(sample_path, "_peaks.bigBed"))
      system2(paste("touch"), out_file)
      quit()
    }

    # some 'score' values are greater than 1000 (more than BED format allows); 
    # rescale the scores to 0-1000 based on the 99th percentile being 1000
    nineNine <- quantile(np$V5, 0.99)
    np$V5    <- replace(np$V5, np$V5 > nineNine, nineNine)
    np$V5    <- rescale(log(np$V5), to = c(0, 1000))

    np           <- merge(np, chrom_sizes, by="V1", sort=FALSE)
    colnames(np) <- c("V1","V2","V3","V4","V5","V6","V7","V8","V9","V10","V11")

    # make sure 'chromEnd' positions are not greater than the max chrom.size
    for (j in 1:nrow(np)) {
        if (np$V3[j] > np$V11[j]) np$V3[j] <- np$V11[j]
    }
    np       <- np[,-11]
    np$V5    <- as.integer(np$V5)  # ensure score is an integer value
    tmp_file <- file.path(paste0(sample_path, "_peaks.bed"))
    as_file  <- file.path(paste0(dirname(sample_path), "bigNarrowPeak.as"))
    out_file <- file.path(paste0(sample_path, "_peaks.bigBed"))

    fwrite(np, file=tmp_file, col.names=FALSE, row.names=FALSE,
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
    ")", sep="", file = as_file)

    system2(paste(ucsc_tool),
            args=c(paste("-as=", as_file, sep=""), 
                   "-type=bed6+4", tmp_file, chr_sizes, out_file, sep=" "))

    file.remove(as_file)
    if (!keep) file.remove(tmp_file)
}


#' This function is meant to keep only the most significant non-overlapping
#' peaks.  It also trims peaks extending beyond the bounds of the chromosome.
#'
#' @param input Path to narrowPeak file
#' @param chr_sizes Genome chromosome sizes file. <Chr> <Size>
#' @param output Output file.
#' @keywords reduce fixed peaks
#' @export
reducePeaks <- function(input=input, chr_sizes=chr_sizes, output=NULL) {
    info <- file.info(file.path(input))
    if (file.exists(file.path(input)) && info$size != 0) {
        peaks           <- fread(file.path(input))
        colnames(peaks) <- c("chrom", "chromStart", "chromEnd",
                             "name", "score", "strand",
                             "signalValue", "pValue", "qValue", "peak")
        setkey(peaks, chrom, chromStart, chromEnd)
    } else {
        if (info$size == 0) {
            message(paste0("reducePeaks(): ", input,
                           " looks like an empty file."))
        } else {
            message(paste0("reducePeaks(): ", input, " is missing."))
        }
    }

    info <- file.info(file.path(chr_sizes))
    if (file.exists(file.path(chr_sizes)) && info$size != 0) {
        c_size           <- fread(file.path(chr_sizes))
        colnames(c_size) <- c("chrom", "size")
    } else {
        if (info$size == 0) {
            message(paste0("reducePeaks(): ", chr_sizes,
                           " looks like an empty file."))
        } else {
            message(paste0("reducePeaks(): ", chr_sizes, " is missing."))
        }
    }
        
    if (exists("peaks") & exists("c_size")) {
        hits  <- foverlaps(peaks, peaks,
                           by.x=c("chrom", "chromStart", "chromEnd"),
                           type="any", which=TRUE, nomatch=0)
        qVals <- data.table(index=rep(1:nrow(peaks)), qValue=peaks$qValue)
        setkey(hits, xid)
        setkey(qVals, index)
        out     <- hits[qVals, nomatch=0]
        keep    <- out[out[,.I[which.max(qValue)],by=yid]$V1]
        indices <- unique(keep$xid)
        final   <- peaks[indices,]
        # trim any bad peaks (extend beyond chromosome)
        # can't be negative
        final[chromStart < 0, chromStart := 0]
        # can't extend past chromosome
        for (i in nrow(c_size)) {
            final[chrom == c_size$chrom[i] & chromEnd > c_size$size[i], chromEnd := c_size$size[i]]
        }
        # normalize peak scores for cross sample comparison
        final[, score := .(score/(sum(score)/1000000))]
        final[score < 0, score := 0]
        # save final peak set
        if (is.null(output)) {
            fwrite(final, paste0(sampleName(input),
                                 "_peaks_fixedWidth_normalized.narrowPeak"),
                   sep="\t", col.names=FALSE)
        } else {
            fwrite(final, output, sep="\t", col.names=FALSE)
        }

    } else {
        message("PEPATACr reducePeaks() failed. Check peak and chrom.sizes files.")
    }
}


################################################################################
