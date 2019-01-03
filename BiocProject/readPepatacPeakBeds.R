readPepatacPeakBeds = function(project) {
  # define default column names in GenomicRanges::GRanges objects
  DEFAULT_GRANGES_COLS = c('chr', 'start', 'end')
  # inferring the suffix, which is "peak_calling_" + genome_assembly,
  # see: pepatac.py
  if (length(unique(samples(p)$genome)) != 1)
    stop(paste0("Need one genome assembly, got  ",
                length(unique(samples(p)$genome)),
                ".\nCouldn't infer the path to the files."))
  genome_assembly = unique(samples(project)$genome)
  suffix = paste0("peak_calling_", genome_assembly)
  # inferring prefix, which is "restults_pipeline", 
  # if not profided in PEP config, see: python peppy package
  prefix = ifelse(is.null(config(project)$metadata$results_subdir),
                  "results_pipeline", config(project)$metadata$results_subdir)
  # get output directory from PEP
  outputDir = config(project)$metadata$output_dir
  # get sample names from PEP
  samples_names = samples(project)$sample_name
  # read the data for each sample
  result = lapply(samples_names, function(sample) {
    # use the provided arguments to construct the path
    dir = file.path(outputDir, prefix, sample, suffix)
    # find BED files in the path
    bedFiles = list.files(path=dir, pattern="*.bed")
    # get absolute paths to the BED files
    bedFilesAbs = file.path(dir,bedFiles)
    gr = list()
    # for eache BED file for each sample
    message("reading ",length(bedFiles)," files for sample: ", sample)
    for (i in seq_along(bedFilesAbs)) {
      # read BED file
      df = read.table(bedFilesAbs[i])
      # since the number of columns varies, name the first 3 as default and 
      # the rest metadataX
      colNames = append(
        DEFAULT_GRANGES_COLS,
        paste0("metadata", seq(1,NCOL(df)-length(DEFAULT_GRANGES_COLS))))
      colnames(df) = colNames
      # convert the data.frame to GenomicRanges::GRanges object
      gr[[i]] = GenomicRanges::GRanges(df)
    }
    names(gr) = bedFiles
    return(gr)
  })
  names(result) = samples_names
  return(result)
}