runCOCOA = function(project, results_subdir, summary_dir,
                    genome, conditions, lolaPath) {
    # verify condition table
    if(!all(c("sample_name", "condition") %in% tolower(colnames(conditions)))) {
        warning("Conditions must include 'sample_name' and 'condition' columns.")
        return(1)
    }
    # load required packages
    required_packages <- c("COCOA", "LOLA", "data.table")
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
            warning()
            return(1)
        }
    }
    # Load peak count table
    count_table_path = file.path(summary_dir,
                                 paste0(config(project)$name, "_", genome,
                                        "_peaks_coverage.tsv"))
    if(file.exists(count_table_path)) {
        ct <- data.table::fread(count_table_path)
    } else {
        warning(paste0("Could not load ", count_table_path))
        return(1)
    }
    # Subset count table by condition table
    cols <- colnames(ct)[c(TRUE ,colnames(ct) %in% conditions$sample_name)]
    ct   <- ct[, cols, with=FALSE]
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
    
    #message("Produce signal coordinates (peaks)")
    # Generate signal coordinates
    # coords <- data.frame(coordinates=rownames(m))
    # message("coords")
    # print(coords[1:4,1])
    # message("rownames(m)")
    # print(head(rownames(m),4))
    # message("remove matching rows")
    delIdx <- c(grep("random", rownames(m)),
                grep("GL", rownames(m)),
                grep("chrUn", rownames(m)))
    #print(head(delIdx))
    # coords2 <- coords[!delIdx,]
    # message("cleaned up coords")
    # #print(coords2[1:4,1])
    # message("split column")
    # eval(setDT(coords)[,
        # c("chr", "start", "end") := tstrsplit(coords$coordinates, "_",
        # type.convert = TRUE, fixed = TRUE)], envir=globalenv())
    #peaks  <- coords[,-1]
    coord_list <- data.table::tstrsplit(rownames(m)[-delIdx], "_",
                                        type.convert = TRUE, fixed = TRUE)
    
    #print(data.table::tstrsplit(coords$coordinates, "_", type.convert = TRUE, fixed = TRUE))
    #message("check class")
    #message(class(coord_list))
    #message(length(coord_list))
    #message("build peaks data.table")
    peaks <- data.table::data.table(chr=coord_list[[1]],
                                    start=coord_list[[2]],
                                    end=coord_list[[3]])
    #message("peak example:")
    #print(peaks[1:3,])
    #peaks  <- eval(separate(coords, col="coordinates", sep="_", into=c("chr", "start", "end")), envir=globalenv())
    #message("set column type")
    #peaks$start <- as.numeric(peaks$start)
    #peaks$end   <- as.numeric(peaks$end)

    # Load region database    
    regionSetDB <- suppressWarnings(loadRegionDB(lolaPath))
    # Load the ENCODE transcription factor binding sites
    regionAnno    <- regionSetDB$regionAnno
    collectionInd <- regionAnno$collection %in% "encode_tfbs"
    #message("load just TFBS")
    TFGR          <- GRangesList(regionSetDB$regionGRL[collectionInd])
    regionAnno    <- regionAnno[collectionInd, ]
    regionSetName        <- regionAnno$filename
    regionSetDescription <- regionAnno$description
    #message("remove regionSetDB")
    # Remove full DB to release memory
    rm("regionSetDB")

    # Subset principal components to annotate
    PCsToAnnotate      <- paste0("PC", 1:6)
    correctSampleOrder <- 1:nrow(mat)
    message("run COCOA")
    tfRSS <- local(COCOA::runCOCOA(genomicSignal=loadings,
                             signalCoord=peaks,
                             GRList=TFGR,
                             signalCol=PCsToAnnotate,
                             sampleOrder=correctSampleOrder,
                             targetVar=scores,
                             scoringMetric="proportionWeightedMean",
                             absVal=TRUE))
    tfRSS$regionSetName        <- regionSetName
    tfRSS$regionSetDescription <- regionSetDescription
    return(tfRSS)    
}

