#! /usr/bin/env Rscript
###############################################################################
# PEPATAC R parser

###############################################################################
version <- 0.5
##### Load dependencies #####

required_libraries <- c("PEPATACr")
for (i in required_libraries) {
    loadLibrary <- tryCatch (
        {
            suppressPackageStartupMessages(
                suppressWarnings(library(i, character.only=TRUE)))
        },
        error=function(e) {
            message("Error: Install the \"", i,
                    "\" R package before proceeding.")
            message('i.e. devtools::install_github("databio/pepatac",',
                    ' subdir="PEPATACr")')
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

#### Identify command ####

subcmd <- opt_get_verb()

if (is.na(subcmd) || grepl("/R", subcmd)) {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: frif\t plot fraction of reads in features\n",
        "\t tss\t plot TSS enrichment\n",
        "\t frag\t plot fragment length distribution\n",
        "\t anno\t plot peak and read annotation distributions\n",
        "\t bigbed\t convert narrowPeak format to bigBED\n",
        "\t reduce\t reduce overlapping peaks\n",
        "\t summarize\t plot project summary statistics\n"
    )
    message(usage)
} else if (!is.na(subcmd) && tolower(subcmd) == "frif") {
    usage <- paste0(
        "\n",
        "Usage:   PEPPRO.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: frif \t plot fraction of reads in features\n\n",
        " -s, --sample_name\t   Sample name.\n",
        " -n, --num_reads\t\t   Number of mapped reads.\n",
        " -z, --size\t\t   Size of genome (bp).\n",
        " -y, --type\t Choose plot type: cFRiF, FRiF, or Both.\n",
        " -o, --output_name\t   Output file name.\n",
        " -b, --bed\t\t   Coverage file(s).\n"
    )

    help <- opt_get(name = c("help", "?", "h"), required=FALSE,
                    default=FALSE, n=0)
    if (!help) {
        help <- suppressWarnings(
            if(length(opt_get_args()) == 1) {TRUE} else {FALSE}
        )
    }
    if (help) {
        message(usage)
        quit()
    } else {
        sample_name <- opt_get(name = c("sample_name", "s"), required=TRUE,
                               description="Sample name.")
        num_reads   <- opt_get(name = c("num_reads", "n"), required=TRUE,
                               description="Number of mapped reads (or bases).")
        genome_size <- opt_get(name = c("size", "z"), required=TRUE,
                               description="Size of genome (bp).")
        type        <- opt_get(name = c("type", "y"), required=FALSE, default="cfrif",
                               description="Choose plot type: cFRiF, FRiF, or Both (Default = cfrif).")
        reads       <- opt_get(name = c("reads", "r"), required=FALSE, default=FALSE,
                               description="Calculate using reads (TRUE) or bases (FALSE) (Default = FALSE).")
        output_name <- opt_get(name = c("output_name", "o"), required=TRUE,
                               description="Output file name.")
        numArgs     <- length(opt_get_args())
        argGap      <- ifelse(reads, 13, 12)
        bed         <- opt_get(name = c("bed", "b"), required=TRUE,
                               n=(numArgs - argGap),
                               description="Coverage file(s).")

        p <- plotFRiF(sample_name = sample_name,
                      num_reads = as.numeric(num_reads),
                      genome_size = as.numeric(genome_size),
                      type = tolower(type),
                      reads = reads,
                      output_name = output_name,
                      bedFile = bed)

        if (tolower(type) == "both") {
            pdf(file = paste0(tools::file_path_sans_ext(output_name), ".pdf"),
                height = 5.45, width = 8.39, useDingbats=F)
            suppressWarnings(print(p))
            invisible(dev.off())
            png(filename = paste0(tools::file_path_sans_ext(output_name), ".png"),
                height = 550, width=850)
            suppressWarnings(print(p))
            invisible(dev.off())
        } else {
            pdf(file = paste0(tools::file_path_sans_ext(output_name), ".pdf"),
                height = 4, width = 4, useDingbats=F)
            suppressWarnings(print(p))
            invisible(dev.off())
            png(filename = paste0(tools::file_path_sans_ext(output_name), ".png"),
                height = 275, width=275)
            suppressWarnings(print(p))
            invisible(dev.off())
        }
        

        if (exists("p")) {
            write(paste0("Cumulative ", type, " plot completed!\n"), stdout())
        } else {
            write(paste0("Unable to produce ", type, " plot!\n"), stdout())
        }
    }
} else if (!is.na(subcmd) && tolower(subcmd) == "tss") {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: tss \t plot TSS enrichment\n\n",
        " -i, --input\t TSS enrichment file.\n"
    )

    help <- opt_get(name = c("help", "?", "h"), required=FALSE,
                    default=FALSE, n=0)
    if (!help) {
        help <- suppressWarnings(
            if(length(opt_get_args()) == 1) {TRUE} else {FALSE}
        )
    }
    if (help) {
        message(usage)
        quit()
    } else {
        TSS_CUTOFF <- 6
        # get arguments
        a   <- opt_get_args()
        # Determine the number of input files
        inArgs <- 0
        p      <- 1
        val    <- a[p]
        while (!(val %in% c("-i", "--input"))) {
            p   <- p + 1
            val <- a[p]
        }
        while (p < length(opt_get_args())) {
            p   <- p + 1
            val <- a[p]
            if (!(val %in% c("-i", "--input"))) {
                inArgs <- inArgs + 1
            }
        }

        TSSfile     <- opt_get(name = c("input", "i"), required=TRUE, n=inArgs,
                               description="TSS enrichment file.")

        p           <- plotTSS(TSSfile = TSSfile)

        sample_name <- sampleName(TSSfile[1])

        png(filename = paste0(sample_name, "_TSS_enrichment.png"),
            width = 275, height = 275)
        suppressWarnings(print(p))
        invisible(dev.off())

        pdf(file = paste0(sample_name, "_TSS_enrichment.pdf"),
            width = 4, height = 4, useDingbats=F)
        suppressWarnings(print(p))
        invisible(dev.off())

        if (exists("p")) {
            write("TSS enrichment plot completed!\n", stdout())
        } else {
            write("Unable to produce TSS enrichment plot!\n", stdout())
        }
    }
} else if (!is.na(subcmd) && tolower(subcmd) == "frag") {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: frag \t plot fragment length distribution\n\n",
        " -l, --frag_len\t\t Column of fragment lengths.\n",
        " -c, --frag_count\t Counts of each fragment length.\n",
        " -p, --pdf\t\t PDF output file name.\n",
        " -t, --text\t\t Fragment length distribution stats file.\n"
    )

    help <- opt_get(name = c("help", "?", "h"), required=FALSE,
                    default=FALSE, n=0)
    if (!help) {
        help <- suppressWarnings(
            if(length(opt_get_args()) == 1) {TRUE} else {FALSE}
        )
    }
    if (help) {
        message(usage)
        quit()
    } else {
        fragL       <- opt_get(name = c("frag_len", "l"), required=TRUE,
                               description="Column of fragment lengths.")
        fragL_count <- opt_get(name = c("frag_count", "c"), required=TRUE,
                               description="Counts of each fragment length.")
        fragL_name  <- opt_get(name = c("pdf", "p"), required=TRUE,
                               description="PDF output file name.")
        fragL_txt   <- opt_get(name = c("text", "t"), required=TRUE,
                               description="Fragment length distribution stats file.")

        p <- plotFLD(fragL = fragL,
                     fragL_count = fragL_count,
                     fragL_txt = fragL_txt,
                     max_fragment = 600)

        # Save plot to pdf file
        pdf(file=fragL_name, width = 4, height = 4, useDingbats=F)
        suppressWarnings(print(p))
        invisible(dev.off())

        # Save plot to png file
        outfile_png <- gsub('pdf', 'png', fragL_name)
        png(filename=outfile_png, width = 275, height = 275)
        suppressWarnings(print(p))
        invisible(dev.off())

        if (exists("p")) {
            write("Fragment distribution plot completed!\n", stdout())
        } else {
            write("Unable to produce fragment distribution plot!\n", stdout())
        }
    }
} else if (!is.na(subcmd) && tolower(subcmd) == "anno") {
    # TODO: split into multiple functions
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: anno \t plot peak and read annotation distributions\n\n",
        " -p, --plot\t Choose plot: Chromosome, TSS, or Genomic distributions",
        " -i, --input\t Input file to be annotated.\n",
        " -t, --type\t Input type: np (narrowPeak) or bed.\n",
        " -f, --feat\t BED6 file containing genome annotations.\n",
        " -g, --genome\t Genome name (e.g. hg38).\n",
        " -o, --output\t Parent output directory.\n"
    )

    help <- opt_get(name = c("help", "?", "h"), required=FALSE,
                    default=FALSE, n=0)
    if (!help) {
        help <- suppressWarnings(
            if(length(opt_get_args()) == 1) {TRUE} else {FALSE}
        )
    }
    if (help) {
        message(usage)
        quit()
    } else {
        plot   <- opt_get(name = c("plot", "p"), required=FALSE,
                          default="chromosome",
                          description="Choose plot: Chromosome, TSS, or Genomic distributions (Default = Chromosome).")
        input  <- opt_get(name = c("input", "i"), required=TRUE,
                          description="Input file to be annotated.")
        type   <- opt_get(name = c("type", "t"), required=FALSE,
                          default="np",
                          description="Input type: np (narrowPeak) or bed.")
        feat   <- opt_get(name = c("feat", "f"), required=TRUE,
                          description="BED6 file containing genome annotations.")
        genome <- opt_get(name = c("genome", "g"), required=FALSE,
                          default="hg38",
                          description="Genome name (e.g. hg38).")
        output_name <- opt_get(name = c("output", "o"), required=TRUE,
                               description="Output file name.")

        p <- plotAnno(plot = plot,
                      input = input,
                      type = type,
                      feat = feat,
                      genome = genome,
                      output = output_name)

        pdf(file = paste0(tools::file_path_sans_ext(output_name), ".pdf"),
            width = 7, height = 7, useDingbats=F)
        suppressMessages(suppressWarnings(print(p)))
        invisible(dev.off())
             
        # Save plot to png file
        png(filename = paste0(tools::file_path_sans_ext(output_name), ".png"),
            width = 480, height = 480)
        suppressMessages(suppressWarnings(print(p)))
        invisible(dev.off())

        if (exists("p")) {
            write(paste0(plot, " distribution plot completed!\n"), stdout())
        } else {
            write(paste0("Unable to produce ", plot, " distribution plot!\n"), stdout())
        }
    }
} else if (!is.na(subcmd) && tolower(subcmd) == "bigbed") {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: bigbed \t convert narrowPeak format to bigBED\n\n",
        " -i, --input\t\t Path to narrowPeak file.\n",
        " -c, --chr_sizes\t Genome chromosome sizes file. <Chr> <Size>.\n",
        " -t, --ucsc_tool\t Path to UCSC tool \"bedToBigBed\".\n",
        " -k, --keep\t\t Keep BED format intermediate file (optional).\n"
    )

    help <- opt_get(name = c("help", "?", "h"), required=FALSE,
                    default=FALSE, n=0)
    if (!help) {
        help <- suppressWarnings(
            if(length(opt_get_args()) == 1) {TRUE} else {FALSE}
        )
    }
    if (help) {
        message(usage)
        quit()
    } else {
        input     <- opt_get(name = c("input", "i"), required=TRUE,
                             description="Path to narrowPeak file.")
        chr_sizes <- opt_get(name = c("chr_sizes", "c"), required=TRUE,
                             description="Genome chromosome sizes file. <Chr> <Size>.")
        ucsc_tool <- opt_get(name = c("ucsc_tool", "t"), required=TRUE,
                             description="Path to UCSC tool \"bedToBigBed\".")
        keep      <- opt_get(name = c("keep", "k"), required=FALSE,
                             default=FALSE,
                             description="Keep BED format intermediate file.")

        narrowPeakToBigBed(input=input,
                           chr_sizes=chr_sizes,
                           ucsc_tool=ucsc_tool,
                           keep=keep)
    }
} else if (!is.na(subcmd) && tolower(subcmd) == "reduce") {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: reduce \t reduce overlapping peaks\n\n",
        " -i, --input\t\t Path to narrowPeak file.\n",
        " -c, --chr_sizes\t Genome chromosome sizes file. <Chr> <Size>.\n",
        " -o, --output\t\t Output file (optional).\n"
    )

    help <- opt_get(name = c("help", "?", "h"), required=FALSE,
                    default=FALSE, n=0)
    if (!help) {
        help <- suppressWarnings(
            if(length(opt_get_args()) == 1) {TRUE} else {FALSE}
        )
    }
    if (help) {
        message(usage)
        quit()
    } else {
        input     <- opt_get(name = c("input", "i"), required=TRUE,
                             description="Path to narrowPeak file.")
        chr_sizes <- opt_get(name = c("chr_sizes", "c"), required=TRUE,
                             description="Genome chromosome sizes file. <Chr> <Size>.")
        output    <- opt_get(name = c("output", "o"), required=FALSE,
                             default=NULL, description="Output file.")

        reducePeaks(input=input,
                    chr_sizes=chr_sizes,
                    output=output)
    }
} else if (!is.na(subcmd) && tolower(subcmd) == "summarize") {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: summarize \t plot project summary statistics\n\n",
        " -i, --input\t\t PEP configuration file.\n"
    )

    help <- opt_get(name = c("help", "?", "h"), required=FALSE,
                    default=FALSE, n=0)
    if (!help) {
        help <- suppressWarnings(
            if(length(opt_get_args()) == 1) {TRUE} else {FALSE}
        )
    }
    if (help) {
        message(usage)
        quit()
    } else {
        input <- opt_get(name = c("input", "i"), required=TRUE,
                         description="PEP configuration file.")

        reducePeaks(pep=input)
    }
} else {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: \t frif\t plot fraction of reads in features\n",
        "\t tss\t plot TSS enrichment\n",
        "\t frag\t plot fragment length distribution\n",
        "\t anno\t plot peak and read annotation distributions\n",
        "\t bigbed\t convert narrowPeak format to bigBED\n",
        "\t reduce\t reduce overlapping peaks\n",
        "\t summarize\t plot project summary statistics\n"
    )
    message(usage)
    quit()
}
