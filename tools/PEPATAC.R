#! /usr/bin/env Rscript
###############################################################################
# PEPATAC R parser

###############################################################################
version <- 0.4
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
        "\t reduce\t reduce overlapping peaks\n"
    )
    message(usage)
} else if (!is.na(subcmd) && tolower(subcmd) == "frif") {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: frif \t plot fraction of reads in features\n\n",
        " -n, --sample_name\t   Sample name.\n",
        " -r, --reads\t\t   Number of mapped reads.\n",
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
        sample_name <- opt_get(name = c("sample_name", "n"), required=TRUE,
                               description="Sample name.")
        reads       <- opt_get(name = c("reads", "r"), required=TRUE,
                               description="Number of mapped reads.")
        output_name <- opt_get(name = c("output_name", "o"), required=TRUE,
                               description="Output file name.")
        numArgs     <- length(opt_get_args())
        bed         <- opt_get(name = c("bed", "b"), required=TRUE,
                               n=(numArgs - 8),
                               description="Coverage file(s).")

        plotFRiF(sample_name = sample_name,
                 num_reads = reads,
                 output_name = output_name,
                 BED_file = bed)
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

        TSSfile    <- opt_get(name = c("input", "i"), required=TRUE, n=inArgs,
                              description="TSS enrichment file.")

        plotTSS(TSS_file = TSSfile)
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
        fragL_dis1  <- opt_get(name = c("pdf", "p"), required=TRUE,
                               description="PDF output file name.")
        fragL_dis2  <- opt_get(name = c("text", "t"), required=TRUE,
                               description="Fragment length distribution stats file.")

        plotFLD(fragL = fragL,
                fragL_count = fragL_count,
                fragL_dis1 = fragL_dis1,
                fragL_dis2 = fragL_dis2)
    }
} else if (!is.na(subcmd) && tolower(subcmd) == "anno") {
    usage <- paste0(
        "\n",
        "Usage:   PEPATAC.R [command] {args}\n",
        "Version: ", version, "\n\n",
        "Command: anno \t plot peak and read annotation distributions\n\n",
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
        output <- opt_get(name = c("output", "o"), required=FALSE, default=".",
                          description="Parent output directory.")

        plotAnno(input = input,
                 type = type,
                 feat = feat,
                 genome = genome,
                 output = output)
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
        "Command: bigbed \t convert narrowPeak format to bigBED\n\n",
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
        "\t reduce\t reduce overlapping peaks\n"
    )
    message(usage)
    quit()
}
