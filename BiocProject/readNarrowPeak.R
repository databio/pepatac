readNarrowPeak = function(project, results_subdir) {
    cwd = getwd()
    # Construct sample table
    sample_table <- data.table(
        sample_name=pepr::sampleTable(project)$sample_name,
        genome=pepr::sampleTable(project)$genome
    )
    # Identify peak file paths
    sample_table[,peak_file_path:=.((file.path(
                 results_subdir,
                 sample_table$sample_name,
                 paste0("peak_calling_", sample_table$genome),
                 paste0(sample_table$sample_name,
                 "_peaks_normalized.narrowPeak"))))]
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
            fread(x, col.names=c("chr", "start", "end", "name", "score", "strand",
                                 "signalValue", "pValue", "qValue", "peak")))
      }))]
    # Convert to GRangesList and name the individual Granges
    peak_files        <- GenomicRanges::GRangesList(sample_table$peak_file)
    names(peak_files) <- sample_table$sample_name
    setwd(cwd)
    return(peak_files)
}

