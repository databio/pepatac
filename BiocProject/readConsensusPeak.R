readConsensusPeak = function(project, summary_dir) {
    cwd = getwd()
    # Construct sample table
    sample_table <- data.table(
        genome=unique(pepr::sampleTable(project)$genome)
    )
    sample_table[,peak_file_path:=.(file.path(
                 summary_dir,
                 paste0(config(project)$name, "_", sample_table$genome,
                        "_consensusPeaks.narrowPeak")
                 ))]
    # Only keep samples with valid peak files
    file_list   <- sample_table$peak_file_path
    file_exists <- character()
    for (i in 1:length(file_list)) {
        if(file.exists(file.path(file_list[i]))) {
            file_exists <- append(file_exists, file.path(file_list[i]))
        }
    }
    files <- data.table(peak_file_path=file_exists)
    consensus_peak_files = list()
    if (nrow(files) == 0) {
        warning("No valid peak files exist.")
        return(GenomicRanges::GRangesList())
    }
    # Ensure duplicates do not exist
    sample_table <- unique(
        sample_table[sample_table$peak_file_path %in% files$peak_file_path,])
    # Load peak files as Granges objects
    sample_table[, peak_file := .(lapply(
      peak_file_path,
      function(x) {
        GenomicRanges::GRanges(
            fread(x, col.names=c("chr", "start", "end", "name", "score",
                                 "strand", "signalValue", "pValue", "qValue",
                                 "peak")))
      }))]
    # Convert to GRangesList and name the individual Granges
    peak_files        <- GenomicRanges::GRangesList(sample_table$peak_file)
    names(peak_files) <- sample_table$genome
    setwd(cwd)
    return(peak_files)
}

