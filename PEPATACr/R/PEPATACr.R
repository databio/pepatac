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


#' Create and return a file icon
#'
#' @keywords file icon
#' @param x Range of x-axis dimensions
#' @param y Range of y-axis dimensions
#' @export
fileIcon <- function(x=seq(0:275), y=seq(0:275)) {
    df    <- data.frame(x=x, y=y)
    minX  <- min(df$x)
    maxX  <- max(df$x)
    minY  <- min(df$y)
    maxY  <- max(df$y)
    pg    <- data.frame(x=c(225,225,255), y=c(265,235,235), group=c(1,1,1))
    image <- ggplot(df, aes(x, y)) +
        geom_rect(aes(xmin=(60/275*maxX), xmax=(225/275*maxX),
                      ymin=(10/275*maxY), ymax=(265/275*maxY)),
                  color=NA, fill="white") +
        geom_rect(aes(xmin=(225/275*maxX), xmax=(255/275*maxX),
                      ymin=(10/275*maxY), ymax=(235/275*maxY)),
                  color=NA, fill="white") +
        geom_polygon(data=pg, aes(x=x, y=y, group=group),
                     color="gray", fill="white", size=3) +
        # Outline the overall shape
        geom_line(data=data.frame(x=c((60/275*maxX),(255/275*maxX)),
                                  y=c((10/275*maxY),(10/275*maxY))),
                  aes(x=x,y=y), color="gray", size=3,
                  lineend="round", linejoin="bevel") +
        geom_line(data=data.frame(x=c((60/275*maxX),(60/275*maxX)),
                                  y=c((10/275*maxY),(265/275*maxY))),
                  aes(x=x,y=y), color="gray", size=3,
                  lineend="round", linejoin="bevel") +
        geom_line(data=data.frame(x=c((60/275*maxX),(222.5/275*maxX)),
                                  y=c((265/275*maxY),(265/275*maxY))),
                  aes(x=x,y=y), color="gray", size=3,
                  lineend="round", linejoin="bevel") +
        geom_line(data=data.frame(x=c((255/275*maxX),(255/275*maxX)),
                                  y=c((10/275*maxY),(232.5/275*maxY))),
                  aes(x=x,y=y), color="gray", size=3,
                  lineend="round", linejoin="bevel") +
        # Add page lines
        geom_line(data=data.frame(x=c(100/275*maxX,215/275*maxX),
                                  y=c(117.5/275*maxY,117.5/275*maxY)),
                  aes(x=x,y=y), color="gray", size=4, lineend="round") +
        geom_line(data=data.frame(x=c(100/275*maxX,215/275*maxX),
                                  y=c(137.5/275*maxY,137.5/275*maxY)),
                  aes(x=x,y=y), color="gray", size=4, lineend="round") +
        geom_line(data=data.frame(x=c(100/275*maxX,215/275*maxX),
                                  y=c(157.5/275*maxY,157.5/275*maxY)),
                  aes(x=x,y=y), color="gray", size=4, lineend="round") +
        theme_PEPATAC() +
        theme(panel.border = element_blank(),
              axis.line = element_blank(),
              axis.title.x=element_blank(),
              axis.text.x=element_blank(),
              axis.ticks.x=element_blank(),
              axis.title.y=element_blank(),
              axis.text.y=element_blank(),
              axis.ticks.y=element_blank())
    return(image)
}


#' Compute the axis value limit
#'
#' This function returns the index of ccurve_TOTAL_READS containing the
#' closest value to x_max
#' @param value An axis limit value.
#' @param ccurve_TOTAL_READS A vector of read counts from a sample.
#' @keywords preseq limit
#' @examples
#' computeLimit()
computeLimit <- function(value, ccurve_TOTAL_READS) {
    # This function returns the index of ccurve_TOTAL_READS containing the
    # closest value to x_max

    if (max(ccurve_TOTAL_READS) < value) {
        message(paste0("WARNING: ", value, " is set higher than the highest ",
                       "extrapolated point by preseq (value=",
                       max(ccurve_TOTAL_READS)))
    }
    first_point  <- 0
    middle_point <- 0
    last_point   <- length(ccurve_TOTAL_READS)
    iterations   <- 0
    while (first_point != last_point) {
        middle_point <- as.numeric((first_point + last_point)/2)
        middle_value <- as.numeric(ccurve_TOTAL_READS[middle_point])
        if (length(middle_value)==0) {
            return(middle_point)
        } else if (middle_value == value || iterations >= 10000) {
            return(middle_point)
        } else if (middle_value >= value) {
            last_point  <- middle_point - 1
        } else {
            first_point <- middle_point + 1
        }
        iterations <- iterations + 1
    }
    return(first_point)
}


#' Plot library complexity curves
#'
#' This function plots library complexity curves using data from
#' preseq and produces pdf/png output files.
#' Adapted from preseq_complexity_curves.py from
#' https://github.com/ewels/ngi_visualizations/tree/master/ngi_visualizations/preseq_complexity_curves
#'
#' @param ccurves A single preseq output file from one sample.
#' @param more_ccurves A list of additional preseq output files from more samples
#' @param coverage Use coverage on axes instead of read counts. Enter the number
#'                 of base pairs of your reference genome.
#' @param read_length Sequence read length, for use in coverage calculations.
#' @param real_counts_path File name for a file with three columns -
#'                         preseq filename, total number of reads, number of
#'                         unique reads
#'                         (unique is optional, file is whitespace delimited)
#' @param ignore_unique If FALSE, ignore information about unique read counts
#'                   found in real_counts_path file.
#' @param x_min Lower x-limit (default 0)
#' @param x_max Upper x-limit (default 500 million)
#' @keywords preseq library complexity
#' @export
#' @examples
#' data("ccurve")
#' data("counts")
#' plotComplexityCurves(ccurves = "ccurve", coverage=3099922541, read_length=30,
#'                      real_counts_path="counts")
plotComplexityCurves <- function(ccurves,
                                 coverage=0, read_length=0,
                                 real_counts_path=NA, ignore_unique=FALSE,
                                 x_min=0, x_max=500000000) {

    if (x_min < 0 || x_max <= x_min) {
        message(paste0("problem with x-min or x-max (", x_min, " ", x_max,
                       "). x-min must be >= 0 and < x-max"))
        quit(save = "no", status = 1, runLast = FALSE)
    }

    # Convert limit counts to coverage
    if (coverage > 0) {
        if (read_length == 0) {
            message("Error: --coverage specified but not --read_length")
            quit(save = "no", status = 1, runLast = FALSE)
        } else {
            coverage <- as.numeric(coverage) / as.numeric(read_length)
        }
        x_max    <- as.numeric(x_max) / coverage
        x_min    <- as.numeric(x_min) / coverage
    }

    # Get the real counts if we have them
    rcDT <- data.table(name = character(length(real_counts_path)),
                       total = integer(length(real_counts_path)),
                       unique = integer(length(real_counts_path)))

    if (exists(real_counts_path[1])) {
        rc_file    <- data.table(get(real_counts_path[1]))
        rcDT$name  <- basename(rc_file$V1)
        rcDT$total <- as.integer(rc_file$V2)
        if (ncol(rc_file) == 3 && !ignore_unique) {
            rcDT$unique <- as.integer(rc_file$V3)
        } else {
            rcDT$unique <- NA
        }

        if (length(real_counts_path) > 1) {
            for (rc in 2:length(real_counts_path)) {
                rc_file <- real_counts_path[rc]
                rcDT$name[rc]  <- basename(rc_file$V1)
                rcDT$total[rc] <- as.integer(rc_file$V2)
                if (ncol(rc_file) == 3 && !ignore_unique) {
                    rcDT$unique[rc] <- as.integer(rc_file$V3)
                } else {
                    rcDT$unique[rc] <- NA
                }
            }
        }
    } else if (!is.na(real_counts_path[1])) {
        for (rc in 1:length(real_counts_path)) {
            info <- file.info(file.path(real_counts_path[rc]))
            if (file.exists(real_counts_path[rc]) && info$size != 0) {
                rc_file        <- fread(real_counts_path[rc])
                rcDT$name[rc]  <- basename(rc_file$V1)
                rcDT$total[rc] <- as.integer(rc_file$V2)
                if (ncol(rc_file) == 3 && !ignore_unique) {
                    rcDT$unique[rc] <- as.integer(rc_file$V3)
                } else {
                    rcDT$unique[rc] <- NA
                }
            } else {
                message(paste0("Error loading real counts file: ",
                               real_counts_path[rc]))
                if (!file.exists(real_counts_path[rc])) {
                    message("File could not be found.")
                } else if (info$size == 0) {
                    message("File is empty.")
                }
                quit(save = "no", status = 1, runLast = FALSE)
            }
        }
    }

    # Convert real counts to coverage
    if (coverage > 0) {
        rcDT[,total  := as.numeric(total)  / coverage]
        rcDT[,unique := as.numeric(unique) / coverage]
    }

    # Set up plot params
    global_x_max_ccurve_limit <- 0
    global_y_max_ccurve_limit <- 0
    max_label_length          <- 0

    # Each ccurve will get a different color
    palette <- colorRampPalette(c("#999999", "#FFC107", "#27C6AB", "#004D40",
                                  "#B97BC8", "#009E73", "#C92404", "#E3E550",
                                  "#372B4C", "#E3DAC7", "#27CAE6", "#B361BC",
                                  "#897779", "#6114F8", "#19C42B", "#56B4E9"))

    clist <- data.table(TOTAL_READS = list(), EXPECTED_DISTINCT = list())
    ccurves  <- as.list(ccurves)
    colormap <- palette(length(ccurves))
    for (c in 1:length(ccurves)) {
        name        <- basename(tools::file_path_sans_ext(ccurves[[c]]))
        numFields   <- 2
        for(j in 1:numFields) name <- gsub("_[^_]*$", "", name)
        sample_name <- name
        #message(paste0("Processing ", sample_name))

        if (exists(ccurves[[c]])) {
            ctable <- data.table(get(ccurves[[c]]))
        } else if (file.exists(ccurves[[c]])) {
            ctable <- fread(ccurves[[c]])
        } else {
            stop(paste0("FileExistsError: ", ccurves[[c]],
                        " could not be found."))
            quit(save = "no", status = 1, runLast = FALSE)
        }

        if (coverage > 0) {
            if ("TOTAL_READS" %in% colnames(ctable)) {
                ccurve_TOTAL_READS <- as.numeric(ctable$TOTAL_READS) / coverage
            } else if ("total_reads" %in% colnames(ctable)) {
                ccurve_TOTAL_READS <- as.numeric(ctable$total_reads) / coverage
            }
            if ("EXPECTED_DISTINCT" %in% colnames(ctable)) {
                ccurve_EXPECTED_DISTINCT <- (
                    as.numeric(ctable$EXPECTED_DISTINCT) / coverage)
            } else if ("distinct_reads" %in% colnames(ctable)) {
                ccurve_EXPECTED_DISTINCT <- (
                    as.numeric(ctable$distinct_reads) / coverage)
            } else {
                messsage(paste0("Error, table ", c, " is not in the expected "))
                message("format... has it been generated with preseq?")
                quit(save = "no", status = 1, runLast = FALSE)
            }
        } else {
            if ("TOTAL_READS" %in% colnames(ctable)) {
                ccurve_TOTAL_READS <- ctable$TOTAL_READS
            } else if ("total_reads" %in% colnames(ctable)) {
                ccurve_TOTAL_READS <- ctable$total_reads
            }
            if ("EXPECTED_DISTINCT" %in% colnames(ctable)) {
                ccurve_EXPECTED_DISTINCT <- ctable$EXPECTED_DISTINCT
            } else if ("distinct_reads" %in% colnames(ctable)) {
                ccurve_EXPECTED_DISTINCT <- ctable$distinct_reads
            } else {
                messsage(paste0("Error, table ", c, " is not in the expected "))
                message("format... has it been generated with preseq?")
                quit(save = "no", status = 1, runLast = FALSE)
            }
        }
        if (c == 1) {
            clist <- data.table(
                SAMPLE_NAME = list(rep(sample_name,
                                   length(ccurve_TOTAL_READS))),
                TOTAL_READS = list(ccurve_TOTAL_READS),
                EXPECTED_DISTINCT = list(ccurve_EXPECTED_DISTINCT),
                COLOR = list(rep(colormap[c], length(ccurve_TOTAL_READS)))
            )
        } else {
            clist <- rbindlist(list(clist,
                data.table(SAMPLE_NAME = list(rep(sample_name,
                                              length(ccurve_TOTAL_READS))),
                           TOTAL_READS = list(ccurve_TOTAL_READS),
                           EXPECTED_DISTINCT = list(ccurve_EXPECTED_DISTINCT),
                           COLOR = list(rep(colormap[c],
                                        length(ccurve_TOTAL_READS))))),
                use.names=TRUE)
        }
    }

    x_min_ccurve_limit <- computeLimit(x_min, unlist(clist$TOTAL_READS))
    x_max_ccurve_limit <- computeLimit(x_max, unlist(clist$TOTAL_READS))
    if (x_max_ccurve_limit > global_x_max_ccurve_limit) {
        global_x_max_ccurve_limit <- x_max_ccurve_limit
    }
    if (unlist(clist$EXPECTED_DISTINCT)[x_max_ccurve_limit] > global_y_max_ccurve_limit) {
        if (x_max_ccurve_limit <= length(unlist(clist$EXPECTED_DISTINCT))) {
            global_y_max_ccurve_limit <- unlist(clist$EXPECTED_DISTINCT)[x_max_ccurve_limit]
        } else {
            x_max_ccurve_limit <- length(unlist(clist$EXPECTED_DISTINCT))
        }
    }
    # Add a few points to be sure
    x_max_ccurve_limit <- x_max_ccurve_limit + 3

    sn <- clist$SAMPLE_NAME[[1]][x_min_ccurve_limit:x_max_ccurve_limit]
    tr <- clist$TOTAL_READS[[1]][x_min_ccurve_limit:x_max_ccurve_limit]
    ed <- clist$EXPECTED_DISTINCT[[1]][x_min_ccurve_limit:x_max_ccurve_limit]
    co <- clist$COLOR[[1]][x_min_ccurve_limit:x_max_ccurve_limit]
    df <- data.frame(sample_name = sn,
                     total_reads = tr,
                     expected_distinct = ed,
                     color = co)
    if (nrow(clist) > 1) {
        for (i in 2:nrow(clist)) {
            sn <- clist$SAMPLE_NAME[[i]][x_min_ccurve_limit:x_max_ccurve_limit]
            tr <- clist$TOTAL_READS[[i]][x_min_ccurve_limit:x_max_ccurve_limit]
            ed <- clist$EXPECTED_DISTINCT[[i]][x_min_ccurve_limit:x_max_ccurve_limit]
            co <- clist$COLOR[[i]][x_min_ccurve_limit:x_max_ccurve_limit]
            df <- rbind(df, data.frame(sample_name = sn,
                                       total_reads = tr,
                                       expected_distinct = ed,
                                       color = co))
        }
    }

    # Plot by millions of reads
    plottingFactor <- 1000000

    df$total_reads       <- df$total_reads/plottingFactor
    df$expected_distinct <- df$expected_distinct/plottingFactor
    rcDT$total  <- rcDT$total/plottingFactor
    rcDT$unique <- rcDT$unique/plottingFactor
    x_max       <- x_max/plottingFactor

    # Plot the curve
    fig <- ggplot(df, aes(total_reads,
                          expected_distinct,
                          group = sample_name,
                          col=color)) + geom_line()

    # Plot the real data if we have it
    numFields   <- 2
    for(j in 1:numFields) rcDT$name <- gsub("_[^_]*$", "", rcDT$name)
    rcDT$color <- colormap

    if (any(rcDT$total > 0) && !any(is.na(rcDT$unique)) && !ignore_unique) {
        fig <- fig + geom_point(data=rcDT,
                                aes(total, unique, col=color),
                                shape=23, size=3)
        message(paste0("INFO: Found real counts for ",
                       paste(rcDT$name, sep=","), " - Total (M): ",
                       rcDT$total, " Unique (M): ",
                       rcDT$unique, "\n"))
    } else if (any(rcDT$total > 0)) {
        if (max(rcDT$total) > max(df$total_reads)) {
            message(paste0("WARNING: Max total reads (", max(rcDT$total),
                           ") > ", "max preseq value (", max(df$total_reads),
                           ") - skipping..."))
        } else {
            interp <- approx(df$total_reads, df$expected_distinct, rcDT$total)$y
            fig <- fig + geom_point(data=rcDT,
                                    aes(total, interp, col=color),
                                    shape=23, size=3)
            message(paste0("INFO: Found real counts for ",
                           paste(rcDT$name, sep=","), " - Total (M): ",
                           rcDT$total, " (preseq unique reads (M): ",
                           interp, ")\n"))
        }
    } else {
        message(paste0("INFO: No real counts provided."))
    }

    fig <- fig + geom_abline(intercept = 0, slope = 1, linetype="dashed") 

    # Set the axis limits
    max_total <- 0
    if (any(rcDT$total > 0)) {
        max_total <- as.numeric(max(rcDT$total))
    }

    if (x_max < max_total) {
        message(paste0("WARNING: x-max value ", x_max,
                       " is less than max real data ", max_total))
    }

    max_unique <- 0
    if (!any(is.na(rcDT$unique)) && any(rcDT$unique > 0)) {
        max_unique <- as.numeric(max(rcDT$unique))
        max_unique <- max_unique + (max_unique * 0.1)
    }
    preseq_ymax <- global_y_max_ccurve_limit
    preseq_ymax <- preseq_ymax + (global_y_max_ccurve_limit * 0.1)

    default_ylim <- 100000
    if (coverage > 0) {
        default_ylim <- as.numeric(default_ylim) / coverage
    }

    # Adjust limits by plottingFactor
    default_ylim <- default_ylim/plottingFactor
    preseq_ymax  <- preseq_ymax/plottingFactor

    fig <- fig +
        coord_cartesian(xlim=c(x_min, x_max),
                        ylim = c(default_ylim,
                                 max(preseq_ymax, max_unique)))

    if (preseq_ymax < max_unique) {
        message(paste0("WARNING: y-max value changed from default ",
                       preseq_ymax, " to the max real data ",
                       max_unique))
    }

    # label the axis
    # Change labels if we're using coverage
    if (coverage > 0) {
        if (!any(is.na(rcDT$unique)) && any(rcDT$unique > 0)) {
            fig <- fig +
                labs(x = paste0("Total coverage (incl. duplicates)"),
                     caption = paste0("Points show read count versus ",
                                      "deduplicated read counts ",
                                      "(externally calculated)"))
        } else if (any(rcDT$total > 0)) {
            fig <- fig +
                labs(x = "Total coverage (incl. duplicates)",
                     caption = paste0("Points show read count versus projected ",
                                      "unique read counts on the curves"))
        } else {
            fig <- fig +
                labs(x = "Total coverage (incl. duplicates)")
        }
        fig <- fig +
            labs = (y = "Unique coverage")
    } else {
        if (!any(is.na(rcDT$unique)) && any(rcDT$unique > 0)) {
            fig <- fig +
                labs(x = "Total reads (M) (incl. duplicates)",
                     caption = paste0("Points show read count versus deduplicated ",
                                      "read counts (externally calculated)"))
        } else if (any(rcDT$total > 0)) {
            fig <- fig +
                labs(x = "Total reads (M) (incl. duplicates)",
                     caption = paste0("Points show externally calculated read ",
                                      "counts on the curves"))
        } else {
            fig <- fig +
                labs(x = "Total reads (M) (incl. duplicates)")
        }
        fig <- fig +
            labs(y = "Unique reads (M)")
    }

    fig <- fig +
        labs(col = "") +
        scale_color_discrete(labels=c(clist$SAMPLE_NAME)) +
        theme_PEPATAC() +
        theme(legend.position = "right",
              plot.caption = element_text(size = 8, face = "italic"))

    # inset zoom plot
    zoom_theme <- theme(legend.position = "none",
                        axis.line = element_blank(),
                        axis.text.x = element_blank(),
                        axis.text.y = element_blank(),
                        axis.ticks = element_blank(),
                        axis.title.x = element_blank(),
                        axis.title.y = element_blank(),
                        aspect.ratio = 1,
                        panel.grid.major = element_blank(),
                        panel.grid.minor = element_blank(),
                        panel.background = element_rect(color='black'),
                        plot.margin = unit(c(0.1,0.1,-6,-6),"mm"))

    if (!any(is.na(rcDT$unique)) && any(rcDT$unique > 0)) {
        zoom_fig <- ggplot(df, aes(total_reads,
                       expected_distinct,
                       group = sample_name,
                       col=color)) +
            geom_line() +
            geom_abline(intercept = 0, slope = 1, linetype="dashed") +
            coord_cartesian(xlim = c(0,max(rcDT$unique)*2),
                            ylim = c(0,max(rcDT$unique)*2)) +
            geom_point(data=rcDT,
                       aes(total, unique, col=color),
                       shape=23, size=3) +
            theme_classic(base_size=14) +
            zoom_theme
        g   <- ggplotGrob(zoom_fig)
        fig <- fig +
            annotation_custom(grob = g,
                              xmin = x_max / 2,
                              xmax = x_max,
                              ymin = 10,
                              ymax = max(preseq_ymax, max_unique)/2)
    } else if (any(rcDT$total > 0)) {
        interp <- approx(df$total_reads, df$expected_distinct, rcDT$total)$y
        zoom_fig <- ggplot(df, aes(total_reads,
                                   expected_distinct,
                                   group = sample_name,
                                   col=color)) +
            geom_line() +
            geom_abline(intercept = 0, slope = 1, linetype="dashed") +
            coord_cartesian(xlim = c(0,max(rcDT$total)*2),
                            ylim = c(0,max(rcDT$total)*2)) +
            geom_point(data=rcDT,
                       aes(total, interp, col=color),
                       shape=23, size=3) +
            theme_classic(base_size=14) +
            zoom_theme
        g   <- ggplotGrob(zoom_fig)
        fig <- fig +
            annotation_custom(grob = g,
                              xmin = x_max / 2,
                              xmax = x_max,
                              ymin = 10,
                              ymax = max(preseq_ymax, max_unique)/2)
    }

    # Don't include legend for single sample plots
    if (length(ccurves) == 1) {
        fig <- fig + theme(legend.position = "none")
    }

    return(fig)
}


# #' TODO: Use GenomicDistributions for calculation and plotting.
# #'       *Currently too memory intensive*
# #' Calculate and return a plot of either the expected or cumulative 
# #' distribution of regions in a provided list of genomic partitions.
# #'
# #' @param query A GenomicRanges or GenomicRangesList object with query regions.
# #' @param partition_list An ORDERED and NAMED list of genomic partitions
# #'     GRanges. This list must be in priority order; the input will be assigned
# #'     to the first partition it overlaps.
# #' @param feature_names An optional character vector of feature names, in the 
# #'                      same order as the partitionList object.
# #' @param type Plot either the 'expected' or 'cumulative' distribution.
# #' @export
# plotFRiF <- function(query, partition_list, feature_names=NULL,
                     # type=c("expected", "cumulative")) {
    # if (type == "expected") {
        # ep <- calcExpectedPartitions(query, partition_list)
        # return(plotExpectedPartitions(ep))
    # } else if (type == "cumulative") {
        # cp <- calcCumulativePartitions(query, partition_list)
        # return(plotCumulativePartitions(cp))
    # } else {
        # warning(
            # paste0(type, " is not a recognized option for partitionPlot()")
        # )
        # return(ggplot())
    # }
# }


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
    # if no regions have coverage, file is now empty

    if (reads) {
        bedFile <- cbind(bedFile, cumsum=cumsum(bedFile$count))
    } else {
        bedFile <- cbind(bedFile, cumsum=cumsum(bedFile$bases))
    }

    bedFile <- cbind(bedFile, cumSize=cumsum(bedFile$size))
    bedFile <- cbind(bedFile, frip=bedFile$cumsum/as.numeric(total))
    if (is.empty(bedFile)) {
        return(cbind(bedFile, numfeats=as.numeric()))
    } else {
        return(cbind(bedFile, numfeats=as.numeric(1:nrow(bedFile))))
    }
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
        if (is.empty(bedCov)) {
            labels[1,] <- c(0, 0, name,0, "#FF0703")
            bedCov$feature <- as.character()
        } else {
            labels[1,] <- c(0.95*max(log10(bedCov$cumSize)),
                max(bedCov$frip)+0.001, name,
                round(max(bedCov$frip),2), "#FF0703")
            bedCov$feature <- name
        }
        feature_dist[1,] <- c(name,
                nrow(bed), as.numeric(sum(abs(bed$V3-bed$V2))),
                as.numeric((sum(abs(bed$V3-bed$V2))/genome_size)))
    } else if (file.exists(file.path(bedFile[1])) && info$size != 0) {
        bed <- read.table(file.path(bedFile[1]))
        if (nrow(bed[which(bed$V5 != 0),]) == 0) {
            message(paste0(name, "  has no covered features"))
        } else {
            bedCov     <- calcFRiF(bed, num_reads, reads)
            name       <- basename(tools::file_path_sans_ext(bedFile[1]))
            name       <- gsub(sample_name, "", name, fixed=TRUE)
            name       <- gsub("^.*?_", "", name)
            numFields  <- 1
            for(i in 1:numFields) name <- gsub("_[^_]*$", "", name)
            if (is.empty(bedCov)) {
                labels[1,] <- c(0, 0, name, 0, "#FF0703")
                bedCov$feature <- as.character()
            } else {
                labels[1,] <- c(0.95*max(log10(bedCov$cumSize)),
                    max(bedCov$frip)+0.001, name,
                    round(max(bedCov$frip),2), "#FF0703")
                bedCov$feature <- name
            }
            feature_dist[1,] <- c(name, nrow(bed),
                as.numeric(sum(abs(bed$V3-bed$V2))),
                as.numeric((sum(abs(bed$V3-bed$V2))/genome_size)))
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
                name       <- gsub(sample_name, "", name, fixed=TRUE)
                name       <- gsub("^.*?_", "", name)
                numFields  <- 1
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

            bed <- bed[complete.cases(bed), ]
            if (nrow(bed) > 0) {
                if (max(bed[,4], na.rm=TRUE) > 0) {
                    if (exists("covDF")) {
                        covFile <- calcFRiF(bed, num_reads, reads)
                        covFile$feature <- name
                        covDF   <- rbind(covDF, covFile)
                        labels  <- rbind(labels,
                            c(0.95*max(log10(covFile$cumSize)),
                            max(covFile$frip)+0.001,
                            name, round(max(covFile$frip),2),
                            plotColors[i]))
                        feature_dist <- rbind(feature_dist,
                            c(name, nrow(bed),
                            as.numeric(sum(abs(bed$V3-bed$V2))),
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
                            c(name, nrow(bed),
                            as.numeric(sum(abs(bed$V3-bed$V2))),
                            as.numeric((sum(abs(bed$V3-bed$V2))/genome_size))))
                    }
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
        info <- file.info(file.path(fragL_count))
        if (info$size != 0) {
            dat <- fread(fragL_count)
        } else {
            warning(paste0(fragL_count, " is an empty file."))
            return(ggplot())
        }
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


#' Check if a data frame is empty.
#'
#' Return TRUE if provided data frame is NULL, has no rows, or has no columns.
#'
#' @param df A data frame to check for emptiness
is.empty <- function(df) {
  (is.null(df) || nrow(df) == 0 || ncol(df) == 0)
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
splitDataTable <- function(DT, split_factor) {
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
    f   <- file(path)
    ext <- summary(f)$class
    close.connection(f)
    ext
}


#' Derive the sample name from input file and return with full path
#'
#' @param path A path to a file for which you wish to extract the sample name
#' @param num_fields An integer representing the number of fields to strip
#' @param delim A delimiter for the fields splitting a path or string
#'
#' @export
sampleName <- function(path, num_fields=2, delim='_') {
    name <- basename(tools::file_path_sans_ext(path))
    if(num_fields == 0) {return(name)}
    for(n in 1:num_fields) name <- gsub(paste0(delim, "[^", delim, "]*$"), "", name)
    return(paste(dirname(path), name, sep="/"))
}


#' Handle warnings and errors while returning value from calcChromBinsRef()
#'
#' @param x A GenomicRanges or GenomicRangesList object with query regions
#' @param y A character vector representing a known genome that will be used
#'     to grab chromosome sizes with \code{getChromSizes}
tryCatchChromBins <- function(x, y) {
  z <- 
    tryCatch(
      withCallingHandlers(
        {
          msg <- ""
          list(value = calcChromBinsRef(x, y), msg = msg)
        }, 
        warning = function(e) {
          msg <<- trimws(paste0("WARNING: ", e))
          invokeRestart("muffleWarning")
        }
      ), 
      error = function(e) {
        return(list(value = NA, msg = trimws(paste0("ERROR: ", e))))
      }, 
      finally = {
      }
    )
  return(z)
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

    sample_path <- sampleName(input)

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
        colnames(in_bed) <- c("chr", "start", "end",
                              "name", "score", "strand")
    } else {
        in_bed <- in_file[,c(1,2,3)]
        colnames(in_bed) <- c("chr", "start", "end")
    } 

    # Convert to GRanges Object
    query  <- makeGRangesFromDataFrame(in_bed, keep.extra.columns=TRUE)

    if (tolower(plot) == "chromosome") {
        # Chromosome distribution plot
        x <- tryCatchChromBins(query, genome)

        if (x$msg != "") {
            message(x$msg)
        }
        
        if (x$value == "" || is.na(x$value) || is.null(x$value)) {
            return(ggplot())
        }
        # Don't plot lowest 10% represented chromosomes
        tbl    <- data.frame(table(x$value$chr))
        cutoff <- quantile(tbl$Freq, 0.1)
        keep   <- tbl[tbl$Freq > cutoff, 1]
        x      <- x$value[x$value$chr %in% keep,]
        if (nrow(x) > 0) {
            ga_plot <- plotChromBins(x)
            return(ga_plot)
        } else {
            message("Too few peaks to plot. Check the genome alignment rates.")
            return(ggplot())
        }
    } else if (tolower(plot) == "tss") {
        # Feature distance distribution plots
        x <- tryCatch(
            {
                suppressMessages(calcFeatureDistRefTSS(query, genome))
            },
            error=function(e) {
                message("calcFeatureDistRefTSS(): ", e)
                return(NULL)
            },
            warning=function(e) {
                message("calcFeatureDistRefTSS(): ", e)
                return(NULL)
            }
        )

        if (is.null(x)) {
            return(ggplot())
        }
        
        if (!is.na(x[1])) {
            TSS_plot <- plotFeatureDist(x, featureName="TSS")
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
        
        colnames(anno_file) <- c("chr", "start", "end",
                                 "name", "scores", "strand")
        priority <- sapply(unique(anno_file$name), list)
        dt_list  <- splitDataTable(anno_file, "name")
        dt_list  <- dt_list[names(priority)]
        gl       <- lapply(dt_list, GenomicRanges::makeGRangesFromDataFrame)

        if (genome %in% knownGenomes) {
            gp   <- suppressWarnings(
                      GenomicDistributions::calcPartitions(
                        query, gl, remainder = "Intergenic"))
        } else {
            gp   <- suppressWarnings(
                      GenomicDistributions::calcPartitions(
                        query, gl, remainder = "Other"))
        }

        gp_plot   <- GenomicDistributions::plotPartitions(gp)

        return(gp_plot)
    } else {
        # Default to chromosome distribution plot
        # Chromosome distribution plot
        # Chromosome distribution plot
        x <- chromBins(query, genome)

        if (x$msg != "") {
            message(x$msg)
        }
        
        if (x$value == "" || is.na(x$value) || is.null(x$value)) {
            return(ggplot())
        }
        # Don't plot lowest 10% represented chromosomes
        tbl    <- data.frame(table(x$value$chr))
        cutoff <- quantile(tbl$Freq, 0.1)
        keep   <- tbl[tbl$Freq > cutoff, 1]
        x      <- x$value[x$value$chr %in% keep,]
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
        colnames(chrom_sizes) <- c("chr", "size")
    } else {
        err_msg <- paste0("Could not find: ", file.path(chr_sizes))
        stop(err_msg)
    }

    info = file.info(file.path(input))
    if (file.exists(file.path(input)) && info$size != 0) {
        np           <- fread(file.path(input))
        colnames(np) <- c("chr", "start", "end", "name", "score", "strand",
                          "signalValue", "pValue", "qValue", "peak")
    } else {
      out_file <- file.path(paste0(sample_path, "_peaks.bigBed"))
      system2(paste("touch"), out_file)
      quit()
    }

    # some 'score' values are greater than 1000 (more than BED format allows); 
    # rescale the scores to 0-1000 based on the 99th percentile being 1000
    nineNine <- quantile(np$score, 0.99)
    np$score <- replace(np$score, np$score > nineNine, nineNine)
    np$score <- rescale(log(np$score), to = c(0, 1000))

    np           <- merge(np, chrom_sizes, by="chr", sort=FALSE)
    colnames(np) <- c("chr", "start", "end", "name", "score", "strand",
                      "signalValue", "pValue", "qValue", "peak", "max_size")

    # make sure 'end' positions are not greater than the max chrom.size
    for (j in 1:nrow(np)) {
        if (np$end[j] > np$max_size[j]) np$end[j] <- np$max_size[j]
    }
    np       <- np[,-11]
    np$score <- as.integer(np$score)  # ensure score is an integer value
    
    # can't extend past chromosome
    for (i in nrow(chrom_sizes)) {
        np[chr == c_size$chr[i] & end > c_size$size[i], end := c_size$size[i]]
    }

    tmp_file <- file.path(paste0(sample_path, "_peaks.bed"))
    as_file  <- file.path(paste0(dirname(sample_path), "bigNarrowPeak.as"))
    out_file <- file.path(paste0(sample_path, "_peaks.bigBed"))

    fwrite(np, file=tmp_file, col.names=FALSE, row.names=FALSE,
           quote=FALSE, sep='\t')

    cat("table bigNarrowPeak\n", 
    "\"BED6+4 Peaks of signal enrichment based on pooled, normalized (interpreted) data.\"\n",
    "(\n",
    "     string chrom;        \"Reference sequence chromosome or scaffold\"\n",
    "     uint   start;   \"Start position in chromosome\"\n",
    "     uint   end;     \"End position in chromosome\"\n",
    "     string name;         \"Name given to a region (preferably unique). Use . if no name is assigned\"\n",
    "     uint   score;        \"Indicates how dark the peak will be displayed in the browser (0-1000) \"\n",
    "     char[1]  strand;     \"+ or - or . for unknown\"\n",
    "     float  signalValue;  \"Measurement of average enrichment for the region\"\n",
    "     float  pValue;       \"Statistical significance of signal value (-log10). Set to -1 if not used.\"\n",
    "     float  qValue;       \"Statistical significance with multiple-test correction applied (FDR -log10). Set to -1 if not used.\"\n",
    "     int   peak;          \"Point-source called for this peak; 0-based offset from start. Set to -1 if no point-source called.\"\n",
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
#' @param sample_name Sample name character string
#' @param chr_sizes Genome chromosome sizes file. <Chr> <Size>
#' @param output Output file name.
#' @param normalize Remove overlaps and normalize the score.
#' @keywords reduce fixed peaks
#' @export
reducePeaks <- function(input, sample_name, chr_sizes, output=NA, normalize=FALSE) {
    info <- file.info(file.path(input))
    if (file.exists(file.path(input)) && info$size != 0) {
        peaks           <- fread(file.path(input))
        if (ncol(peaks) == 6) {
            colnames(peaks) <- c("chr", "start", "end",
                                 "name", "score", "strand")
            bedOnly <- TRUE
        } else if (ncol(peaks) == 10) {
            colnames(peaks) <- c("chr", "start", "end",
                                 "name", "score", "strand",
                                 "signalValue", "pValue", "qValue", "peak")
            bedOnly <- FALSE
        } else {
            warning(paste0(input, " did not contain a recognizable number", 
                           " of columns (", ncol(peaks), ")"))
            rm(peaks)
        }
        setkey(peaks, chr, start, end)
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
        colnames(c_size) <- c("chr", "size")
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
                           by.x=c("chr", "start", "end"),
                           type="any", which=TRUE, nomatch=0)
        if (bedOnly) {
            # Only have the "score" to rank peaks
            qVals <- data.table(index=rep(1:nrow(peaks)), qValue=peaks$score)
        } else {
            qVals <- data.table(index=rep(1:nrow(peaks)), qValue=peaks$qValue)
        }
        setkey(hits, xid)
        setkey(qVals, index)
        out     <- hits[qVals, nomatch=0]
        keep    <- out[out[,.I[which.max(qValue)],by=yid]$V1]
        indices <- unique(keep$xid)
        final   <- peaks[indices,]
        # trim any bad peaks (extend beyond chromosome)
        # can't be negative
        final[start < 0, start := 0]
        # ensure sorted
        setorderv(final, cols = c("chr", "start"))
        # can't extend past chromosome
        for (i in nrow(c_size)) {
            final[chr == c_size$chr[i] & end > c_size$size[i],
                  end := c_size$size[i]]
        }
        if (normalize) {
            # normalize peak scores for cross sample comparison
            final[, score := .(score/(sum(score)/1000000))]
        }
        final[score < 0, score := 0]
        # save final peak set
        if (is.na(output)) {
            file_path <- file.path(dirname(input), sample_name)
            fwrite(final, paste0(file_path, "_peaks_normalized.narrowPeak"),
                   sep="\t", col.names=FALSE)
        } else {
            fwrite(final, output, sep="\t", col.names=FALSE)
        }

    } else {
        err_msg = paste0("PEPATACr reducePeaks() failed. ", 
                         "Check peak and chrom.sizes files.")
        warning(err_msg)
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
#' @param summary_dir A PEP project summary directory path
#' @param stats A looper derived stats_summary.tsv file
#' @keywords aligned reads raw
#' @export
plotAlignedRaw <- function(prj, summary_dir, stats) {
    # Convenience
    project_name <- config(prj)$name

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

    align_raw$sample <- factor(align_raw$sample,
                               levels = unique(align_raw$sample))

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
    output_file <- file.path(summary_dir,
                             paste0(project_name, "_alignmentRaw.pdf"))
    suppressWarnings(
        setPanelSize(
            align_raw_plot,
            file=output_file,
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

    output_file <- file.path(summary_dir,
                             paste0(project_name, "_alignmentRaw.png"))
    suppressWarnings(
        setPanelSize(
            thumb_raw_plot,
            file=output_file,
            width=unit(8,"inches"),
            height=unit(chart_height,"inches")
            )
        )
}


#' This function is meant to plot project level percent aligned reads.
#'
#' @param prj A PEPr Project object
#' @param summary_dir A PEP project summary directory path
#' @param stats A looper derived stats_summary.tsv file
#' @keywords aligned reads percent
#' @export
plotAlignedPct <- function(prj, summary_dir, stats) {
    # Convenience
    project_name <- config(prj)$name

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
                                   levels=unique(align_percent$sample))

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
    output_file <- file.path(summary_dir,
                             paste0(project_name, "_alignmentPercent.pdf"))
    suppressWarnings(
        setPanelSize(
            align_percent_plot, 
            file=output_file, 
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

    output_file <- file.path(summary_dir,
                             paste0(project_name, "_alignmentPercent.png"))
    suppressWarnings(
        setPanelSize(
            thumb_percent_plot, 
            file=output_file, 
            width=unit(8,"inches"), 
            height=unit(chart_height,"inches")
            )
        )
}


#' This function is meant to plot TSS scores.
#'
#' @param prj A PEPr Project object
#' @param summary_dir A PEP project summary directory path
#' @param stats A looper derived stats_summary.tsv file
#' @param cutoff A TSS enrichment cutoff score for low quality scores
#' @keywords TSS scores
#' @export
plotTSSscores <- function(prj, summary_dir, stats, cutoff=6) {
    # Convenience
    project_name <- config(prj)$name

    align_theme <- theme(
        plot.background   = element_blank(),
        panel.grid.major  = element_blank(),
        panel.grid.minor  = element_blank(),
        panel.border      = element_rect(colour = "black", fill = NA,
                                         size = 0.5),
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

    TSS_score$sample <- factor(TSS_score$sample,
                               levels=unique(TSS_score$sample))

    TSS_plot <- ggplot(TSS_score, aes(x=sample, y=as.numeric(TSS))) +
        geom_bar(colour="black", size=0.25, width=0.7, stat="identity",
                 fill=TSS_score$QCcolor) +
        geom_hline(yintercept=6, linetype=2, color="grey", size=0.25) +
        labs(x="", y="TSS Enrichment Score") +
        scale_x_discrete(limits=rev(TSS_score$sample)) +
        scale_y_continuous(limits=c(0,upper_limit), expand=c(0,0)) +
        coord_flip() +
        align_theme

    # Produce both PDF and PNG
    output_file <- file.path(summary_dir,
                             paste0(project_name, "_TSSEnrichment.pdf"))
    suppressWarnings(
        setPanelSize(
            TSS_plot, file=output_file,
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

    output_file <- file.path(summary_dir,
                             paste0(project_name, "_TSSEnrichment.png"))
    suppressWarnings(
        setPanelSize(
            TSS_plot, file=output_file,
            width=unit(8,"inches"),
            height=unit(chart_height,"inches")
            )
        )
}


#' This function is meant to plot library sizes.
#'
#' @param prj A PEPr Project object
#' @param summary_dir A PEP project summary directory path
#' @param stats A looper derived stats_summary.tsv file
#' @keywords library size
#' @export
plotLibSizes <- function(prj, summary_dir, stats) {
    # Convenience
    project_name <- config(prj)$name

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
                                     levels=unique(picard_lib_size$sample))
    
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
    output_file <- file.path(summary_dir, paste0(project_name, "_LibSize.pdf"))
    suppressWarnings(
        setPanelSize(lib_size_plot,
                     file=output_file,
                     width=unit(8,"inches"),
                     height=unit(chart_height,"inches")
                    )
    )
    output_file <- file.path(summary_dir, paste0(project_name, "_LibSize.png"))
    suppressWarnings(
        setPanelSize(lib_size_plot,
                     file=output_file,
                     width=unit(8,"inches"),
                     height=unit(chart_height,"inches")
                    )
    )
}


#' This function is meant to plot multiple summary graphs from the summary table 
#' made by the Looper summarize command
#'
#' @param project A PEPr Project object
#' @param output_dir A PEP project output directory path
#' @keywords summarize PEPATAC
#' @export
summarizer <- function(project, output_dir) {
    # Build the stats summary file path
    summary_file <- file.path(output_dir,
        paste0(pepr::config(project)$name, "_stats_summary.tsv"))

    write(paste0("Creating summary plots..."), stdout())
    # Set the output directory
    summary_dir <- suppressMessages(file.path(output_dir, "summary"))
    # Produce output directory (if needed)
    dir.create(summary_dir, showWarnings = FALSE)

    # read in stats summary file
    if (file.exists(summary_file)) {
        stats <- suppressWarnings(fread(summary_file,
                                        header=TRUE,
                                        check.names=FALSE))
    } else {
        warning("PEPATAC.R summarizer was unable to locate the summary file.")
        return(FALSE)
    }

    # Set absent values in table to zero
    stats[is.na(stats)]   <- 0
    stats[is.null(stats)] <- 0
    stats[stats==""]      <- 0
    stats$Picard_est_lib_size[stats$Picard_est_lib_size=="Unknown"] <- 0

    # plot raw alignment statistics for the project
    plotAlignedRaw(project, summary_dir, stats)

    # plot percent alignment statistics for the project
    plotAlignedPct(project, summary_dir, stats)

    # plot the TSS scores for all project samples
    plotTSSscores(project, summary_dir, stats)

    # plot library sizes if that was calculated
    if (any(!is.na(stats$Picard_est_lib_size))) {
        plotLibSize(project, summary_dir, stats)
    }
    return(TRUE)
}


#' Internal helper function for \code{collapsePeaks}
#' Count the number of times a peak appears across a list of peak files
#'
#' @param peak_list A list of data.table objects representing
#'                  narrowPeak files
#' @param peak_DT A single data.table of peaks
countReproduciblePeaks <- function(peak_list, peak_DT) {
    setkey(peak_DT, chr, start, end)
    setkey(peak_list, chr, start, end)
    hits <- foverlaps(peak_list, peak_DT,
                      by.x=c("chr", "start", "end"),
                      type="any", which=TRUE, nomatch=0)
    # track the number of overlaps of final peak set peaks
    if (!"count" %in% colnames(peak_DT)) {
        peak_DT[hits$yid, count := 1]
        peak_DT[is.na(get("count")), ("count") := 0]
    } else {
        peak_DT[hits$yid, count := get("count") + 1] 
    }
}


#' Internal helper function for \code{consensusPeaks}
#' Take a set of peak files and identify only the reproducible minimally
#' scoring peaks.
#'
#' @param sample_table A data.table object that includes paths to
#'                     valid peak files.
#' @param chr_sizes   A data.table of genome chromosome sizes.
#' @param min_samples A minimum number of samples a peak must be present
#'                    in to keep.
#' @param min_score A minimum peak score to keep an individual peak.
#' @param min_olap  A minimum number of bases between peaks to be 
#'					considered overlapping.
collapsePeaks <- function(sample_table, chr_sizes,
						  min_samples=2, min_score=5, min_olap=1) {
    # create combined peaks
    peaks <- rbindlist(lapply(sample_table$peak_files, fread), idcol="file")
    if (ncol(peaks) == 7) {
        colnames(peaks) <- c("file", "chr", "start", "end",
                             "name", "score", "strand")
    } else if (ncol(peaks) == 11) {
        colnames(peaks) <- c("file", "chr", "start", "end",
                             "name", "score", "strand",
                             "signalValue", "pValue", "qValue", "peak")
    } else {
        warning(paste0("Peak files did not contain a recognizable number", 
                       " of columns (", ncol(peaks), ")"))
        rm(peaks)
        final <- data.table(chr=character(),
                            start=integer(),
                            end=integer(),
                            name=character(),
                            score=numeric(),
                            strand=character(),
                            signalValue=numeric(),
                            pValue=numeric(),
                            qValue=numeric(),
                            peak=integer())
        return(final)
    }
    setkey(peaks, chr, start, end)
    # keep highest scored peaks
    # split by chromosome to minimize memory requirements
    peaks_by_chr   <- split(peaks, peaks$chr)
    hit_aggregator <- function(x) {
        #message(paste0("x: ", unique(x$chr)))  # DEBUG
        peaksGR <- makeGRangesFromDataFrame(x, keep.extra.columns=FALSE)
        hitsGR  <- suppressWarnings(
            findOverlaps(peaksGR, peaksGR,
						 ignore.strand=TRUE, minoverlap=min_olap))
        hits    <- data.table::data.table(xid=queryHits(hitsGR),
                                          yid=subjectHits(hitsGR))
        setkey(hits, xid)
        scores  <- data.table(index=rep(1:nrow(x)), score=x$score)
        setkey(scores, index)
        out     <- hits[scores, nomatch=0]
        keep    <- out[out[,.I[which.max(score)],by=yid]$V1]
        indices <- unique(keep$xid)
        reduced <- x[indices,]
        reduced[start < 0, start := 0]
        return(reduced)
    }
    final <- rbindlist(lapply(peaks_by_chr, hit_aggregator))

    # can't extend past chromosome
    for (i in nrow(chr_sizes)) {
        final[chr == chr_sizes$chr[i] & end > chr_sizes$size[i],
              end := chr_sizes$size[i]]
    }

    # identify reproducible peaks
    peaks[,group := sample_table$sample_name[file]]
    peaks[,file:=NULL]
    final[,file:=NULL]
    peak_list <- splitDataTable(peaks, "group")
    rm(peaks)
    invisible(gc())
    invisible(sapply(peak_list, countReproduciblePeaks, peak_DT=final))

    # keep peaks present in 2 or more individual peak sets
    # keep peaks with score per million >= 5
    final <- final[count >= min_samples & score >= min_score,]
    final[,count := NULL]
    return(final)
}


#' This function is meant to identify a project level set of consensus peaks.
#'
#' @param sample_table A data.table containing sample names and corresponding
#'                     genomes.
#' @param summary_dir A directory path to place results of this analysis
#' @param results_subdir A project results subdirectory path
#' @param assets A data.table containing file assets
#' @param min_samples A minimum number of samples a peak must be present
#'                    in to keep.
#' @param min_score A minimum peak score to keep an individual peak.
#' @param min_olap  A minimum number of bases between peaks to be 
#'					considered overlapping.
#' @keywords consensus peaks
#' @export
consensusPeaks <- function(sample_table, summary_dir, results_subdir, assets,
                           min_samples=2, min_score=5, min_olap=1) {    

    # Produce summary output directory (if needed)
    dir.create(summary_dir, showWarnings = FALSE)

    setDT(sample_table)[assets[asset == 'chrom_sizes', ],
                        c_path := i.path, on = 'sample_name']

    # generate paths to peak files
    sample_table[,peak_files:=.((file.path(
                 results_subdir,
                 sample_table$sample_name,
                 paste0("peak_calling_", sample_table$genome),
                 paste0(sample_table$sample_name,
                 "_peaks_normalized.narrowPeak"))))]

    #Only keep samples with valid peak files
    file_list   <- sample_table$peak_files
    file_exists <- character()
    for (i in 1:length(file_list)) {
        if(file.exists(file.path(file_list[i]))) {
            file_exists <- append(file_exists, file.path(file_list[i]))
        }
    }
    files <- data.table(peak_files=file_exists)
    consensus_peak_files = list()
    if (nrow(files) == 0) {
        return(consensus_peak_files)
    }

    sample_table <- unique(
        sample_table[sample_table$peak_files %in% files$peak_files,])
    
    # Need to group by genome, then create a consensus list by genome!
    st_list = splitDataTable(sample_table, "genome")

    for (g in names(st_list)) {
        if (nrow(st_list[[g]]) == 1) {
            err_msg = paste0("Found only a single valid peak file for ",
                             g, ".")
            warning(err_msg)
            next
        }
        if (nrow(st_list[[g]]) == 0) {
            warning("Unable to find any valid peak files.")
            warning("Confirm peak files exist for your samples.")
            next
        }
        c_path <- unique(sample_table[genome == g, c_path])
        if (file.exists(c_path)) {
            c_size <- fread(c_path)
            colnames(c_size) <- c("chr", "size")
        } else {
            warning("Unable to load the chromosome sizes file.")
            warning(paste0("Confirm that ", c_path,
                           " is present before continuing."))
            final <- NULL
        }
        message(paste0("Calculating ", g, " consensus peak set from ",
                       nrow(st_list[[g]]), " samples..."))
        final <- collapsePeaks(st_list[[g]], c_size,
							   min_samples, min_score, min_olap)

        if (!is.null(final)) {
            # save consensus peak set
            file_name   <- paste0("_", g,"_consensusPeaks.narrowPeak")
            output_file <- file.path(summary_dir,
                                     paste0(project_name, file_name))
            fwrite(final, output_file, sep="\t", col.names=FALSE)
            consensus_peak_files <- c(consensus_peak_files, output_file)
            rm(final)
            invisible(gc())
        } else {
            warning("Unable to produce a consensus peak file.")
            warning("Check that individual peak files exist for your samples.")
        }
    }

    return(consensus_peak_files)
}


#' Read PEPATAC peak coverage files
#'
#' @param prj A PEPr project object
#' @param results_subdir A PEP project results subdirectory path
#' @keywords project peak coverage
#' @export
readPepatacPeakCounts = function(prj, results_subdir) {
    sample_names   <- pepr::sampleTable(prj)$sample_name
    genomes        <- as.list(pepr::sampleTable(prj)$genome)
    names(genomes) <- sample_names
    paths          <- vector("list", length(sample_names))
    names(paths)   <- sample_names

    # Use reference peak coverage file if available
    if (any(file.exists(file.path(results_subdir,
                        sample_names, paste0("peak_calling_", genomes),
                        paste0(sample_names, "_ref_peaks_coverage.bed"))))) {
        peak_file = "_ref_peaks_coverage.bed"
    } else {
        warning(paste0("Peak coverage files are not derived from a ",
                       "singular reference peak set.\n",
                       "Try using --frip-ref-peaks and point to a single ",
                       "reference peak set."))
        peak_file = "_peaks_coverage.bed"
    }

    for (sample in sample_names) {
        paths[[sample]] <- paste(results_subdir, sample,
                                 paste0('peak_calling_', genomes[[sample]]),
                                 paste0(sample, peak_file),
                                 sep="/")
    }

    result <- lapply(paths, function(x){
        info <- file.info(file.path(x))
        if (file.exists(x) && info$size != 0) {
            df <- fread(x)
            colnames(df) <- c("chr", "start", "end", "read_count",
                              "base_count", "width", "frac", "norm")
            gr <- GenomicRanges::GRanges(df) 
        } else {
            gr <- GenomicRanges::GRanges() 
        }
    })
    return(GenomicRanges::GRangesList(Filter(length, result)))
}


#' Produce a project level peak counts table
#'
#' @param sample_table A data.table containing sample names and their 
#'                     corresponding genome
#' @param summary_dir A PEP project summary directory path
#' @param results_subdir A PEP project results subdirectory path
#' @param assets A data.table containing file assets
#' @param poverlap Weight counts by the percentage overlap with peak
#' @param norm Use normalized read counts
#' @param cutoff Only keep peaks present in the `cutoff` number of samples
#' @param min_olap  A minimum number of bases between peaks to be 
#'					considered overlapping.
#' @keywords project peak counts
#' @export
peakCounts <- function(sample_table, summary_dir, results_subdir, assets,
                       poverlap=FALSE, norm=FALSE, cutoff=2, min_olap=1) {
    # Produce output directory (if needed)
    dir.create(summary_dir, showWarnings = FALSE)

    sample_names   <- unique(as.character(sample_table$sample_name))
    genomes        <- as.list(sample_table$genome)
    names(genomes) <- sample_names

    setDT(sample_table)[assets[asset == 'chrom_sizes', ],
                        c_path := i.path, on = 'sample_name']

    # check if coverage files are compressed
    if (any(file.exists(file.path(results_subdir,
                        sample_names, paste0("peak_calling_", genomes),
                        paste0(sample_names, "_ref_peaks_coverage.bed.gz"))))) {
        ext <- ".bed.gz"
    } else if (any(file.exists(file.path(results_subdir,
                        sample_names, paste0("peak_calling_", genomes),
                        paste0(sample_names, "_peaks_coverage.bed.gz"))))) {
        ext <- ".bed.gz"
    } else {
        ext <- ".bed"
    }

    # Use reference peak coverage file if available
    if (any(file.exists(file.path(results_subdir,
                        sample_names, paste0("peak_calling_", genomes),
                        paste0(sample_names, "_ref_peaks_coverage", ext))))) {
        peak_file_name = paste0("_ref_peaks_coverage", ext)
        reference = TRUE
    } else {
        warning("Peak coverage files are not derived from a singular reference peak set.")
        reference = FALSE
        peak_file_name = paste0("_peaks_coverage", ext)
    }
    
    # generate paths to peak coverage files
    sample_table[,peak_files:=.((file.path(
                 results_subdir,
                 sample_table$sample_name,
                 paste0("peak_calling_", sample_table$genome),
                 paste0(sample_table$sample_name, peak_file_name))))]
               
    #Only keep samples with valid peak coverage files
    file_list   <- sample_table$peak_files
    file_exists <- character()
    for (i in 1:length(file_list)) {
        # Check if file exists and is not empty
        info <- file.info(file.path(file_list[i]))
        if(file.exists(file.path(file_list[i])) & info$size != 0) {
            file_exists <- append(file_exists, file.path(file_list[i]))
        }
    }
    files <- data.table(peak_files=file_exists)
    consensus_peak_files = list()
    if (nrow(files) == 0) {
        return(consensus_peak_files)
    }

    sample_table <- unique(
        sample_table[sample_table$peak_files %in% files$peak_files,])
    peak_files   <- sample_table$peak_files

    # Need to group by genome, then create a counts table by genome
    st_list <- splitDataTable(sample_table, "genome")
    
    for (g in names(st_list)) {
        if (nrow(st_list[[g]]) == 1) {
            err_msg <- paste0("Found only a single valid peak file for ",
                              g, ".")
            warning(err_msg)
            next
        }
        if (nrow(st_list[[g]]) == 0) {
            warning("Unable to find any valid peak files.")
            warning("Confirm peak files exist for your samples.")
            next
        }
        c_path <- unique(sample_table[genome == g, c_path])
        if (file.exists(c_path)) {
            c_size <- fread(c_path)
            colnames(c_size) <- c("chr", "size")
        } else {
            warning("Unable to load the chromosome sizes file.")
            warning(paste0("Confirm that ", c_path,
                           " is present before continuing."))
            reduce_dt <- NULL
        }
        message(paste0("Calculating ", g, " peak counts for ",
                       nrow(st_list[[g]]), " samples..."))
        if (reference) {
            read_peaks <- function(x, y) {
                fread(y)
            }
            # Load each peak file as list of named data.tables
            peaks <- mapply(FUN=read_peaks,
                            st_list[[g]]$sample_name,
                            st_list[[g]]$peak_files,
                            SIMPLIFY=FALSE,
                            USE.NAMES=TRUE)
            # Check for identical chr, start, end coordinates in all peak files
            same <- all(sapply(lapply(peaks, function(x) {x[,c(1:3)]}),
                        identical,
                        lapply(peaks, function(x) {x[,c(1:3)]})[[1]]))
            if (same) {
                # Produce counts table
                new_list <- lapply(names(peaks), function(x){
                    colnames(peaks[[x]]) <- c("chr", "start", "end", "name",
                                              "score", "strand", "signalValue",
                                              "pValue", "qValue", "peak",
                                              "read_count", "base_count",
                                              "width", "frac", x)
                    peaks[[x]]
                })
                names(new_list) <- names(peaks)
                reduce_dt       <- Reduce(function(...) merge(..., all=F),
                    lapply(new_list, function(x) {x[,c(1:3,15)]}))
            } else {
                warning(strwrap(prefix = " ", initial = "",
                        "Reference peak set was inconsistent between samples.
                         Pass a single reference peak set with the 
                         `--frip-ref-peaks` argument."))
                return(NULL)
            }
        } else {
            peaks_dt <- data.table(chr=as.character(),
                                   start=as.numeric(),
                                   end=as.numeric(),
                                   read_count=as.numeric(),
                                   base_count=as.numeric(),
                                   width=as.numeric(),
                                   frac=as.numeric(),
                                   norm=as.numeric())

            peaks <- tryCatch(
                {
                    suppressMessages(
                        rbindlist(lapply(st_list[[g]]$peak_files, fread)))
                },
                error=function(e) {
                    message("peakCounts() peak coverage file fread(): ", e)
                    return(NULL)
                },
                warning=function(e) {
                    message("peakCounts() peak coverage file fread(): ", e)
                    return(NULL)
                }
            )

            if (is.null(peaks)) {
                warning(strwrap(prefix = " ", initial = "",
                    "Unable to produce a peak coverage file. Check that 
                     individual peak coverage files are not empty."))
                return(NULL)
            }

            colnames(peaks) <- c("chr", "start", "end", "read_count",
                                 "base_count", "width", "frac", "norm")
            setkey(peaks, chr, start, end)
            peaks_dt  <- rbind(peaks_dt, peaks)
            # Convert to GRanges for more efficient findOverlaps vs data.table
            peaksGR   <- makeGRangesFromDataFrame(peaks_dt,
                                                  keep.extra.columns=TRUE)
            reduceGR  <- reduce(peaksGR)
            
            # instead, different column for each sample is the counts columns,
            # plural
            reduce_dt <- data.table(chr=as.character(seqnames(reduceGR)),
                                    start=start(reduceGR),
                                    end=end(reduceGR))
            f <- function(x) {list(0)}
            # Need to make syntactically valid names
            valid_names <- make.unique(make.names(st_list[[g]]$sample_name))
            reduce_dt[, (valid_names) := f()]
            
            # Report name changes
            original_invalid <- setdiff(
                make.unique(st_list[[g]]$sample_name), valid_names)
            new_valid        <- setdiff(
                valid_names, make.unique(st_list[[g]]$sample_name))
            if(length(new_valid) > 0) {
                warning(strwrap(prefix = " ", initial = "", 
                        "Some sample names were changed to be syntactically
                         valid in R:"))
                warning(paste(capture.output(print(
                        data.frame(Original=original_invalid,
                                   Valid=new_valid))),
                        collapse = "\n"))
            }
            st_list[[g]]$sample_name <- make.unique(make.names(st_list[[g]]$sample_name))
            # for each peak file
            i <- 1
            for (file in st_list[[g]]$peak_files) {
                info <- file.info(file.path(file))
                if (file.exists(file.path(file)) && info$size != 0) {
                    p    <- fread(file)
                    #name <- gsub("_peaks_coverage.bed","", basename(file))
                    name <- make.unique(make.names(st_list[[g]][i]$sample_name))
                    i    <- i + 1
                    colnames(p) <- c("chr", "start", "end", "read_count",
                                     "base_count", "width", "frac", "norm")
                    setkey(p, chr, start, end)
                    
                    reduceGR <- makeGRangesFromDataFrame(reduce_dt)
                    peaksGR  <- makeGRangesFromDataFrame(p)
                    hitsGR   <- findOverlaps(query=reduceGR, subject=peaksGR,
											 minoverlap=min_olap)

                    # Weight counts by percent overlap
                    olap   <- pintersect(reduceGR[queryHits(hitsGR)],
                                         peaksGR[subjectHits(hitsGR)])
                    polap  <- width(olap) / width(peaksGR[subjectHits(hitsGR)])

                    if (poverlap & norm) {
                        counts <- data.table(index=rep(1:nrow(p)),
                                             counts=p$norm*polap)
                    } else if (!poverlap & norm) {
                        counts <- data.table(index=rep(1:nrow(p)),
                                             counts=p$norm)
                    } else if (poverlap & !norm) {
                        counts <- data.table(index=rep(1:nrow(p)),
                                             counts=p$read_count*polap)
                    } else {
                        counts <- data.table(index=rep(1:nrow(p)),
                                             counts=p$read_count)
                    }

                    hits   <- data.table(xid=queryHits(hitsGR),
                                         yid=subjectHits(hitsGR))
                    setkey(hits, yid)
                    setkey(counts, index)
                    out    <- hits[counts, nomatch=0]
                    keep   <- out[out[,.I[which.max(counts)],by=yid]$V1]
                    reduce_dt[keep$xid][[name]] <- keep$counts
                    rm(p)
                    invisible(gc())
                }
            }
            # trim any bad peaks (extend beyond chromosome)
            # can't be negative
            reduce_dt[start < 0, start := 0]
            # ensure sorted
            setorderv(reduce_dt, cols = c("chr", "start"))
            # can't extend past chromosome
            for (i in nrow(c_size)) {
                reduce_dt[chr == c_size$chr[i] & end > c_size$size[i],
                          end := c_size$size[i]]
            }
            columnIndices <- c(4:ncol(reduce_dt))
            # Drop regions with no coverage
            keepRows      <- rowMeans(reduce_dt[, ..columnIndices]) > 0
            reduce_dt     <- reduce_dt[keepRows]
            # identify reproducible peaks
            reduce_dt$count <- apply(reduce_dt[, ..columnIndices], 1,
                                     function(x) sum(x > 0))
            if (length(st_list[[g]]$peak_files) > 1) {
                # keep peaks present in `cutoff` or more individual peak sets
                reduce_dt <- reduce_dt[count >= cutoff,]
            }
            reduce_dt[,count := NULL]
        }
        # Create matrix rownames
        reduce_dt <- cbind(name=paste(reduce_dt$chr,
                                      reduce_dt$start,
                                      reduce_dt$end, sep="_"),
                           reduce_dt)
        reduce_dt <- reduce_dt[,-c("chr","start","end")]

        # save counts table
        if (exists("reduce_dt")) {
                output_file <- file.path(summary_dir,
                    paste0(project_name, "_", g, "_peaks_coverage.tsv"))
                # save consensus peak set
                fwrite(reduce_dt, output_file, sep="\t", col.names=TRUE)
                counts_path <- c(counts_path, output_file)
        } else {
            warning(strwrap(prefix = " ", initial = "",
                    "Unable to produce a peak coverage file. Check that 
                     individual peak coverage files exist for your samples."))
            return(NULL)
        }
    }
    return(counts_path)
}


#' Create and return sample statistics summary data table
#'
#' @param samples A PEP project character vector of sample names
#' @param results_subdir A PEP project results subdirectory path
#' @export
createStatsSummary <- function(samples, results_subdir) {  
    # Create stats_summary file
    missing_files   <- 0
    write(paste0("Creating stats summary..."), stdout())

    for (sample in samples) {
        sample_output_folder <- file.path(results_subdir, sample)
        sample_assets_file   <- file.path(sample_output_folder, "stats.tsv")

        if (!file.exists(sample_assets_file)) {
            missing_files <- missing_files + 1
            next
        }

        t <- fread(sample_assets_file, header=FALSE,
                   col.names=c('stat', 'val', 'annotation'))
        # Remove complete duplicates
        t <- t[!duplicated(t[, c('stat', 'val', 'annotation')],
               fromLast=TRUE),]
        max_time <- suppressWarnings(max(t[stat=="Time",]$val))
        # Keep max(Time) and last(Success)
        t <- t[!duplicated(t[, c('stat', 'annotation')],
               fromLast=TRUE),]
        t[stat=="Time",]$val <- max_time

        t2 <- data.table(t(t$val))
        colnames(t2) <- t$stat
        t2 <- cbind(data.table(sample_name=sample), t2)
        if (exists("stats")) {
            stats <- rbind(stats, t2, fill=TRUE)
        } else {
            stats <- t2
        }
    }

    if (missing_files > 0) {
        warning(sprintf("Stats files missing for %s samples.", missing_files))
    }

    return(stats)
}


#' Create and return assets summary data table
#'
#' @param samples A PEP project character vector of sample names
#' @param results_subdir A PEP project results subdirectory path
#' @export
createAssetsSummary <- function(samples, results_subdir) {  
    # Create assets_summary file
    missing_files   <- 0
    assets  <- data.table(sample_name=character(),
                          asset=character(),
                          path=character(),
                          annotation=character())
    write(paste0("Creating assets summary..."), stdout())

    for (sample in samples) {
        sample_output_folder <- file.path(results_subdir, sample)
        sample_assets_file   <- file.path(sample_output_folder, "assets.tsv")

        if (!file.exists(sample_assets_file)) {
            missing_files <- missing_files + 1
            next
        }

        t <- fread(sample_assets_file, header=FALSE,
                   col.names=c('asset', 'path', 'annotation'))
        t <- t[!duplicated(t[, c('asset', 'path', 'annotation')],
               fromLast=TRUE),]
        t[,sample_name:=sample]
        assets = rbind(assets, t)
    }
    
    if (missing_files > 0) {
        warning(sprintf("Assets files missing for %s samples.", missing_files))
    }

    return(assets)
}

################################################################################
