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
#' A standardized ggplot theme for PEPATAC plots
#'
#' @keywords ggplot2 theme
#' @examples
#' theme_PEPATAC()
theme_PEPATAC <- function(base_family = "sans", ...){
  theme_classic(base_family = base_family, base_size = 14, ...) +
  theme(
    axis.line = element_line(size = 0.5),
    axis.text.x = element_text(angle = 90, hjust = 1, vjust=0.5),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "transparent"),
    plot.background = element_rect(fill = "transparent", color = NA),
    legend.background = element_rect(fill = "transparent", color = NA),
    legend.box.background = element_rect(fill = "transparent", color = NA),
    aspect.ratio = 1,
    legend.position = "none",
    plot.title = element_text(hjust = 0.5),
    panel.border = element_rect(colour = "black", fill=NA, size=0.5)
  )
}

#' Calculate the Fraction of Reads in Features (FRiF)
#'
#' This function calculates the fraction of reads in a feature and returns
#' a modified BED file with the cumulative sum of reads, cumulative size
#' of covered features, the fraction of reads in those features, and the
#' number of total features.
#'
#' @param bedFile A BED format file
#' @param total Number of aligned reads (or number of aligned bases)
#' @param reads If TRUE, we're working with read counts.
#'              If FALSE, we're working with absolute number of bases
#' @keywords FRiF
#' @examples
#' calcFRiF()
calcFRiF <- function(bedFile, total, reads) {
    colnames(bedFile) <- c("chromosome", "start", "end",
                           "count", "bases", "width", "fraction")
    grObj   <- makeGRangesFromDataFrame(bedFile)
    grObj   <- reduce(grObj)
    redBed  <- data.frame(chromosome=seqnames(grObj),
                          start=start(grObj), end=end(grObj))
    bedFile <- merge(redBed, bedFile, by=c("chromosome","start","end"))
    bedFile <- cbind(bedFile, size=(bedFile$end-bedFile$start))

    if (reads) {
        bedFile <- bedFile[order(-bedFile$count),]
    } else {
        bedFile <- bedFile[order(-bedFile$bases),]
    }

    bedFile <- bedFile[apply(bedFile != 0, 1, all),]

    if (reads) {
        bedFile <- cbind(bedFile, cumsum=cumsum(bedFile$count))
    } else {
        bedFile <- cbind(bedFile, cumsum=cumsum(bedFile$bases))
    }

    bedFile <- cbind(bedFile, cumSize=cumsum(bedFile$size))
    bedFile <- cbind(bedFile, frip=bedFile$cumsum/as.numeric(total))
    bedFile <- cbind(bedFile, numfeats=as.numeric(1:nrow(bedFile)))
    return(bedFile)
}

#' Plot Fraction of Reads in Features (FRiF)
#'
#' This function plots the fraction of reads in a set of features
#' and produces pdf/png output files.
#'
#' @param sample_name Name of sample
#' @param num_reads Number of aligned reads in sample
#' @param genome_size Size of genome in bp
#' @param output_name Output file name
#' @param bedFile A BED format file
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
#'          bedFile = c("promoter", "promoter_flanking", "exon",
#'                      "intron", "utr3", "utr5"))
#' @export
plotFRiF <- function(sample_name, num_reads, genome_size,
                     type = c("cfrif", "frif", "both"),
                     reads=TRUE, output_name, bedFile) {
    labels  <- data.frame(xPos=numeric(), yPos=numeric(), name=character(),
                          val=numeric(), color=character(),
                          stringsAsFactors=FALSE)
    feature_dist  <- data.frame(feature=character(), numfeats=numeric(),
                                numbases=numeric(), expected=numeric(),
                                stringsAsFactors=FALSE)
    palette <- colorRampPalette(c("#999999", "#FFC107", "#27C6AB", "#004D40",
                                  "#B97BC8", "#009E73", "#C92404", "#E3E550",
                                  "#372B4C", "#E3DAC7", "#27CAE6", "#B361BC",
                                  "#897779", "#6114F8", "#19C42B", "#56B4E9"))
    plotColors <- palette(length(bedFile))
    if (!exists(bedFile[1])) {
        info   <- file.info(file.path(bedFile[1]))
    }
    name       <- sample_name

    if (exists(bedFile[1])) {
        bed        <- get(bedFile[1])
        bedCov     <- calcFRiF(bed, num_reads, reads)
        name       <- bedFile[1]
        labels[1,] <- c(0.95*max(log10(bedCov$cumSize)), max(bedCov$frip)+0.001,
                        name, round(max(bedCov$frip),2), "#FF0703")
        feature_dist[1,] <- c(name, nrow(bed),
                              as.numeric(sum(abs(bed$V3-bed$V2))),
                              as.numeric((sum(abs(bed$V3-bed$V2))/genome_size)))
        bedCov$feature <- name
    } else if (file.exists(file.path(bedFile[1])) && info$size != 0) {
        bed <- read.table(file.path(bedFile[1]))
        if (nrow(bed[which(bed$V5 != 0),]) == 0) {
            message(paste0(name, "  has no covered features"))
        } else {
            bedCov     <- calcFRiF(bed, num_reads, reads)
            name       <- basename(tools::file_path_sans_ext(bedFile[1]))
            name       <- gsub(sample_name, "", name)
            name       <- gsub("^.*?_", "", name)
            numFields  <- 2
            for(i in 1:numFields) name <- gsub("_[^_]*$", "", name)
            labels[1,] <- c(0.95*max(log10(bedCov$cumSize)), max(bedCov$frip)+0.001,
                            name, round(max(bedCov$frip),2), "#FF0703")
            feature_dist[1,] <- c(name, nrow(bed),
                                  as.numeric(sum(abs(bed$V3-bed$V2))),
                                  as.numeric((sum(abs(bed$V3-bed$V2))/genome_size)))
            bedCov$feature <- name
        }
    }  else {
        if (is.na(info[1])) {
            message(paste0(name, " coverage file is missing"))
        } else if (info$size == 0) {
            message(paste0(name, " coverage file is empty"))
        } else {
            message(paste0(name, " coverage file is missing"))
        }
    }

    if (exists("bedCov")) {
        covDF <- bedCov
    } else {
        return(ggplot())
    }

    if (length(bedFile) > 1) {
        for (i in 2:length(bedFile)) {
            if (exists(bedFile[i])) {
                name       <- bedFile[i]
            } else {
                info       <- file.info(file.path(bedFile[i]))
                name       <- basename(tools::file_path_sans_ext(bedFile[i]))
                name       <- gsub(sample_name, "", name)
                name       <- gsub("^.*?_", "", name)
                numFields  <- 2
                for(j in 1:numFields) name <- gsub("_[^_]*$", "", name)
            }

            if (exists(bedFile[i])) {
                bed     <- get(bedFile[i])
            } else if (file.exists(file.path(bedFile[i])) && info$size != 0) {
                bed     <- read.table(file.path(bedFile[i]))
            } else {
                outFile <- file.path(output_name)
                system2(paste("touch"), outFile)
                quit(save = "no", status = 1, runLast = FALSE)
            }

            if (max(bed[,4] > 0)) {
                if (exists("covDF")) {
                    covFile <- calcFRiF(bed, num_reads, reads)
                    covFile$feature <- name
                    covDF   <- rbind(covDF, covFile)
                    labels  <- rbind(labels, c(0.95*max(log10(covFile$cumSize)),
                                               max(covFile$frip)+0.001,
                                               name, round(max(covFile$frip),2),
                                               plotColors[i]))
                    feature_dist <- rbind(feature_dist,
                        c(name, nrow(bed), as.numeric(sum(abs(bed$V3-bed$V2))),
                          as.numeric((sum(abs(bed$V3-bed$V2))/genome_size))))
                } else {
                    covDF         <- calcFRiF(bed, num_reads, reads)
                    covDF$feature <- name
                    labels        <- rbind(labels,
                                           c(0.95*max(log10(covDF$cumSize)),
                                             max(covDF$frip)+0.001,
                                             name, round(max(covDF$frip),2),
                                             plotColors[i]))
                    feature_dist <- rbind(feature_dist,
                        c(name, nrow(bed), as.numeric(sum(abs(bed$V3-bed$V2))),
                          as.numeric((sum(abs(bed$V3-bed$V2))/genome_size))))
                }
            }
        }
    }

    # Reorder by labels (ensures plotting matches up labels and colors)
    if (exists("covDF")) {
        covDF$feature <- factor(covDF$feature, levels=(labels$name))
    }

    feature_dist$numbases <- as.numeric(feature_dist$numbases)
    feature_dist$expected <- as.numeric(feature_dist$expected)
    feature_dist$observed <- as.numeric(labels$val)
    feature_dist$logOE <- log10(feature_dist$observed/feature_dist$expected)
    feature_dist$logOE <- ifelse(feature_dist$logOE < 0, 0, feature_dist$logOE)
    feature_dist <- merge(feature_dist, labels, by.x="feature", by.y="name")
    #feature_dist <- feature_dist[order(feature_dist$logOE, decreasing=TRUE),]
    feature_dist <- feature_dist[order(feature_dist$logOE),]
    rownames(feature_dist) <- NULL
    feature_dist$feature <- factor(feature_dist$feature,
                                   levels=feature_dist$feature)
    feature_dist$color <- factor(feature_dist$color,
                                 levels=feature_dist$color)

    if (!is.null(bedFile)) {

        if (tolower(type) == "both") {
            # Produce plot with bed files
            # take minimum quantile (only works if everything is above that value)
            #p <- ggplot(covDF[which(covDF$frip > min(density(covDF$frip)$y)),],
            #           aes(x=log10(cumSize), y=frip,
            #               group=feature, color=feature)) +
            p <- ggplot(covDF, aes(x=log10(cumSize), y=frip,
                        group=feature, color=feature)) +
                #geom_line(aes(linetype=feature), size=2, alpha=0.5) +
                geom_line(size=2, alpha=0.5) +
                guides(linetype = FALSE) +
                labs(x=expression(log[10]("number of bases")),
                     y="FRiF") +
                theme_PEPATAC()

            # Recolor and reposition legend
            p <- p + scale_color_manual(labels=paste0(labels$name, ": ",
                                                      labels$val),
                                        values=labels$color) +
                labs(color="FRiF") +
                theme(legend.position="right",
                      legend.justification=c(0.1,0.9),
                      legend.background=element_blank(),
                      legend.text = element_text(size = rel(0.65)),
                      legend.key = element_blank(),
                      axis.text.x = element_text(angle = 0, hjust = 1,
                                                 vjust=0.5))

            p2 <- ggplot(feature_dist, aes(x = feature, y = logOE)) +
                geom_bar(stat="identity", fill=labels$color, alpha=0.5) + 
                geom_hline(aes(yintercept=0), linetype="dotted") +
                xlab('') +
                ylab(expression(log[10](over(Obs, Exp)))) +
                coord_flip() +
                scale_x_discrete(position="top") +
                theme_PEPATAC() +
                theme(plot.background = element_rect(fill = "transparent",
                                                     color = NA,),
                      panel.background = element_rect(fill = "transparent"),
                      rect = element_rect(fill = "transparent"),
                      plot.margin = unit(c(0,0,-6.5,-6.5),"mm"))

            g   <- ggplotGrob(p2)
            min_x <- min(layer_scales(p)$x$range$range)
            max_x <- max(layer_scales(p)$x$range$range)
            min_y <- min(layer_scales(p)$y$range$range)
            max_y <- max(layer_scales(p)$y$range$range)

            p <- p + annotation_custom(grob = g, xmin = 1.05*min_x,
                                       xmax=min_x*2.05, ymin=max_y/2,
                                       ymax=max_y)
        } else if (tolower(type) == "cfrif") {
            # take minimum quantile (only works if everything is above that value)
            #p <- ggplot(covDF[which(covDF$frip > min(density(covDF$frip)$y)),],
            #           aes(x=log10(cumSize), y=frip,
            #               group=feature, color=feature)) +
            p <- ggplot(covDF, aes(x=log10(cumSize), y=frip,
                        group=feature, color=feature)) +
                geom_line(size=2, alpha=0.5) +
                guides(linetype = FALSE) +
                labs(x=expression(log[10]("number of bases")), y="FRiF") +
                theme_PEPATAC()

            # Recolor and reposition legend
            p <- p + scale_color_manual(labels=paste0(labels$name, ": ",
                                                      labels$val),
                                        values=labels$color) +
                labs(color="FRiF") +
                theme(legend.position=c(0.075,0.975),
                      legend.justification=c(0.1,0.9),
                      legend.title = element_blank(),
                      legend.text = element_text(size = rel(0.65)), 
                      legend.background=element_blank(),
                      legend.key = element_blank(),
                      axis.text.x = element_text(angle = 0, hjust = 1,
                                                 vjust=0.5))
        } else if (tolower(type) == "frif") {
            p <- ggplot(feature_dist, aes(x = feature, y = logOE)) +
                geom_bar(stat="identity",
                         fill = feature_dist$color,
                         alpha = 0.5) + 
                geom_hline(aes(yintercept=0), linetype="dotted") +
                xlab('') +
                ylab(expression(log[10](over(Obs, Exp)))) +
                coord_flip() +
                theme_PEPATAC()
        } else {
            # default to both
            # Produce plot with bed files
            p <- ggplot(covDF,
                        aes(x=log10(cumSize), y=frip,
                            group=feature, color=feature)) +
                geom_line(aes(linetype=feature), size=2, alpha=0.5) +
                guides(linetype = FALSE) +
                labs(x=expression(log[10]("number of bases")),
                     y="FRiF") +
                theme_PEPATAC()

            # Recolor and reposition legend
            p <- p + scale_color_manual(labels=paste0(labels$name, ": ",
                                                      labels$val),
                                        values=labels$color) +
                labs(color="FRiF") +
                theme(legend.position="right",
                      legend.justification=c(0.1,0.9),
                      legend.background=element_blank(),
                      legend.key = element_blank(),
                      axis.text.x = element_text(angle = 0, hjust = 1,
                                                 vjust=0.5))

            p2 <- ggplot(feature_dist, aes(x = feature, y = logOE)) +
                geom_bar(stat="identity", fill=labels$color, alpha=0.5) + 
                geom_hline(aes(yintercept=0), linetype="dotted") +
                xlab('') +
                ylab(expression(log[10](over(Obs, Exp)))) +
                coord_flip() +
                scale_x_discrete(position="top") +
                theme_PEPATAC() +
                theme(plot.background = element_rect(fill = "transparent",
                                                     color = NA,),
                      panel.background = element_rect(fill = "transparent"),
                      rect = element_rect(fill = "transparent"),
                      plot.margin = unit(c(0,0,-6.5,-6.5),"mm"))

            g   <- ggplotGrob(p2)
            min_x <- min(layer_scales(p)$x$range$range)
            max_x <- max(layer_scales(p)$x$range$range)
            min_y <- min(layer_scales(p)$y$range$range)
            max_y <- max(layer_scales(p)$y$range$range)

            p <- p + annotation_custom(grob = g, xmin = 1.05*min_x,
                                       xmax=min_x*2.05, ymin=max_y/2,
                                       ymax=max_y)
        }

        
    } else {
        err_msg <- paste0("Unable to produce ", type ," plot!\n")
        write(err_msg, stdout())
    }

    if (!exists("p")) {
        p <- ggplot()
    }

    return(p)
}


#' Plot TSS enrichment
#'
#' This function plots the global TSS enrichment.
#'
#' @param TSSfile TSS enrichment file
#' @param cutoff A TSS enrichment score cutoff value for low quality samples
#' @keywords TSS enrichment
#' @export
#' @examples
#' data("tss")
#' plotTSS(TSSfile = "tss")
#' @export
plotTSS <- function(TSSfile, cutoff=6) {
    if (length(TSSfile) == 1) {
        write(paste0("\nGenerating TSS plot with ", TSSfile), stdout())
    } else {
        if (length(TSSfile) == 2) {
            write(paste0("\nGenerating TSS plot with ",
                         paste(TSSfile, collapse=" and ")),
                  stdout())
        } else {
            write(paste0("\nNot sure how to merge the following: ",
                         paste(TSSfile, collapse=", ")),
                  stdout())
            write(paste0("Did you mean to pass more than 2 files?"), stdout())
            quit(save = "no", status = 1, runLast = FALSE)
        }
    }

    t1 <- theme_classic(base_size=14) + 
            theme(plot.background  = element_blank(),
                  panel.grid.major = element_blank(),
                  panel.grid.minor = element_blank(),
                  panel.border     = element_rect(colour = "black",
                                                  fill=NA, size=0.5),
                  panel.background = element_blank(),
                  axis.line    = element_blank(),
                  legend.position="none",
                  aspect.ratio = 1,
                  axis.ticks.length = unit(2, "mm"))

    iMat <- data.table(V1 = numeric())
    if (length(TSSfile) == 1) {
        if (exists(TSSfile)) {
            iMat <- data.table(get(TSSfile))
        } else {
            iMat <- fread(TSSfile)
        }
    } else if (length(TSSfile) == 2) {
        for (i in 1:length(TSSfile)) {
            if (exists(TSSfile[i])) {
                if (i == 1) {
                    iMat <- data.table(get(TSSfile[i]))
                } else {
                    iMat <- list(iMat, data.table(get(TSSfile[i])))
                }
            } else {
                if (i == 1) {
                    iMat <- fread(TSSfile[i])
                } else {
                    iMat <- list(iMat, fread(TSSfile[i]))
                }
            }
        }
    } else {
        write(paste0("\nNot sure how to merge the following: ",
                     paste(TSSfile, collapse=", ")),
              stdout())
        write(paste0("Did you mean to pass more than 2 files?"), stdout())
        quit(save = "no", status = 1, runLast = FALSE)
    }

    if (length(TSSfile) == 1) {
        plusMinus <- iMat
    } else {
        plus      <- iMat[[1]]
        minus     <- iMat[[2]]
    }

    if (exists("plusMinus")) {
        val      <- 0.05*nrow(plusMinus)
        #normTSS  <- (plusMinus / mean(plusMinus[c(1:val,
        #            (nrow(plusMinus)-val):nrow(plusMinus)), V1]))
        normTSS           <- plusMinus / mean(plusMinus[c(1:val), V1])
        colnames(normTSS) <- c("score")
        peakPos  <- which.max(normTSS$score)
        # check for true peak
        if ((normTSS$score[peakPos]/normTSS$score[peakPos-1]) > 1.5 &
            (normTSS$score[peakPos]/normTSS$score[peakPos+1]) > 1.5) {
            tmpTSS  <- normTSS$score[-peakPos]
            peakPos <- which.max(tmpTSS) + 1
        }
        TSSscore <- round(mean(normTSS[(max(0, peakPos-50)):(min(nrow(normTSS),
                                       peakPos+50)), score]),1)
        if (is.nan(TSSscore)) {
            message(paste0("\nNaN produced.  Check ", TSSfile, "\n"))
            quit(save = "no", status = 1, runLast = FALSE)
        }
    } else {
        val      <- 0.05*nrow(plus)
        #normTSS  <- (plus / mean(plus[c(1:val,
        #            (nrow(plus)-val):nrow(plus)), V1]))
        normTSS           <- plus / mean(plus[c(1:val), V1])
        colnames(normTSS) <- c("score")
        peakPos  <- which.max(normTSS$score)
        # check for true peak
        if ((normTSS$score[peakPos]/normTSS$score[peakPos-1]) > 1.5 &
            (normTSS$score[peakPos]/normTSS$score[peakPos+1]) > 1.5) {
            tmpTSS  <- normTSS$score[-peakPos]
            peakPos <- which.max(tmpTSS) + 1
        }
        TSSscore <- round(mean(normTSS[(max(0, peakPos-50)):(min(nrow(normTSS),
                                       peakPos+50)), score]),1)
        if (is.nan(TSSscore)) {
            message(paste0("\nNaN produced.  Check ", TSSfile[1], "\n"))
            quit(save = "no", status = 1, runLast = FALSE)
        }
    }
    
    lineColor <- "red2"
    if (TSSscore > cutoff)
    {
        lineColor <- "springgreen4"
    }

    name        <- basename(tools::file_path_sans_ext(TSSfile[1]))
    numFields   <- 2
    for(j in 1:numFields) name <- gsub("_[^_]*$", "", name)
    sample_name <- paste(dirname(TSSfile[1]), name, sep="/")

    pre <- ggplot(normTSS, aes(x=(as.numeric(rownames(normTSS))-
                                 (nrow(normTSS)/2)),
                               y=score, group=1, colour="black")) +
        # geom_hline(yintercept = 6, linetype = 2,
        #            color = "grey", size = 0.25) +
        geom_smooth(method="loess", span=0.02,
                    se=FALSE, colour=lineColor) +
        labs(x = "Distance from TSS (bp)", y = "TSS enrichment score")
    y_max <- roundUpNice(TSSscore)
    p <- pre + t1 +
         scale_x_continuous(expand=c(0,0)) +
         scale_y_continuous(expand=c(0,0)) +
         coord_cartesian(xlim=c(-2300, 2300), ylim=c(0, 1.1*y_max))
    if (exists("minus")) {
        val      <- 0.025*nrow(minus)
        # normTSS  <- (minus / mean(minus[c(1:val,
        #             (nrow(minus)-val):nrow(minus)), V1]))
        minusNormTSS           <- minus / mean(minus[c(1:val), V1])
        colnames(minusNormTSS) <- c("score")
        peakPos       <- which.max(minusNormTSS$score)
        # check for true peak
        if ((minusNormTSS$score[peakPos]/minusNormTSS$score[peakPos-1]) > 1.5 &
            (minusNormTSS$score[peakPos]/minusNormTSS$score[peakPos+1]) > 1.5) {
            tmpTSS  <- minusNormTSS$score[-peakPos]
            peakPos <- which.max(tmpTSS) + 1
        }

        minusTSSscore <- round(
            mean(minusNormTSS[(max(0, peakPos-50)):(min(nrow(minusNormTSS),
                               peakPos+50)), score]),1)
        if (is.nan(minusTSSscore)) {
            message(paste0("\nNaN produced.  Check ", TSSfile[2], "\n"))
            quit(save = "no", status = 1, runLast = FALSE)
        }
        p <- p + geom_smooth(data=minusNormTSS,
                             aes(x=(as.numeric(rownames(minusNormTSS))-
                                   (nrow(minusNormTSS)/2)),
                                 y=score, group=1, colour="black"),
                             method="loess", span=0.02,
                             se=FALSE, colour="blue") +
                annotate("rect", xmin=1200, xmax=2300, ymin=0.9*y_max,
                         ymax=1.1*y_max, fill="gray95") +
                annotate("text", x=1750, y=1.05*y_max, label="TSS Score",
                         fontface = 1, hjust=0.5) +
                annotate("text", x=1500, y=y_max, label="+", fontface = 2,
                          hjust=0.5, color=lineColor) +
                annotate("text", x=1500, y=0.95*y_max, label=TSSscore,
                         fontface = 2,  hjust=0.5, color=lineColor) +
                annotate("text", x=2000, y=y_max, label="-",
                         fontface = 2,  hjust=0.5, color="blue") +
                annotate("text", x=2000, y=0.95*y_max, label=minusTSSscore,
                         fontface = 2,  hjust=0.5, color="blue")
    } else {
        p <- p + annotate("rect", xmin=1200, xmax=2300, ymin=0.9*y_max,
                          ymax=1.1*y_max, fill="gray95") +
                 annotate("text", x=1750, y=1.05*y_max, label="TSS Score",
                          fontface = 1, hjust=0.5) +
                 annotate("text", x=1750, y=0.95*y_max, label=TSSscore,
                          fontface = 2, hjust=0.5)
    }

    return(p)
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
#' data("frag_len")
#' data("frag_len_count")
#' plotFLD(fragL = "frag_len", fragL_count = "frag_len_count",
#'         fragL_txt = "fragLenDistribution_example.txt", max_fragment=200)
#' @export
plotFLD <- function(fragL,
                    fragL_count,
                    fragL_txt="fragLenDistribution.txt",
                    max_fragment = 200) {

    if (exists(fragL_count)) {
        dat <- data.table(get(fragL_count))
    } else if (file.exists(fragL_count)) {
        dat <- fread(fragL_count)
    } else {
        stop(paste0("FileExistsError: ", fragL_count, " could not be found."))
        quit(save = "no", status = 1, runLast = FALSE)
    }

    if (exists(fragL)) {
        summary_table <- data.table(get(fragL))
    } else if (file.exists(fragL)) {
        summary_table <- fread(fragL)
    } else {
        stop(paste0("FileExistsError: ", fragL, " could not be found."))
        quit(save = "no", status = 1, runLast = FALSE)
    }

    dat1 <- dat[dat$V2<=max_fragment,]
    tmp  <- seq(1:as.numeric(dat1[1,2]-1))
    dat0 <- data.table(V1=rep(0,length(tmp)),V2=tmp)
    dat2 <- rbind(dat0, dat1)

    x_min <- which.min(dat1$V1[1:which.max(dat1$V1)])

    dat3 <- dat1[x_min:nrow(dat1),]
    abbr <- getAbbr(dat3$V1)
    if (abbr == '') {
        ylabel <- "Number of reads"
    } else {
        ylabel <- paste0("Number of reads (", abbr, ")")
    }

    count_factor <- getFactor(dat3$V1)

    p <- ggplot(dat3, aes(x=V2, y=V1/count_factor)) +
            geom_point(size=1, alpha=0.25) +
            geom_line(alpha=0.5) +
            # annotate("rect", xmin=-Inf, xmax=20, ymin=-Inf, ymax=Inf,
            #      alpha=0.1, fill="#ff001e") +
            # annotate("text", x=25, y=(max(dat1$V1)/2),
            #          size=theme_get()$text[["size"]]/4,
            #          label="partial degradation", angle=90, col="#858585") +
            # annotate("rect", xmin=-Inf, xmax=30, ymin=-Inf, ymax=Inf,
            #          alpha=0.1, fill="#ffee00") + 
            # annotate("text", x=7.5, y=(max(dat1$V1)/2),
            #          size=theme_get()$text[["size"]]/4,
            #          label="high degradation", angle=90, col="#858585") +
            labs(x="Fragment length", y=ylabel) +
            theme_PEPATAC() +
            theme(axis.text.x = element_text(angle = 0, hjust = 0.5))

    summ <- data.table(Min=min(summary_table$V1),
                       Max=max(summary_table$V1),
                       Median=median(summary_table$V1),
                       Mean=mean(summary_table$V1),
                       Stdev=sd(summary_table$V1))
    # Write summary table to stats file
    fwrite(summ, file=fragL_txt, row.names=F, quote=F, sep="\t")

    return(p)
}



#' Calculate mode(s) of data
#'
#' From: https://stackoverflow.com/questions/2547402/is-there-a-built-in-function-for-finding-the-mode
#' @param x A vector of numbers or characters
#' @param return_multiple Bool to return multiple modes or first in order
#' @param na.rm Bool Remove NAs
#'
#' @keywords mode
mode <- function(x, return_multiple = TRUE, na.rm = FALSE) {
    if(na.rm){
        x <- na.omit(x)
    }
    ux       <- unique(x)
    freq     <- tabulate(match(x, ux))
    mode_loc <- if(return_multiple) which(freq==max(freq)) else which.max(freq)
    return(ux[mode_loc])
}


#' Determine the appropriate abbreviation for large numbers
#'
#' Modified From: https://stackoverflow.com/questions/28159936/formatting-large-currency-or-dollar-values-to-millions-billions
#' @param vec A vector of numbers
#'
#' @keywords abbreviation
getAbbr <- function(vec) { 
    div <- findInterval(as.numeric(gsub("\\,", "", vec)), c(0, 1e3, 1e6, 1e9, 1e12) )
    return(paste(c("","K","M","B","T")[mode(div)]))
}


#' Determine the appropriate dividing factor for large numbers
#'
#' Modified From: https://stackoverflow.com/questions/28159936/formatting-large-currency-or-dollar-values-to-millions-billions
#' @param vec A vector of numbers
#'
#' @keywords abbreviation
getFactor <- function(vec) { 
    div <- findInterval(as.numeric(gsub("\\,", "", vec)), c(0, 1e3, 1e6, 1e9, 1e12) )
    return(as.numeric(paste(c(1, 1e3, 1e6, 1e9, 1e12)[mode(div)])))
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
    if(num_fields == 0) {return(name)}
    for(n in 1:num_fields) name <- gsub(paste0(delim, "[^", delim, "]*$"), "", name)
    return(paste(dirname(path), name, sep="/"))
}


#' Plot read and peak annotations and distributions
#'
#' This function is meant to annotate called peaks or aligned reads by known or
#' predicted genomic regions
#'
#' @param plot Choose the type of plot to produce
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
plotAnno <- function(plot = c("chromosome", "tss", "genomic"),
                     input, type=c("np", "bed"), feat,
                     genome = "hg38", output="chromosome_distribution.pdf") {

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

    if (tolower(plot) == "chromosome") {
        # Chromosome distribution plot
        x      <- suppressMessages(calcChromBinsRef(query, genome))
        # Don't plot lowest 10% represented chromosomes
        tbl    <- data.frame(table(x$chr))
        cutoff <- quantile(tbl$Freq, 0.1)
        keep   <- tbl[tbl$Freq > cutoff, 1]
        x      <- x[x$chr %in% keep,]
        if (nrow(x) > 0) {
            ga_plot <- plotChromBins(x)
            return(ga_plot)
        } else {
            message("Too few peaks to plot. Check the genome alignment rates.")
            return(ggplot())
        }
    } else if (tolower(plot) == "tss") {
        # Feature distance distribution plots
        TSS_dist <- calcFeatureDistRefTSS(query, genome)
        if (!is.na(TSS_dist[1])) {
            TSS_plot <- plotFeatureDist(TSS_dist, featureName="TSS")
            return(TSS_plot)
        } else {
            message("Unable to produce TSS distribution plot.")
            return(ggplot())
        }
    } else if (tolower(plot) == "genomic") {
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
                      calcPartitions(query, gl, remainder = "Intergenic"))
        } else {
            gp   <- suppressWarnings(
                      calcPartitions(query, gl, remainder = "Other"))
        }

        gp_plot   <- plotPartitions(gp)

        return(gp_plot)
    } else {
        # Default to chromosome distribution plot
        # Chromosome distribution plot
        x      <- suppressMessages(calcChromBinsRef(query, genome))
        # Don't plot lowest 10% represented chromosomes
        tbl    <- data.frame(table(x$chr))
        cutoff <- quantile(tbl$Freq, 0.1)
        keep   <- tbl[tbl$Freq > cutoff, 1]
        x      <- x[x$chr %in% keep,]
        if (nrow(x) > 0) {
            ga_plot <- plotChromBins(x)
            return(ga_plot)
        } else {
            message("Too few peaks to plot. Check the genome alignment rates.")
            return(ggplot())
        }
    }    
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

#' The function rounds the up to the nearest "nice" number.
#'
#' From:
#' https://stackoverflow.com/questions/6461209/how-to-round-up-to-the-nearest-10-or-100-or-x
#' @param x A vector of numbers
#' @param nice Values to round up to
#' @export
roundUpNice <- function(x, nice=c(1,2,3,4,5,6,7,8,9,10)) {
    if(length(x) != 1) stop("'x' must be of length 1")
    10^floor(log10(x)) * nice[[which(x <= 10^floor(log10(x)) * nice)[[1]]]]
}


#' Set the panel width/height of a ggplot to a fixed value. 
#'
#' From:
#' https://github.com/baptiste/egg/blob/master/R/setPanelSize.r
#'
#' @param p a ggplot object
#' @param g a ggplot grob
#' @param file filepath
#' @param margin plot margins
#' @param width plot width
#' @param height plot height
#' @export
setPanelSize <- function(p=NULL, g=ggplotGrob(p), file=NULL, 
                         margin=unit(1, "in"), width=unit(4, "in"), 
                         height=unit(4, "in")){
    
    panels        <- grep("panel", g$layout$name)
    panel_index_w <- unique(g$layout$l[panels])
    panel_index_h <- unique(g$layout$t[panels])
    nw            <- length(panel_index_w)
    nh            <- length(panel_index_h)
    
    if(getRversion() < "3.3.0"){
        # the following conversion is necessary
        # because there is no `[<-`.unit method
        # so promoting to unit.list allows standard list indexing
        g$widths  <- grid:::unit.list(g$widths)
        g$heights <- grid:::unit.list(g$heights)        
        g$widths[panel_index_w]  <- rep(list(width), nw)
        g$heights[panel_index_h] <- rep(list(height), nh)
    } else {
        g$widths[panel_index_w]  <- rep(width, nw)
        g$heights[panel_index_h] <- rep(height, nh)
    }
    
    if(!is.null(file))
        ggsave(file, g, limitsize = FALSE,
               width=convertWidth(sum(g$widths) + margin, 
                                  unitTo="in", valueOnly=TRUE),
               height=convertHeight(sum(g$heights) + margin,  
                                    unitTo="in", valueOnly=TRUE))
    invisible(g)
}


#' Helper function to build a file path to the correct output folder using a
#' specified suffix
#'
#' @param suffix A file suffix identifier
#' @param pep A PEP project configuration file
#' @export
buildFilePath <- function(suffix, pep=prj) {
    file.path(config(pep)$metadata$output_dir, "summary",
              paste0(config(pep)$name, suffix))
}


#' Return a list of prealignments from a stats_summary.tsv file if they exist
#'
#' @param stats_file A looper derived stats_summary.tsv file
#' @export
getPrealignments <- function(stats_file) {
    pre <- gsub("Aligned_reads_","",
                unique(grep("Aligned_reads_.*",
                colnames(stats_file), value=TRUE)))
    if (length(pre) > 0) {
        return(pre)
    } else {
        return(NULL)
    }
}


#' This function is meant to plot project level raw aligned reads.
#'
#' @param prj A PEPr Project object
#' @param stats A looper derived stats_summary.tsv file
#' @keywords aligned reads raw
#' @export
plotAlignedRaw <- function(prj, stats) {
    align_theme <- theme(
        plot.background   = element_blank(),
        panel.grid.major  = element_blank(),
        panel.grid.minor  = element_blank(),
        panel.border      = element_rect(colour = "black", fill = NA, size = 0.5),
        panel.background  = element_blank(),
        axis.line         = element_blank(),
        axis.text.x       = element_text(face = "plain", color = "black", 
                                          size = 20, hjust = 0.5),
        axis.text.y       = element_text(face = "plain", color = "black",
                                          size = 20, hjust = 1),
        axis.title.x      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5, vjust = 0.5),
        axis.title.y      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5),
        plot.title        = element_text(face = "bold", color = "black", 
                                          size = 12, hjust = 0.5),
        axis.ticks        = element_line(size = 0.5),
        axis.ticks.length = unit(2, "mm"),
        legend.background = element_rect(fill = "transparent"),
        legend.text       = element_text(size = 16),
        legend.title      = element_blank()
    )

    # Get prealignments if they exist
    prealignments <- getPrealignments(stats)

    unaligned <- stats$Fastq_reads - stats$Aligned_reads
    # If prealignments exist...include in unaligned reads count
    if (!is.null(prealignments)) {
        for (i in 1:length(unlist(prealignments))) {
            unaligned <- unaligned - stats[, (paste("Aligned_reads",
                                           unlist(prealignments)[i], sep="_")),
                                           with=FALSE][[1]]
        }
    }

    align_raw <- tryCatch(
        {
            data.table(sample = stats$sample_name,
                       unaligned = as.integer(unaligned),
                       duplicates = as.integer(stats$Duplicate_reads))
        },
        error=function(e) {
            message("The summary file values for unaligned or duplicate reads",
                    " are missing.")
            message("Here's the original error message: ", e)
            return(NULL)
        },
        warning=function(e) {
            message("The summary file contains missing values for the number",
                    " of unaligned or duplicate_reads.")
            message("Here's the original error message: ", e)
            return(NULL)
        }
    )

    if (is.null(align_raw)) {
        quit()
    }

    # Split counts based on genome name
    genome_names   <- unique(stats$Genome)
    for (i in 1:length(genome_names)) {
        row_pos    <- grep(genome_names[i], stats$Genome)
        read_count <- rep(0,nrow(stats))
        reads      <- stats$Aligned_reads[stats$Genome==genome_names[i]]
        read_dedup <- stats$Dedup_aligned_reads[stats$Genome==genome_names[i]]
        if (length(read_dedup) == length(reads)) {
            reads  <- read_dedup
        }
        for (j in 1:length(reads)) {
            read_count[row_pos[j]] <- reads[j]
        }
        align_raw[, (genome_names[i]) := as.integer(read_count)]
    }

    # If prealignments exist...add to data.table
    if (!is.null(prealignments)) {
        for (i in 1:length(unlist(prealignments))) {
            align_raw[, unlist(prealignments)[i] := as.integer(
               stats[, (paste("Aligned_reads", unlist(prealignments)[i], sep="_")),
               with=FALSE][[1]])]
        }
        setcolorder(align_raw, c("sample", "unaligned",
                                paste(unlist(prealignments)),
                                "duplicates", paste(unique(stats$Genome))))
    } else {
        setcolorder(align_raw, c("sample", "unaligned", "duplicates",
                                paste(unique(stats$Genome))))
    }

    align_raw$sample <- factor(align_raw$sample, levels = align_raw$sample)

    melt_align_raw <- melt(align_raw, id.vars = "sample")
    max_reads      <- max(rowSums(align_raw[,2:ncol(align_raw)]))
    upper_limit    <- roundUpNice(max_reads/1000000)
    chart_height   <- (length(unique(align_raw$sample))) * 0.75
    plot_colors    <- data.table(unaligned="gray15")

    if (!is.null(prealignments)) {
        more_colors <- colorpanel(length(unlist(prealignments)),
                                  low="#FFE595", mid="#F6CAA6", high="#F6F2A6")
        for (i in 1:length(unlist(prealignments))) {
            plot_colors[, unlist(prealignments)[i] := more_colors[i]]
        }
    }

    plot_colors[, duplicates := "#FC1E25"]
    more_colors <- colorpanel(length(genome_names),
                              low="#4876FF", mid="#94D9CE", high="#7648FF")
    for (i in 1:length(genome_names)) {
        plot_colors[, (genome_names[i]) := more_colors[i]]
    }

    align_raw_plot <- (
        ggplot(melt_align_raw, aes(x=sample, y=as.numeric(value)/1000000)) +
            geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) +
            guides(fill=guide_legend(reverse=TRUE)) +
            labs(x="", y="Number of reads (M)") +
            scale_x_discrete(limits=rev(levels(melt_align_raw$sample))) +
            scale_y_continuous(limits=c(0,upper_limit), expand=c(0,0)) +
            scale_fill_manual(values=paste(plot_colors)) +
            coord_flip() +
            align_theme)

    # Produce full-size PDF
    suppressWarnings(
        setPanelSize(
            align_raw_plot,
            file=buildFilePath("_alignmentRaw.pdf", prj),
            width=unit(8,"inches"),
            height=unit(chart_height,"inches")
            )
        )

    # Produce snap-shot thumbnail PNG for HTML display
    # Limit to 25 samples max
    if (length(align_raw$sample) > 25) {
        align_raw_thumb <- align_raw[1:25]
        more_to_see     <- data.frame(t(c("...", rep(0, (ncol(align_raw_thumb)-1)))))
        colnames(more_to_see)  <- colnames(align_raw_thumb)
        align_raw_thumb        <- rbind(align_raw_thumb, more_to_see)
        align_raw_thumb$sample <- droplevels(align_raw_thumb)$sample
        melt_align_raw_thumb   <- melt(align_raw_thumb, id.vars="sample")
        chart_height           <- (length(unique(align_raw_thumb$sample))) * 0.75
    } else {melt_align_raw_thumb <- melt_align_raw}

    thumb_raw_plot <- (
        ggplot(melt_align_raw_thumb, aes(x=sample, y=as.numeric(value)/1000000)) +
            geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) +
            guides(fill=guide_legend(reverse=TRUE)) +
            labs(x="", y="Number of reads (M)") +
            scale_x_discrete(limits=rev(levels(melt_align_raw_thumb$sample))) +
            scale_y_continuous(limits=c(0,upper_limit), expand=c(0,0)) +
            scale_fill_manual(values=paste(plot_colors)) +
            coord_flip() +
            align_theme)

    suppressWarnings(
        setPanelSize(
            thumb_raw_plot,
            file=buildFilePath("_alignmentRaw.png", prj),
            width=unit(8,"inches"),
            height=unit(chart_height,"inches")
            )
        )
}


#' This function is meant to plot project level percent aligned reads.
#'
#' @param prj A PEPr Project object
#' @param stats A looper derived stats_summary.tsv file
#' @keywords aligned reads percent
#' @export
plotAlignedPct <- function(prj, stats) {
    align_theme <- theme(
        plot.background   = element_blank(),
        panel.grid.major  = element_blank(),
        panel.grid.minor  = element_blank(),
        panel.border      = element_rect(colour = "black", fill = NA, size = 0.5),
        panel.background  = element_blank(),
        axis.line         = element_blank(),
        axis.text.x       = element_text(face = "plain", color = "black", 
                                          size = 20, hjust = 0.5),
        axis.text.y       = element_text(face = "plain", color = "black",
                                          size = 20, hjust = 1),
        axis.title.x      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5, vjust = 0.5),
        axis.title.y      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5),
        plot.title        = element_text(face = "bold", color = "black", 
                                          size = 12, hjust = 0.5),
        axis.ticks        = element_line(size = 0.5),
        axis.ticks.length = unit(2, "mm"),
        legend.background = element_rect(fill = "transparent"),
        legend.text       = element_text(size = 16),
        legend.title      = element_blank()
    )

    unaligned <- 100 - stats$Alignment_rate

    # Get prealignments if they exist
    prealignments <- getPrealignments(stats)

    if (!is.null(prealignments)) {
        for (i in 1:length(unlist(prealignments))) {
            unaligned <- unaligned - stats[, (paste("Alignment_rate",
                                           unlist(prealignments)[i], sep="_")),
                                           with=FALSE][[1]]
        }
    }
    # If the pipeline hasn't performed duplicate removal yet, or there are
    #  actually no duplicates, set the duplicate alignment rate to zero
    duplicates <- list()
    for (i in 1:length(stats$Alignment_rate)) {
        if (stats$Dedup_alignment_rate[i] == 0) {
            duplicates[[i]] <- as.numeric(0)
        } else {
            duplicates[[i]] <- as.numeric(stats$Alignment_rate[i] -
                                          stats$Dedup_alignment_rate[i])
        }
    }

    align_percent <- data.table(sample=stats$sample_name,
                                unaligned=unaligned,
                                duplicates=as.numeric(duplicates))

    # Split percents based on genome name
    genome_names   <- unique(stats$Genome)
    for (i in 1:length(genome_names)) {
        row_pos    <- grep(genome_names[i], stats$Genome)
        read_count <- rep(0, nrow(stats))
        reads      <- stats$Dedup_alignment_rate[stats$Genome==genome_names[i]]
        for (j in 1:length(grep('^0', reads))) {
            # If the pipeline has yet to remove duplicates, or there are actually
            # no duplicates, use the Alignment_rate parameter instead
            row_num        <- grep('^0', reads)[j]
            reads[row_num] <- stats$Alignment_rate[stats$Genome==genome_names[i]][row_num]
        }
        for (k in 1:length(reads)) {
            read_count[row_pos[k]] <- reads[k]
        }
        align_percent[, (genome_names[i]) := as.numeric(read_count)]
    }

    if (!is.null(prealignments)) {
        for (i in 1:length(unlist(prealignments))) {
            align_percent[, unlist(prealignments)[i] := as.double(
                stats[, (paste("Alignment_rate",
                      unlist(prealignments)[i], sep="_")),
                      with=FALSE][[1]])]
        }
        setcolorder(align_percent, c("sample", "unaligned",
                                    paste(unlist(prealignments)),
                                    "duplicates", paste(unique(stats$Genome))))
    } else {
        setcolorder(align_percent, c("sample", "unaligned", "duplicates",
                                    paste(unique(stats$Genome))))
    }

    align_percent$sample <- factor(align_percent$sample,
                                   levels=align_percent$sample)

    # Warn user if sample has aberrant values
    aberrant_samples <- data.frame(Sample=character(),
                                   Target=character(),
                                   Alignment_rate=numeric())
    aberrant <- FALSE
    for (i in 1:nrow(align_percent)) {
        for (j in 2:ncol(align_percent)) {
            if (align_percent[i][[j]] < 0 || align_percent[i][[j]] > 100) {
                aberrant_samples <- rbind(
                    aberrant_samples,
                    data.frame(Sample=align_percent$sample[i],
                               Target=colnames(align_percent[, ..j]),
                               Alignment_rate=align_percent[i][[j]]))
                align_percent[i, j] <- 0
                aberrant <- TRUE
            }
        }
    }
    if (aberrant) {
        message("Warning: Aberrant alignment rates detected and set to 0.")
        print(aberrant_samples, row.names=FALSE)
    }

    melt_align_percent <- melt(align_percent, id.vars="sample")
    upper_limit        <- 103
    chart_height       <- (length(unique(align_percent$sample))) * 0.75

    plot_colors <- data.table(unaligned="gray15")

    if (!is.null(prealignments)) {
        more_colors <- colorpanel(length(unlist(prealignments)), 
                                 low="#FFE595", mid="#F6CAA6", high="#F6F2A6")
        for (i in 1:length(unlist(prealignments))) {
            plot_colors[, unlist(prealignments)[i] := more_colors[i]]
        }
    }

    plot_colors[, duplicates := "#FC1E25"]
    more_colors <- colorpanel(length(genome_names), 
                             low="#4876FF", mid="#94D9CE", high="#7648FF")
    for (i in 1:length(genome_names)) {
        plot_colors[, (genome_names[i]) := more_colors[i]]
    }

    align_percent_plot <- (
        ggplot(melt_align_percent, aes(x=sample, y=as.numeric(value))) +
            geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) + 
            guides(fill=guide_legend(reverse=TRUE)) +
            labs(x="", y="Percent of reads") +
            scale_x_discrete(limits=rev(levels(melt_align_percent$sample))) +
            scale_y_continuous(limits=c(0,upper_limit), expand=c(0,0)) +
            scale_fill_manual(values=paste(plot_colors)) +
            coord_flip() + 
            align_theme)

    # Produce full-size PDF
    suppressWarnings(
        setPanelSize(
            align_percent_plot, 
            file=buildFilePath("_alignmentPercent.pdf", prj), 
            width=unit(8,"inches"), 
            height=unit(chart_height,"inches")
            )
        )

    # Produce snap-shot thumbnail PNG for HTML display
    # Limit to 25 samples max
    if (length(align_percent$sample) > 25) {
        align_percent_thumb <- align_percent[1:25]
        more_to_see         <- data.frame(t(c("...",
                                rep(0, (ncol(align_percent_thumb)-1)))))
        colnames(more_to_see)      <- colnames(align_percent_thumb)
        align_percent_thumb        <- rbind(align_percent_thumb, more_to_see)
        align_percent_thumb$sample <- droplevels(align_percent_thumb)$sample
        melt_align_percent_thumb   <- melt(align_percent_thumb,
                                           id.vars="sample")
        chart_height        <- ((length(unique(align_percent_thumb$sample))) *
                                0.75)
    } else {melt_align_percent_thumb <- melt_align_percent}

    thumb_percent_plot <- (
        ggplot(melt_align_percent_thumb, aes(x=sample, y=as.numeric(value))) +
            geom_col(aes(fill=variable), colour="black", size=0.25, width=0.8) + 
            guides(fill=guide_legend(reverse=TRUE)) +
            labs(x="", y="Percent of reads") +
            scale_x_discrete(limits=rev(levels(melt_align_percent_thumb$sample))) +
            scale_y_continuous(limits=c(0,upper_limit), expand=c(0,0)) +
            scale_fill_manual(values=paste(plot_colors)) +
            coord_flip() +
            align_theme)

    suppressWarnings(
        setPanelSize(
            thumb_percent_plot, 
            file=buildFilePath("_alignmentPercent.png", prj), 
            width=unit(8,"inches"), 
            height=unit(chart_height,"inches")
            )
        )
}


#' This function is meant to plot TSS scores.
#'
#' @param prj A PEPr Project object
#' @param stats A looper derived stats_summary.tsv file
#' @param cutoff A TSS enrichment cutoff score for low quality scores
#' @keywords TSS scores
#' @export
plotTSSscores <- function(prj, stats, cutoff=6) {
    align_theme <- theme(
        plot.background   = element_blank(),
        panel.grid.major  = element_blank(),
        panel.grid.minor  = element_blank(),
        panel.border      = element_rect(colour = "black", fill = NA, size = 0.5),
        panel.background  = element_blank(),
        axis.line         = element_blank(),
        axis.text.x       = element_text(face = "plain", color = "black", 
                                          size = 20, hjust = 0.5),
        axis.text.y       = element_text(face = "plain", color = "black",
                                          size = 20, hjust = 1),
        axis.title.x      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5, vjust = 0.5),
        axis.title.y      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5),
        plot.title        = element_text(face = "bold", color = "black", 
                                          size = 12, hjust = 0.5),
        axis.ticks        = element_line(size = 0.5),
        axis.ticks.length = unit(2, "mm"),
        legend.background = element_rect(fill = "transparent"),
        legend.text       = element_text(size = 16),
        legend.title      = element_blank()
    )

    # Establish red/green color scheme
    red_min      <- 0
    red_max      <- cutoff-0.01
    red_breaks   <- seq(red_min,red_max,0.01)
    red_colors   <- colorpanel(length(red_breaks),
                               "#AF0000","#E40E00","#FF7A6A")
    green_min    <- cutoff
    green_max    <- 30
    green_breaks <- seq(green_min,green_max,0.01)
    green_colors <- colorpanel(length(green_breaks)-1,
                               "#B4E896","#009405","#003B00")
    TSS_colors   <- c(red_colors, green_colors)

    # Organize data for plotting
    TSS_score <- tryCatch(
        {
            cbind.data.frame(sample=stats$sample_name, 
                             TSS=round(stats$TSS_score, digits=2),
                             QCcolor=(TSS_colors[round(stats$TSS_score+0.01,
                                                      digits=2)*100]))
        },
        error=function(e) {
            message("The summary file value(s) for the TSS score(s)",
                    " is/are missing.")
            message("Here's the original error message: ", e)
            return(NULL)
        },
        warning=function(e) {
            message("The summary file value(s) for the TSS score(s)",
                    " is/are incomplete.")
            message("Here's the original warning message: ", e)
            return(NULL)
        }
    )

    if (is.null(TSS_score)) {
        quit()
    }

    max_TSS      <- max(stats$TSS_score, na.rm=TRUE)
    upper_limit  <- roundUpNice(max_TSS)
    chart_height <- (length(unique(TSS_score$sample))) * 0.75

    TSS_score$sample <- factor(TSS_score$sample, levels=TSS_score$sample)

    TSS_plot <- ggplot(
        TSS_score, aes(x=sample, y=as.numeric(TSS))) +
        geom_bar(colour="black", size=0.25, width=0.7, stat="identity",
                 fill=rev(TSS_score$QCcolor)) +
        geom_hline(yintercept=6, linetype=2, color="grey", size=0.25) +
        labs(x="", y="TSS Enrichment Score") +
        scale_x_discrete(limits=rev(TSS_score$sample)) +
        scale_y_continuous(limits=c(0,upper_limit), expand=c(0,0)) +
        coord_flip() +
        align_theme

    # Produce both PDF and PNG
    suppressWarnings(
        setPanelSize(
            TSS_plot, file=buildFilePath("_TSSEnrichment.pdf", prj),
            width=unit(8,"inches"), 
            height=unit(chart_height,"inches")
            )
        )

    # Produce snap-shot thumbnail PNG for HTML display
    # Limit to 25 samples max
    if (length(TSS_score$sample) > 25) {
        TSS_score_thumb <- TSS_score[1:25, ]
        chart_height    <- (length(unique(TSS_score_thumb$sample))) * 0.75
        more_to_see     <- data.frame(t(c("...", "0", "#AF0000")))
        colnames(more_to_see) <- colnames(TSS_score_thumb)
        TSS_score_thumb       <- rbind(TSS_score_thumb, more_to_see)
    } else {TSS_score_thumb <- TSS_score}

    TSS_plot <- ggplot(
        TSS_score_thumb, aes(x=sample, y=as.numeric(TSS))) +
        geom_bar(colour="black", size=0.25, width=0.7, stat="identity",
                 fill=rev(TSS_score_thumb$QCcolor)) +
        geom_hline(yintercept=6, linetype=2, color="grey", size=0.25) +
        labs(x="", y="TSS Enrichment Score") +
        scale_x_discrete(limits=rev(TSS_score_thumb$sample)) +
        scale_y_continuous(limits=c(0,upper_limit), expand=c(0,0)) +
        coord_flip() +
        align_theme

    suppressWarnings(
        setPanelSize(
            TSS_plot, file=buildFilePath("_TSSEnrichment.png", prj),
            width=unit(8,"inches"),
            height=unit(chart_height,"inches")
            )
        )
}


#' This function is meant to plot library sizes.
#'
#' @param prj A PEPr Project object
#' @param stats A looper derived stats_summary.tsv file
#' @keywords library size
#' @export
plotLibSizes <- function(prj, stats) {
    align_theme <- theme(
        plot.background   = element_blank(),
        panel.grid.major  = element_blank(),
        panel.grid.minor  = element_blank(),
        panel.border      = element_rect(colour = "black", fill = NA, size = 0.5),
        panel.background  = element_blank(),
        axis.line         = element_blank(),
        axis.text.x       = element_text(face = "plain", color = "black", 
                                          size = 20, hjust = 0.5),
        axis.text.y       = element_text(face = "plain", color = "black",
                                          size = 20, hjust = 1),
        axis.title.x      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5, vjust = 0.5),
        axis.title.y      = element_text(face = "plain", color = "black", 
                                          size = 22, hjust = 0.5),
        plot.title        = element_text(face = "bold", color = "black", 
                                          size = 12, hjust = 0.5),
        axis.ticks        = element_line(size = 0.5),
        axis.ticks.length = unit(2, "mm"),
        legend.background = element_rect(fill = "transparent"),
        legend.text       = element_text(size = 16),
        legend.title      = element_blank()
    )

    picard_lib_size <- cbind.data.frame(
                        sample=stats$sample_name, 
                        LibSize=(as.numeric(stats$Picard_est_lib_size)/1000000))
    max_size        <- max(picard_lib_size$LibSize)
    upper_limit     <- roundUpNice(max_size)
    chart_height    <- (length(unique(picard_lib_size$sample))) * 0.75
    
    picard_lib_size$sample <- factor(picard_lib_size$sample, 
                                     levels = picard_lib_size$sample)
    
    lib_size_plot <- ggplot(picard_lib_size, 
                            aes(x = sample, y = as.numeric(LibSize))) +
        geom_col(colour="black", size = 0.25, width=0.8, 
                 fill = "royalblue1") + 
        labs(x = "", y = "Picard Library Size (M)") +
        scale_x_discrete(limits = rev(levels(picard_lib_size$sample))) +
        scale_y_continuous(limits = c(0,upper_limit), expand=c(0,0)) +
        coord_flip() + 
        align_theme
    
    # Produce both PDF and PNG
    suppressWarnings(
        setPanelSize(lib_size_plot,
                     file=buildFilePath("_LibSize.pdf", prj),
                     width=unit(8,"inches"),
                     height=unit(chart_height,"inches")
                    )
    )
    suppressWarnings(
        setPanelSize(lib_size_plot,
                     file=buildFilePath("_LibSize.png", prj),
                     width=unit(8,"inches"),
                     height=unit(chart_height,"inches")
                    )
    )
}


#' This function is meant to plot multiple summary graphs from the summary table 
#' made by the Looper summarize command
#'
#' @param pep A PEP configuration file
#' @keywords summarize PEPATAC
#' @export
summarizer <- function(pep) {
    # Load PEP configuration file
    prj <- suppressWarnings(Project(pep))

    # Build the stats summary file path
    summary_file <- file.path(config(prj)$metadata$output_dir,
                              paste0(config(prj)$name, "_stats_summary.tsv"))

    # Produce output directory
    dir.create(
        suppressMessages(
            file.path(config(prj)$metadata$output_dir, "summary")),
        showWarnings = FALSE)

    # read in stats summary file
    if (file.exists(summary_file)) {
        stats <- suppressWarnings(fread(summary_file,
                                        header=TRUE,
                                        check.names=FALSE))
    } else {
        warning("PEPATAC.R summarizer was unable to locate the summary file.")
        return(NULL)
    }

    # Set absent values in table to zero
    stats[is.na(stats)]   <- 0
    stats[is.null(stats)] <- 0
    stats[stats==""]      <- 0
    stats$Picard_est_lib_size[stats$Picard_est_lib_size=="Unknown"] <- 0

    # plot raw alignment statistics for the project
    plotAlignedRaw(prj, stats)

    # plot percent alignment statistics for the project
    plotAlignedPct(prj, stats)

    # plot the TSS scores for all project samples
    plotTSSscores(prj, stats)

    # plot library sizes if that was calculated
    if (any(!is.na(stats$Picard_est_lib_size))) {
        plotLibSize(prj, stats)
    }
    return(TRUE)
}


#' This function is meant to identify a project level set of consensus peaks.
#'
#' @param pep A PEP configuration file
#' @keywords consensus peaks
#' @export
consensusPeaks <- function(pep) {
  # Identify the project configuration file
  prj <- suppressWarnings(Project(pep))

  # warn about calling on variable width peaks
  #warning("PEPATAC_consensusPeaks is designed to produce a consensus peak
  #        set from *fixed* width peaks generated using the --peak_type fixed
  #        argument.")

  # generate initial peak set
  info <- capture.output({ 
    numSamples <- length(samples(prj)$sample_name)
  })
  peakList   <- data.table(peakFiles = list(numSamples))
  genome     <- invisible(config(prj)$implied_attributes[[1]][[1]]$genome)

  cPath <- system2(paste0("refgenie"), args=c(paste(" seek "),
                   paste0(genome, "/fasta.chrom_sizes")), stdout=TRUE)

  if (file.exists(cPath)) {
      cSize  <- fread(cPath)
      colnames(cSize) <- c("chrom", "size")
  } else {
      warning("PEPATAC_consensusPeaks.R was unable to load the chromosome sizes file.")
      message(paste0("Confirm that ", cPath, " is present before continuing."))
      return(NULL)
  }

  # generate paths to peak files
  info <- capture.output({ 
    peakList[,peakFiles:=.(list(unique(file.path(config(prj)$metadata$output_dir,
              paste0("results_pipeline/", samples(prj)$sample_name),
              paste0("peak_calling_", genome),
              paste0(samples(prj)$sample_name,
              "_peaks_fixedWidth_normalized.narrowPeak")))))]
  })

  final <- data.table(chrom=character(),
                      chromStart=integer(),
                      chromEnd=integer(),
                      name=character(),
                      score=numeric(),
                      strand=character(),
                      signalValue=numeric(),
                      pValue=numeric(),
                      qValue=numeric(),
                      peak=integer())

  fileList  <- peakList$peakFiles[[1]]

  if (length(fileList) > 1) {
      finalList <- character()
      for (i in 1:length(fileList)) {
          if(file.exists(file.path(fileList[i]))) {
              finalList <- append(finalList,fileList[i])
          }
      }
  } else if (length(fileList) == 1 ) {
      warning("PEPATAC_consensusPeaks.R found only a single peak file.")
      message("Does your project include more than one sample?")
      return(NULL)
  } else {
      warning("PEPATAC_consensusPeaks.R was unable to find any peak files.")
      message("Confirm peak files exist for your samples.")
      return(NULL)
  }

  if (length(finalList) >= 1) {
      # create combined peaks
      peaks           <- rbindlist(lapply(finalList, fread))
      colnames(peaks) <- c("chrom", "chromStart", "chromEnd", "name", "score",
                           "strand", "signalValue", "pValue", "qValue", "peak")
      setkey(peaks, chrom, chromStart, chromEnd)
      # keep highest scored peaks
      hits    <- foverlaps(peaks, peaks,
                           by.x=c("chrom", "chromStart", "chromEnd"),
                           type="any", which=TRUE, nomatch=0)
      scores  <- data.table(index=rep(1:nrow(peaks)), score=peaks$score)
      setkey(hits, xid)
      setkey(scores, index)
      out     <- hits[scores, nomatch=0]
      keep    <- out[out[,.I[which.max(score)],by=yid]$V1]
      indices <- unique(keep$xid)
      final   <- peaks[indices,]
      # trim any bad peaks (extend beyond chromosome)
      # can't be negative
      final[chromStart < 0, chromStart := 0]
      # can't extend past chromosome
      for (i in nrow(cSize)) {
          final[chrom == cSize$chrom[i] & chromEnd > cSize$size[i], chromEnd := cSize$size[i]]
      }

      # identify reproducible peaks
      peakSet <- copy(peaks)
      peakSet[,group := gsub("_peak.*","",name)]
      peakList <- splitDataTable(peakSet, "group")
      original <- copy(final)

      #' Count the number of times a peak appears across a list of peak files
      #'
      #' @param peakList A list of data.table objects representing narrowPeak files
      #' @param peakDT A single data.table of peaks
      countReproduciblePeaks <- function(peakList, peakDT) {
          setkey(peakDT, chrom, chromStart, chromEnd)
          setkey(peakList, chrom, chromStart, chromEnd)
          hits <- foverlaps(peakList, peakDT,
                            by.x=c("chrom", "chromStart", "chromEnd"),
                            type="any", which=TRUE, nomatch=0)
          # track the number of overlaps of final peak set peaks
          if (!"count" %in% colnames(peakDT)) {
              peakDT[hits$yid, count := 1]
              peakDT[is.na(get("count")), ("count") := 0]
          } else {
              peakDT[hits$yid, count := get("count") + 1] 
          }
      }

      invisible(sapply(peakList, countReproduciblePeaks, peakDT=final))

      # keep peaks present in 2 or more individual peak sets
      # keep peaks with score per million >= 5
      final <- final[count >= 2 & score >= 5,]
      final[,count := NULL]

      # Produce output directory
      dir.create(
          suppressMessages(file.path(config(prj)$metadata$output_dir, "summary")),
          showWarnings = FALSE)

      if (exists("final")) {
          # save consensus peak set
          fwrite(final, buildFilePath("_consensusPeaks.narrowPeak", prj),
                 sep="\t", col.names=FALSE)
      } else {
          warning("PEPATAC_consensusPeaks.R failed to produce a consensus peak file.")
          message("Check that individual peak files exist for your samples.")
          return(NULL)
      }
  } else {
      warning("PEPATAC_consensusPeaks.R was unable to produce a consensus peak file.")
      message("Consensus peak generation requires the '--peak-type fixed' parameter.")
      return(NULL)
  }
  return(buildFilePath("_consensusPeaks.narrowPeak", prj))
}
################################################################################
