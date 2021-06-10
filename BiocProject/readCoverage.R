readCoverage = function(project, results_subdir) {
    cwd = getwd()
    # Construct sample table
    sample_table <- data.table(
        sample_name=pepr::sampleTable(project)$sample_name,
        genome=pepr::sampleTable(project)$genome
    )
    # Check if coverage files are compressed
    if (any(file.exists(file.path(results_subdir,
                        sample_table$sample_name,
                        paste0("peak_calling_", sample_table$genome),
                        paste0(sample_table$sample_name,
                               "_ref_peaks_coverage.bed.gz"))))) {
        ext <- ".bed.gz"
    } else if (any(file.exists(file.path(results_subdir,
                        sample_table$sample_name,
                        paste0("peak_calling_", sample_table$genome),
                        paste0(sample_table$sample_name,
                               "_peaks_coverage.bed.gz"))))) {
        ext <- ".bed.gz"
    } else {
        ext <- ".bed"
    }
    # Use reference peak coverage file if available
    if (any(file.exists(file.path(results_subdir,
                        sample_table$sample_name,
                        paste0("peak_calling_", sample_table$genome),
                        paste0(sample_table$sample_name,
                               "_ref_peaks_coverage", ext))))) {
        peak_file_name = paste0("_ref_peaks_coverage", ext)
        reference = TRUE
    } else {
        warning("Peak coverage files are not derived from a singular reference peak set.")
        reference = FALSE
        peak_file_name = paste0("_peaks_coverage", ext)
    }
    # Construct paths to peak coverage files
    sample_table[,cov_file_path:=.((file.path(
                 results_subdir,
                 sample_table$sample_name,
                 paste0("peak_calling_", sample_table$genome),
                 paste0(sample_table$sample_name, peak_file_name))))]
    # Only keep samples with valid peak files
    file_list   <- sample_table$cov_file_path
    file_exists <- character()
    for (i in 1:length(file_list)) {
        if(file.exists(file.path(file_list[i]))) {
            file_exists <- append(file_exists, file.path(file_list[i]))
        }
    }
    files <- data.table(cov_file_path=file_exists)
    if (nrow(files) == 0) {
        warning("No valid peak files exist.")
        return(data.table())
    }
    # Ensure duplicates do not exist
    sample_table <- unique(
        sample_table[sample_table$cov_file_path %in% files$cov_file_path,])
    # Column names are dependent on source file
    if (reference) {
        column_names <- c("chr", "start", "end", "name", "score", "strand",
                          "signalValue", "pValue", "qValue", "peak",
                          "read_count", "base_count", "width", "frac")
    } else {
        column_names <- c("chr", "start", "end", "read_count",
                          "base_count", "width", "frac", "norm")
    }
    # Load coverage files and return list of data.tables
    sample_table[, cov_file := .(lapply(cov_file_path,
                                        fread, col.names=column_names))]
    # sample_table[, cov_file := .(lapply(
      # cov_file_path, function(x) {
        # x <- fread(x, col.names=column_names)
        # data.table(x)
    # }))]
    cov_files        <- sample_table$cov_file
    names(cov_files) <- sample_table$sample_name
    setwd(cwd)
    return(cov_files)
}
