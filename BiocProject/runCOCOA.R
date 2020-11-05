runCOCOA = function(project, results_subdir, summary_dir,
                    genome, conditions, lolaPath) {
    # verify condition table
    if(!all(c("sample_name", "condition") %in% tolower(colnames(conditions)))) {
        quit("Conditions must include 'sample_name' and 'condition' columns.")
    }
    # load required packages
    required_packages <- c("COCOA", "LOLA", "PEPATACr", "tidyr")
    for (package in required_packages) {
        loadLibrary <- tryCatch (
            {
                suppressPackageStartupMessages(
                    suppressWarnings(library(package, character.only=TRUE)))
            },
            error=function(e) {
                message("Error: Install the \"", package,
                        "\" library before proceeding.")
                return(NULL)
            },
            warning=function(e) {
                message(e)
                return(1)
            }
        )
        if (length(loadLibrary)!=0) {
            suppressWarnings(library(package, character.only=TRUE))
        } else {
            quit()
        }
    }
    # Load peak count table
    count_table_path = file.path(summary_dir,
                                 paste0(config(project)$name, "_", genome,
                                        "_peaks_coverage.tsv"))
    if(file.exists(count_table_path)) {
        ct <- fread(count_table_path)
    } else {
        quit(paste0("Could not load ", count_table_path))
    }
    # Subset count table by condition table
    cols <- colnames(ct)[c(TRUE ,colnames(ct) %in% conditions$sample_name)]
    ct   <- ct[,..cols]
    # Generate matrix
    m           <- as.matrix(ct[, 2:ncol(ct)])
    rownames(m) <- ct$name
    mat <- t(m)
    mat <- mat[, -grep("random", colnames(mat))]
    mat <- mat[, -grep("GL", colnames(mat))]
    mat <- mat[, -grep("chrUn", colnames(mat))]
    pca              <- prcomp(mat)
    row.names(pca$x) <- rownames(mat)
    loadings         <- pca$rotation
    scores           <- pca$x
    rownames(scores) <- rownames(mat)
    # Load region database    
    regionSetDB <- loadRegionDB(lolaPath)
    # Load the ENCODE transcription factor binding sites
    regionAnno    <- regionSetDB$regionAnno
    collectionInd <- regionAnno$collection %in% "encode_tfbs"
    TFGR          <- GRangesList(regionSetDB$regionGRL[collectionInd])
    regionAnno    <- regionAnno[collectionInd, ]
    regionSetName        <- regionAnno$filename
    regionSetDescription <- regionAnno$description

    # Remove full DB to release memory
    rm("regionSetDB")

    # Generate signal coordinates
    pos   <- data.table(rownames(m))
    pos   <- pos[- grep("random", pos$V1),]
    pos   <- pos[- grep("GL", pos$V1),]
    pos   <- pos[- grep("chrUn", pos$V1),]
    peaks <- separate(pos, col="V1", sep="_", into=c("chr", "start", "end"))
    peaks$start <- as.numeric(peaks$start)
    peaks$end   <- as.numeric(peaks$end)

    # Subset principal components to annotate
    PCsToAnnotate      <- paste0("PC", 1:6)
    correctSampleOrder <- 1:nrow(mat)

    tfRSS <- runCOCOA(genomicSignal=loadings,
                      signalCoord=peaks,
                      GRList=TFGR,
                      signalCol=PCsToAnnotate,
                      sampleOrder=correctSampleOrder,
                      targetVar=scores,
                      scoringMetric="proportionWeightedMean",
                      absVal=TRUE)
    tfRSS$regionSetName        <- regionSetName
    tfRSS$regionSetDescription <- regionSetDescription
    return(tfRSS)    
}

